import 'package:flutter/material.dart';

import '../../../../shared/layout/card_tile/index.dart';
import '../../../../shared/ui/responsive_info_list/index.dart';
import '../../../../shared/ui/sun_info/index.dart';
import '../../../../shared/utils/adjustable_size/index.dart';

class ExtraWeatherInfoData {
  ExtraWeatherInfoData({
    required this.feelsLike,
    required this.humidity,
    required this.chanceOfRain,
    required this.chanceOfSnow,
    required this.pressure,
    required this.visibility,
    required this.uv,
  });

  final int feelsLike;
  final int humidity;
  final int chanceOfRain;
  final int chanceOfSnow;
  final int pressure;
  final int visibility;
  final int uv;
}

class WindData {
  WindData({required this.speed, required this.direction});

  final double speed;
  final String direction;
}

class AdditionalInformationTile extends StatelessWidget {
  const AdditionalInformationTile({
    super.key,
    required this.sunData,
    required this.extraWeatherInfoData,
    required this.windData,
  });

  final SunData sunData;
  final WindData windData;
  final ExtraWeatherInfoData extraWeatherInfoData;

  @override
  Widget build(BuildContext context) {
    ScreenBasedSize.instance.init(context);

    final contentMaxWidth = ScreenBasedSize.instance.getContentMaxWidth();
    final tilesSpacing = ScreenBasedSize.instance.scaleByUnit(2.7);

    final extraWeatherData = <String, String>{
      'Feels like': '${extraWeatherInfoData.feelsLike}°',
      'Humidity': '${extraWeatherInfoData.humidity}%',
      'Chance of rain': '${extraWeatherInfoData.chanceOfRain}%',
      'Chance of snow': '${extraWeatherInfoData.chanceOfSnow}%',
      'Pressure': '${extraWeatherInfoData.pressure} mbar',
      'Visibility': '${extraWeatherInfoData.visibility} km',
      'UV': extraWeatherInfoData.uv.toString(),
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _WidgetTitle(),

        Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: contentMaxWidth),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: tilesSpacing,
              children: [
                Flexible(
                  child: Column(
                    spacing: tilesSpacing,
                    children: [
                      CardTile(
                        child: _WindInfoWidget(
                          windDirection: windData.direction,
                          windSpeed: windData.speed,
                        ),
                      ),

                      CardTile(child: SunInfoWidget(data: sunData)),
                    ],
                  ),
                ),

                Flexible(
                  child: CardTile(
                    child: ResponsiveInfoList(data: extraWeatherData),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _WidgetTitle extends StatelessWidget {
  const _WidgetTitle();

  @override
  Widget build(BuildContext context) {
    ScreenBasedSize.instance.init(context);
    final fontSize = ScreenBasedSize.instance.scaleByUnit(6);

    return Text(
      'Additional Information',
      style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
      overflow: TextOverflow.clip,
    );
  }
}

class _WindInfoWidget extends StatelessWidget {
  const _WindInfoWidget({required this.windDirection, required this.windSpeed});

  final String windDirection;
  final double windSpeed;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final constraintsMaxWidth = constraints.maxWidth;
        final fontSize = AdjustableSize.scaleByUnit(constraintsMaxWidth, 10.5);
        final iconSize = AdjustableSize.scaleByUnit(constraintsMaxWidth, 20);
        final spacing = AdjustableSize.scaleByUnit(constraintsMaxWidth, 1.9);

        return Row(
          spacing: spacing,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    windDirection,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: fontSize,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  Text(
                    '$windSpeed km/h',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: fontSize,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ],
              ),
            ),

            Flexible(flex: 1, child: Icon(Icons.air, size: iconSize)),
          ],
        );
      },
    );
  }
}

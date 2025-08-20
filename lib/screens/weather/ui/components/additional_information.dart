import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../app/router/router.gr.dart';
import '../../../../shared/layout/card_tile/index.dart';
import '../../../../shared/ui/responsive_info_list/index.dart';
import '../../../../shared/ui/sun_info/index.dart';
import '../../../../shared/ui/widget_title/index.dart';
import '../../../../shared/utils/adjustable_size/index.dart';
import '../../../../shared/utils/get_moon_phase_image_path/index.dart';

class MoonInfoItemData {
  MoonInfoItemData({required this.phaseImagePath, required this.phase});

  final String phaseImagePath;
  final String phase;
}

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

class AdditionalInformation extends StatelessWidget {
  const AdditionalInformation({super.key});

  @override
  Widget build(BuildContext context) {
    final extraWeatherInfoData = ExtraWeatherInfoData(
      feelsLike: 25,
      chanceOfRain: 95,
      chanceOfSnow: 0,
      humidity: 73,
      pressure: 1017,
      visibility: 10,
      uv: 3,
    );

    final windData = WindData(direction: 'West', speed: 17.6);
    final sunData = SunData(sunriseTime: '05:28', sunsetTime: '20:45');

    final moonInfoItem = MoonInfoItemData(
      phase: 'First Quarter',
      phaseImagePath: getMoonPhaseImagePath('First Quarter'),
    );

    ScreenBasedSize.instance.init(context);

    final contentMaxWidth = ScreenBasedSize.instance.getContentMaxWidth();
    final tilesSpacing = ScreenBasedSize.instance.scaleByUnit(2.7);

    final extraWeatherData = <String, String>{
      'Feels like': '${extraWeatherInfoData.feelsLike}°',
      'Humidity': '${extraWeatherInfoData.humidity}%',
      'Pressure': '${extraWeatherInfoData.pressure} mbar',
      'Visibility': '${extraWeatherInfoData.visibility} km',
    };

    final precipitationData = <String, String>{
      'Chance of rain': '${extraWeatherInfoData.chanceOfRain}%',
      'Chance of snow': '${extraWeatherInfoData.chanceOfSnow}%',
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const WidgetTitle(title: 'Additional Information'),

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

                      CardTile(child: SunInfo(data: sunData)),
                      CardTile(child: _MoonInfoWidget(item: moonInfoItem)),
                    ],
                  ),
                ),

                Flexible(
                  child: Column(
                    spacing: tilesSpacing,
                    children: [
                      CardTile(
                        child: ResponsiveInfoList(data: extraWeatherData),
                      ),
                      CardTile(
                        child: ResponsiveInfoList(data: precipitationData),
                      ),
                    ],
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

class _MoonInfoWidget extends StatelessWidget {
  const _MoonInfoWidget({required this.item});

  final MoonInfoItemData item;

  @override
  Widget build(BuildContext context) {
    ScreenBasedSize.instance.init(context);

    return GestureDetector(
      onTap: () => context.router.push(const MoonInfoRoute()),

      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final constraintsMaxWidth = constraints.maxWidth;
          final iconSize = AdjustableSize.scaleByUnit(constraintsMaxWidth, 20);
          final spacing = AdjustableSize.scaleByUnit(constraintsMaxWidth, 1.9);

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                spacing: spacing,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 3,
                    child: Text(
                      item.phase,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.clip,
                    ),
                  ),

                  Flexible(
                    flex: 1,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: iconSize),
                      child: Image.asset(item.phaseImagePath),
                    ),
                  ),
                ],
              ),
              Text(
                'More info...',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          );
        },
      ),
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
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.clip,
                  ),
                  Text(
                    '$windSpeed km/h',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.clip,
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

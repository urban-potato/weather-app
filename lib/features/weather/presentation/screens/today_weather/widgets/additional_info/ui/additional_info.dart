import 'package:flutter/material.dart';

import '../../../../../../../../shared/ui/card_tile/index.dart';
import '../../../../../../shared/ui/responsive_info_list/index.dart';
import '../../../../../widgets/sun_info/index.dart';
import '../../../../../../shared/ui/widget_title/index.dart';
import '../../../../../../../../shared/utils/size_helpers/index.dart';
import '../../../../../../shared/utils/moon_phase_image_path_helper/index.dart';
import 'components/moon_info.dart';
import 'components/wind_info.dart';

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

class AdditionalInfoWidget extends StatelessWidget {
  const AdditionalInfoWidget({super.key});

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
                        child: WindInfoWidget(
                          windDirection: windData.direction,
                          windSpeed: windData.speed,
                        ),
                      ),

                      CardTile(child: SunInfoWidget(data: sunData)),
                      CardTile(child: MoonInfoWidget(item: moonInfoItem)),
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

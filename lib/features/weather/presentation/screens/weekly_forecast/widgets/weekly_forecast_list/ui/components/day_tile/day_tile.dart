import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talker_flutter/talker_flutter.dart' show Talker;

import '../../../../../../../../../../shared/presentation/services/index.dart'
    show ResponsiveSizeService;
import '../../../../../../../../../../shared/presentation/ui/card_tile/index.dart';
import '../../../../../../../shared/ui/responsive_info_list/index.dart';
import '../../../../../../../models/index.dart';
import '../../../../../../../shared/utils/date_time_formatting_helper/index.dart';
import '../../../../../../../widgets/sun_info/index.dart';
import '../../../../../../../widgets/uv_info/index.dart';
import '../../../../../../../shared/ui/widget_title/index.dart';
import 'components/main_forecast_info.dart';

class DayTileWidget extends StatelessWidget {
  const DayTileWidget({
    super.key,
    required this.data,
    required this.sizeService,
  });

  final WeeklyForecastDayModelUI data;
  final ResponsiveSizeService sizeService;

  @override
  Widget build(BuildContext context) {
    context.read<Talker>().info('WeeklyForecastListWidget DayTileWidget build');

    final contentMaxWidth = sizeService.contentMaxWidth;
    final date = getFormattedDate(data.date);

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: contentMaxWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WidgetTitle(title: date),
          _InfoWidgetsRow(data: data, sizeService: sizeService),
        ],
      ),
    );
  }
}

class _InfoWidgetsRow extends StatelessWidget {
  const _InfoWidgetsRow({required this.data, required this.sizeService});

  final WeeklyForecastDayModelUI data;
  final ResponsiveSizeService sizeService;

  @override
  Widget build(BuildContext context) {
    final contentMaxWidth = sizeService.contentMaxWidth;
    final spacing = contentMaxWidth / 2 / 17;

    final extraWeatherDataMap = <String, String>{
      'Humidity': '${data.humidity}%',
      'Wind': '${data.windSpeed.kilometrePerHour} km/h',
      'Visibility': '${data.visibility.kilometers} km',
    };

    final precipitationDataMap = <String, String>{
      'Chance of rain': '${data.precipitation.chanceOfRain}%',
      'Chance of snow': '${data.precipitation.chanceOfSnow}%',
    };

    return Row(
      spacing: spacing,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: spacing,
            children: [
              MainForecastInfoWidget(
                maxTemp: data.temperatureRange.maximum.celsius,
                minTemp: data.temperatureRange.minimum.celsius,
                temperature: data.temperature.celsius,
                condition: data.condition,
              ),
              UvInfoWidget(uv: data.uv),
              CardTile(
                child: SunInfoWidget(
                  sunriseTime: getFormattedTime(data.sun.sunrise),
                  sunsetTime: getFormattedTime(data.sun.sunset),
                ),
              ),
            ],
          ),
        ),

        Flexible(
          child: Column(
            spacing: spacing,
            children: [
              CardTile(child: ResponsiveInfoList(data: extraWeatherDataMap)),
              CardTile(child: ResponsiveInfoList(data: precipitationDataMap)),
            ],
          ),
        ),
      ],
    );
  }
}

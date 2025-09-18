import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerWidget, WidgetRef;

// import '../../../../../models/index.dart';
// import '../../../../../widgets/sun_info/index.dart';
import '../../../../../../../../shared/providers/index.dart'
    show responsiveSizeServiceProvider;
import 'components/day_tile/day_tile.dart';

class WeeklyForecastListWidget extends ConsumerWidget {
  const WeeklyForecastListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weekForecastMockData = [];
    // final weekForecastMockData = [
    //   WeatherForecastDayData(
    //     date: 'Today',
    //     mainForecastWidgetData: MainForecastWidgetData(
    //       temperature: 19,
    //       condition: const ConditionModelUI(
    //         text: 'Patchy rain nearby',
    //         iconPath: 'https://cdn.weatherapi.com/weather/64x64/day/176.png',
    //       ),
    //       maxTemp: 23,
    //       minTemp: 14,
    //     ),
    //     sunData: SunData(sunriseTime: '05:28', sunsetTime: '20:45'),
    //     extraWeatherData: ExtraWeatherData(
    //       humidity: 68,
    //       chanceOfRain: 91,
    //       chanceOfSnow: 0,
    //       windSpeed: 20.9,
    //       visibility: 10,
    //       uv: 1,
    //     ),
    //   ),
    //   WeatherForecastDayData(
    //     date: 'Tomorrow',
    //     mainForecastWidgetData: MainForecastWidgetData(
    //       temperature: 19,
    //       condition: const ConditionModelUI(
    //         text: 'Patchy rain nearby',
    //         iconPath: 'https://cdn.weatherapi.com/weather/64x64/day/176.png',
    //       ),
    //       maxTemp: 22,
    //       minTemp: 16,
    //     ),
    //     sunData: SunData(sunriseTime: '05:28 AM', sunsetTime: '08:45 PM'),
    //     extraWeatherData: ExtraWeatherData(
    //       humidity: 69,
    //       chanceOfRain: 89,
    //       chanceOfSnow: 0,
    //       windSpeed: 24.5,
    //       visibility: 10,
    //       uv: 3,
    //     ),
    //   ),
    //   WeatherForecastDayData(
    //     date: '05.07',
    //     mainForecastWidgetData: MainForecastWidgetData(
    //       temperature: 18,
    //       condition: const ConditionModelUI(
    //         text: 'Partly Cloudy',
    //         iconPath: 'https://cdn.weatherapi.com/weather/64x64/day/116.png',
    //       ),
    //       maxTemp: 22,
    //       minTemp: 13,
    //     ),
    //     sunData: SunData(sunriseTime: '05:28 AM', sunsetTime: '08:45 PM'),
    //     extraWeatherData: ExtraWeatherData(
    //       humidity: 50,
    //       chanceOfRain: 0,
    //       chanceOfSnow: 0,
    //       windSpeed: 23.4,
    //       visibility: 10,
    //       uv: 2,
    //     ),
    //   ),
    //   WeatherForecastDayData(
    //     date: '06.07',
    //     mainForecastWidgetData: MainForecastWidgetData(
    //       temperature: 17,
    //       condition: const ConditionModelUI(
    //         text: 'Sunny',
    //         iconPath: 'https://cdn.weatherapi.com/weather/64x64/day/113.png',
    //       ),
    //       maxTemp: 22,
    //       minTemp: 13,
    //     ),
    //     sunData: SunData(sunriseTime: '05:28 AM', sunsetTime: '08:45 PM'),
    //     extraWeatherData: ExtraWeatherData(
    //       humidity: 50,
    //       chanceOfRain: 0,
    //       chanceOfSnow: 0,
    //       windSpeed: 22.7,
    //       visibility: 10,
    //       uv: 2,
    //     ),
    //   ),
    // ];

    final sizeService = ref.read(responsiveSizeServiceProvider);

    final separatorHeight = sizeService.screenPercentage(4);

    return SliverList.separated(
      itemBuilder: (context, index) => DayTileWidget(
        data: weekForecastMockData[index],
        sizeService: sizeService,
      ),
      separatorBuilder: (context, index) => SizedBox(height: separatorHeight),
      itemCount: weekForecastMockData.length,
    );
  }
}

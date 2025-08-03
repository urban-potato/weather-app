import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../../../shared/ui/custom_sliver_app_bar/index.dart';
import '../../../shared/ui/main_weather/index.dart';
import '../../../shared/ui/sun_info/index.dart';
import '../../../shared/utils/adjustable_size/index.dart';
import '../components/day_tile.dart';

@RoutePage()
class WeekForecastScreen extends StatelessWidget {
  const WeekForecastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final weekForecastMockData = [
      WeatherForecastData(
        date: '03.07',
        mainWeatherWidgetData: MainWeatherWidgetData(
          temperature: 19,
          condition: WeatherCondition(
            text: 'Patchy rain nearby',
            icon: 'https://cdn.weatherapi.com/weather/64x64/day/176.png',
          ),
          maxTemp: 23,
          minTemp: 14,
        ),
        sunData: SunData(sunriseTime: '05:28 AM', sunsetTime: '08:45 PM'),
        extraWeatherInfoData: ExtraWeatherInfoData(
          humidity: 68,
          chanceOfRain: 91,
          chanceOfSnow: 0,
          windSpeed: 20.9,
          visibility: 10,
          uv: 1,
        ),
      ),
      WeatherForecastData(
        date: '04.07',
        mainWeatherWidgetData: MainWeatherWidgetData(
          temperature: 19,
          condition: WeatherCondition(
            text: 'Patchy rain nearby',
            icon: 'https://cdn.weatherapi.com/weather/64x64/day/176.png',
          ),
          maxTemp: 22,
          minTemp: 16,
        ),
        sunData: SunData(sunriseTime: '05:28 AM', sunsetTime: '08:45 PM'),
        extraWeatherInfoData: ExtraWeatherInfoData(
          humidity: 69,
          chanceOfRain: 89,
          chanceOfSnow: 0,
          windSpeed: 24.5,
          visibility: 10,
          uv: 2,
        ),
      ),
      WeatherForecastData(
        date: '05.07',
        mainWeatherWidgetData: MainWeatherWidgetData(
          temperature: 18,
          condition: WeatherCondition(
            text: 'Partly Cloudy',
            icon: 'https://cdn.weatherapi.com/weather/64x64/day/116.png',
          ),
          maxTemp: 22,
          minTemp: 13,
        ),
        sunData: SunData(sunriseTime: '05:28 AM', sunsetTime: '08:45 PM'),
        extraWeatherInfoData: ExtraWeatherInfoData(
          humidity: 50,
          chanceOfRain: 0,
          chanceOfSnow: 0,
          windSpeed: 23.4,
          visibility: 10,
          uv: 2,
        ),
      ),
      WeatherForecastData(
        date: '06.07',
        mainWeatherWidgetData: MainWeatherWidgetData(
          temperature: 17,
          condition: WeatherCondition(
            text: 'Sunny',
            icon: 'https://cdn.weatherapi.com/weather/64x64/day/113.png',
          ),
          maxTemp: 22,
          minTemp: 13,
        ),
        sunData: SunData(sunriseTime: '05:28 AM', sunsetTime: '08:45 PM'),
        extraWeatherInfoData: ExtraWeatherInfoData(
          humidity: 50,
          chanceOfRain: 0,
          chanceOfSnow: 0,
          windSpeed: 22.7,
          visibility: 10,
          uv: 2,
        ),
      ),
    ];

    ScreenBasedSize.instance.init(context);

    final hPadding = ScreenBasedSize.instance.getSidesPadding();
    final separatorHeight = ScreenBasedSize.instance.scaleByUnit(6.5);

    return CustomScrollView(
      slivers: [
        const CustomSliverAppBar(locationName: 'Saint Petersburg'),

        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: hPadding,
          ).copyWith(bottom: hPadding),
          sliver: SliverList.separated(
            itemBuilder: (context, index) =>
                DayTile(data: weekForecastMockData[index]),
            separatorBuilder: (context, index) =>
                SizedBox(height: separatorHeight),
            itemCount: weekForecastMockData.length,
          ),
        ),
      ],
    );
  }
}

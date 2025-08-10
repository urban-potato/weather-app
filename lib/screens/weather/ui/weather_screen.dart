import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../../../shared/ui/sun_info/index.dart';
import '../../../shared/utils/adjustable_size/index.dart';
import '../../../shared/utils/get_moon_phase_image_path/index.dart';
import 'components/additional_information_widget.dart';
import 'components/hourly_forecast_widget.dart';
import '../../../shared/ui/main_weather/index.dart';
import 'components/weather_sliver_app_bar.dart';
import 'components/weekly_forecast_preview_widget.dart';

@RoutePage()
class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mainWeatherMockData = MainWeatherWidgetData(
      condition: WeatherCondition(
        text: 'Partly Cloudy',
        icon: 'https://cdn.weatherapi.com/weather/64x64/day/116.png',
      ),
      maxTemp: 23,
      minTemp: 14,
      temperature: 16,
      aqi: 45,
      uv: 2,
    );

    final extraInfoMockData = ExtraWeatherInfoData(
      feelsLike: 25,
      chanceOfRain: 95,
      chanceOfSnow: 0,
      humidity: 73,
      pressure: 1017,
      visibility: 10,
      uv: 3,
    );

    final windMockData = WindData(direction: 'West', speed: 17.6);
    final sunMockData = SunData(sunriseTime: '05:28', sunsetTime: '20:45');

    final hourlyForecastMockData = [
      ForecastDay(
        time: '16:00',
        tempetarute: 16,
        windSpeed: 19.1,
        icon: 'https://cdn.weatherapi.com/weather/64x64/day/353.png',
      ),
      ForecastDay(
        time: '17:00',
        tempetarute: 22,
        windSpeed: 16.9,
        icon: 'https://cdn.weatherapi.com/weather/64x64/day/176.png',
      ),
      ForecastDay(
        time: '18:00',
        tempetarute: 22,
        windSpeed: 15.5,
        icon: 'https://cdn.weatherapi.com/weather/64x64/day/113.png',
      ),
      ForecastDay(
        time: '19:00',
        tempetarute: 21,
        windSpeed: 12.2,
        icon: 'https://cdn.weatherapi.com/weather/64x64/day/116.png',
      ),
      ForecastDay(
        time: '20:00',
        tempetarute: 20,
        windSpeed: 11.2,
        icon: 'https://cdn.weatherapi.com/weather/64x64/day/116.png',
      ),
      ForecastDay(
        time: '21:00',
        tempetarute: 20,
        windSpeed: 13.7,
        icon: 'https://cdn.weatherapi.com/weather/64x64/night/116.png',
      ),
      ForecastDay(
        time: '22:00',
        tempetarute: 20,
        windSpeed: 11.5,
        icon: 'https://cdn.weatherapi.com/weather/64x64/night/116.png',
      ),
    ];

    final weekForecastPreviewMockData = [
      WeeklyForecastPreviewItem(
        date: 'Tomorrow',
        condition: WeatherCondition(
          text: 'Patchy rain nearby',
          icon: 'https://cdn.weatherapi.com/weather/64x64/day/116.png',
        ),
        maxTemp: 20,
        minTemp: 14,
      ),
      WeeklyForecastPreviewItem(
        date: 'Mon',
        condition: WeatherCondition(
          text: 'Rain',
          icon: 'https://cdn.weatherapi.com/weather/64x64/day/353.png',
        ),
        maxTemp: 16,
        minTemp: 12,
      ),
      WeeklyForecastPreviewItem(
        date: 'Tue',
        condition: WeatherCondition(
          text: 'Sunny',
          icon: 'https://cdn.weatherapi.com/weather/64x64/day/113.png',
        ),
        maxTemp: 22,
        minTemp: 16,
      ),
    ];

    final moonInfoItemMockData = MoonInfoItemData(
      phase: 'First Quarter',
      phaseImagePath: getMoonPhaseImagePath('First Quarter'),
    );

    ScreenBasedSize.instance.init(context);

    final hPadding = ScreenBasedSize.instance.getSidesPadding();
    final vPadding = ScreenBasedSize.instance.scaleByRatio(5);
    final mainWeatherWidgetMaxWidth = ScreenBasedSize.instance.scaleByUnit(49);

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            const WeatherSliverAppBar(locationName: 'Saint Petersburg'),

            SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: hPadding,
                vertical: vPadding,
              ),
              sliver: SliverToBoxAdapter(
                child: Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: mainWeatherWidgetMaxWidth,
                    ),

                    child: MainWeatherWidget(
                      data: mainWeatherMockData,
                      currentTemperatureSize: 1.5,
                    ),
                  ),
                ),
              ),
            ),

            SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: hPadding,
              ).copyWith(bottom: hPadding),
              sliver: SliverToBoxAdapter(
                child: WeekForecastPreviewWidget(
                  data: weekForecastPreviewMockData,
                ),
              ),
            ),

            SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: hPadding,
              ).copyWith(bottom: hPadding),
              sliver: SliverToBoxAdapter(
                child: HourlyForecastWidget(data: hourlyForecastMockData),
              ),
            ),

            SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: hPadding,
              ).copyWith(bottom: hPadding),
              sliver: SliverToBoxAdapter(
                child: AdditionalInformationWidget(
                  sunData: sunMockData,
                  windData: windMockData,
                  extraWeatherInfoData: extraInfoMockData,
                  moonInfoItem: moonInfoItemMockData,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../shared/layout/card_tile/index.dart';
import '../../../../shared/ui/widget_title/index.dart';
import '../../../../shared/utils/adjustable_size/index.dart';

class ForecastDay {
  ForecastDay({
    required this.time,
    required this.icon,
    required this.tempetarute,
    required this.windSpeed,
  });

  final String time;
  final String icon;
  final int tempetarute;
  final double windSpeed;
}

class HourlyForecast extends StatelessWidget {
  const HourlyForecast({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
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

    ScreenBasedSize.instance.init(context);
    final scrollableAreaHeight = ScreenBasedSize.instance.scaleByUnit(33);
    final separatorWidth = ScreenBasedSize.instance.scaleByUnit(2.4);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const WidgetTitle(title: 'Hourly Forecast'),

        SizedBox(
          height: scrollableAreaHeight,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) =>
                SizedBox(width: separatorWidth),
            itemBuilder: (context, index) =>
                _ForecastItemTile(day: data[index]),
            itemCount: data.length,
          ),
        ),
      ],
    );
  }
}

class _ForecastItemTile extends StatelessWidget {
  const _ForecastItemTile({required this.day});

  final ForecastDay day;

  @override
  Widget build(BuildContext context) {
    ScreenBasedSize.instance.init(context);

    final hPadding = ScreenBasedSize.instance.scaleByUnit(4.8);
    final vPadding = ScreenBasedSize.instance.scaleByUnit(2.4);

    return CardTile(
      padding: EdgeInsets.symmetric(vertical: vPadding, horizontal: hPadding),
      child: FittedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _ForecastItemText(text: day.time, size: 15),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 32),
                child: Image.network(day.icon),
              ),
            ),
            _ForecastItemText(text: '${day.tempetarute}°', size: 17),
            _ForecastItemText(
              text: '${day.windSpeed} km/h',
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
      ),
    );
  }
}

class _ForecastItemText extends StatelessWidget {
  const _ForecastItemText({
    required this.text,
    this.size = 14,
    this.fontWeight = FontWeight.w600,
  });

  final String text;
  final double size;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: fontWeight,
        overflow: TextOverflow.clip,
        fontSize: size,
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../shared/ui/daily_temperature_range/index.dart';
import '../../../../shared/ui/main_temperature/index.dart';
import '../../../../shared/ui/uv_info/index.dart';
import '../../../../shared/ui/weather_condition/index.dart';
import '../../../../shared/utils/adjustable_size/index.dart';
import 'aqi_info.dart';

class MainWeatherWidgetData {
  MainWeatherWidgetData({
    required this.temperature,
    required this.condition,
    required this.maxTemp,
    required this.minTemp,
  });

  final int temperature;
  final WeatherConditionData condition;
  final int maxTemp;
  final int minTemp;
}

class WeatherConditionData {
  WeatherConditionData({required this.text, required this.icon});

  final String text;
  final String icon;
}

class MainWeather extends StatelessWidget {
  const MainWeather({super.key});

  @override
  Widget build(BuildContext context) {
    final data = MainWeatherWidgetData(
      condition: WeatherConditionData(
        text: 'Patchy rain nearby',
        icon: 'https://cdn.weatherapi.com/weather/64x64/day/116.png',
      ),
      maxTemp: 23,
      minTemp: 14,
      temperature: 16,
    );

    const int aqi = 15;
    // const int aqi = 1523424112312123121;
    const int uv = 2;
    // const int uv = 2342341242342343423;

    return Column(
      // TODO: рассчитать spacing
      spacing: 8,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MainTemperature(temperature: data.temperature, sizeRatio: 2),
        WeatherCondition(
          text: data.condition.text,
          iconPath: data.condition.icon,
          sizeRatio: 1.1,
        ),
        DailyTemperatureRange(maxTemp: data.maxTemp, minTemp: data.minTemp),
        const _UVAndAQIInfoRow(aqi: aqi, uv: uv),
      ],
    );
  }
}

class _UVAndAQIInfoRow extends StatelessWidget {
  const _UVAndAQIInfoRow({required this.aqi, required this.uv});

  final int aqi;
  final int uv;

  @override
  Widget build(BuildContext context) {
    ScreenBasedSize.instance.init(context);
    // final spacing = ScreenBasedSize.instance.scaleByUnit(2);
    final spacing = ScreenBasedSize.instance.scaleByUnit(1);
    final runSpacing = ScreenBasedSize.instance.scaleByUnit(1);

    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.center,
      spacing: spacing,
      runSpacing: runSpacing,
      children: [
        UvInfo(uv: uv),
        AqiInfo(aqi: aqi),
      ],
      // children: [
      //   LayoutBuilder(
      //     builder: (context, constraints) {
      //       final constraintsMaxWidth = constraints.maxWidth;
      //       return ConstrainedBox(
      //         constraints: BoxConstraints(
      //           maxWidth: constraintsMaxWidth / 2,
      //           minWidth: constraintsMaxWidth / 2,
      //         ),
      //         child: UvInfoWidget(uv: uv),
      //       );
      //     },
      //   ),
      //   LayoutBuilder(
      //     builder: (context, constraints) {
      //       final constraintsMaxWidth = constraints.maxWidth;
      //       return ConstrainedBox(
      //         constraints: BoxConstraints(
      //           maxWidth: constraintsMaxWidth / 2,
      //           minWidth: constraintsMaxWidth / 2,
      //         ),
      //         child: AqiInfoWidget(aqi: aqi),
      //       );
      //     },
      //   ),
      // ],
    );

    // return Wrap(
    //   crossAxisAlignment: WrapCrossAlignment.center,
    //   alignment: WrapAlignment.center,
    //   spacing: spacing,
    //   runSpacing: runSpacing,
    //   children: [
    //     Flexible(
    //       fit: FlexFit.tight,
    //       child: UvInfoWidget(uv: uv),
    //     ),
    //     Flexible(
    //       fit: FlexFit.tight,
    //       child: AqiInfoWidget(aqi: aqi),
    //     ),
    //   ],
    // );

    // return Row(
    //   spacing: spacing,

    //   children: [
    //     Flexible(
    //       fit: FlexFit.tight,
    //       child: UvInfoWidget(uv: uv),
    //     ),
    //     Flexible(
    //       fit: FlexFit.tight,
    //       child: AqiInfoWidget(aqi: aqi),
    //     ),
    //   ],
    // );
  }
}

// class _UVAndAQIInfoRow extends StatelessWidget {
//   const _UVAndAQIInfoRow({required this.aqi, required this.uv});

//   final int aqi;
//   final int uv;

//   @override
//   Widget build(BuildContext context) {
//     ScreenBasedSize.instance.init(context);
//     final spacing = ScreenBasedSize.instance.scaleByUnit(2);

//     return Row(
//       spacing: spacing,
//       children: [
//         Flexible(
//           fit: FlexFit.tight,
//           child: UvInfoWidget(uv: uv),
//         ),
//         Flexible(
//           fit: FlexFit.tight,
//           child: AqiInfoWidget(aqi: aqi),
//         ),
//       ],
//     );
//   }
// }

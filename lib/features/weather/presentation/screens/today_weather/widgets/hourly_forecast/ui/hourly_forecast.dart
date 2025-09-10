import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../../../../shared/ui/card_tile/index.dart';
import '../../../../../../../../shared/ui/custom_circular_progress_indicator/index.dart';
import '../../../../../../../../shared/ui/themed_text/index.dart';
import '../../../../../../shared/ui/image_asset_with_network_fallback/index.dart';
import '../../../../../../shared/ui/widget_title/index.dart';
import '../../../../../../../../shared/utils/size_helper/index.dart';
import '../../../../../models/index.dart';
import '../../../../../provider/weather_cubit.dart';
import '../../../../../provider/weather_state.dart';

class HourlyForecastWidget extends StatefulWidget {
  const HourlyForecastWidget({super.key});

  @override
  State<HourlyForecastWidget> createState() => _HourlyForecastWidgetState();
}

class _HourlyForecastWidgetState extends State<HourlyForecastWidget>
    with AutomaticKeepAliveClientMixin<HourlyForecastWidget> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    if (kDebugMode) print('HourlyForecastWidget build');

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
          child: BlocSelector<WeatherCubit, WeatherState, HourlyForecastModelUI?>(
            selector: (state) => state.weather?.today.hourlyForecast,
            builder: (context, state) {
              if (state == null) {
                if (kDebugMode)
                  print(
                    'HourlyForecastWidget BlocSelector return CircularProgressIndicator',
                  );
                return const CustomCircularProgressIndicator();
              } else {
                if (kDebugMode)
                  print(
                    'HourlyForecastWidget BlocSelector return ListView.separated',
                  );

                return ListView.separated(
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) =>
                      SizedBox(width: separatorWidth),
                  itemBuilder: (context, index) => _ForecastItemTile(
                    localtime: state.localtime,
                    hourInfo: state.hoursList[index],
                  ),
                  itemCount: state.hoursList.length,
                );
              }
            },
          ),
        ),
      ],
    );
  }
}

class _ForecastItemTile extends StatelessWidget {
  const _ForecastItemTile({required this.localtime, required this.hourInfo});

  final DateTime localtime;
  final HourModelUI hourInfo;

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) print('HourlyForecastWidget _ForecastItemTile build');
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
            _ForecastItemText(
              text: DateFormat.Hm().format(hourInfo.dateTime),
              size: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 32,
                  minWidth: 32,
                  maxHeight: 32,
                  minHeight: 32,
                ),

                child: ImageAssetWithNetworkFallback(
                  assetPath: hourInfo.condition.assetIconPath,
                  networkPath: hourInfo.condition.networkIconPath,
                  semanticLabel: hourInfo.condition.text,
                  errorWidget: const Icon(
                    Icons.question_mark_outlined,
                    size: 32,
                  ),
                  loadingIndicatorSize: 20,
                ),
              ),
            ),
            _ForecastItemText(
              text: '${hourInfo.temperature.celsius}°',
              size: 17,
            ),
            _ForecastItemText(
              text: '${hourInfo.windSpeed.kilometrePerHour} km/h',
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
    return ThemedText(
      text: text,
      styleType: AppTextStyle.bodyMedium,
      fontWeight: fontWeight,
      fontSize: size,
    );
  }
}

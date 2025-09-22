import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../../shared/providers/index.dart'
    show navigationServiceProvider, responsiveSizeServiceProvider;
import '../../../../../../../../shared/services/index.dart'
    show ResponsiveSizeService;
import '../../../../../../../../shared/ui/card_tile/index.dart';
import '../../../../../../../../shared/ui/custom_circular_progress_indicator/index.dart';
import '../../../../../../../../shared/ui/themed_text/index.dart';
import '../../../../../shared/ui/image_asset_with_network_fallback/index.dart';
import '../../../../../shared/ui/widget_title/index.dart';
import '../../../../../shared/utils/day_helper/index.dart';
import '../../../../../models/index.dart';
import '../../../../../provider/weather_cubit.dart';
import '../../../../../provider/weather_state.dart';
import '../../../../../widgets/daily_temperature_range/index.dart'
    show DailyTemperatureRangeWidget;

class WeeklyForecastPreviewWidget extends ConsumerStatefulWidget {
  const WeeklyForecastPreviewWidget({super.key});

  @override
  ConsumerState<WeeklyForecastPreviewWidget> createState() =>
      _WeeklyForecastPreviewWidgetState();
}

class _WeeklyForecastPreviewWidgetState
    extends ConsumerState<WeeklyForecastPreviewWidget>
    with AutomaticKeepAliveClientMixin<WeeklyForecastPreviewWidget> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    if (kDebugMode) print('WeekForecastPreviewWidget build');
    final navigationService = ref.read(navigationServiceProvider);
    final sizeService = ref.read(responsiveSizeServiceProvider.notifier);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const WidgetTitle(title: 'Weekly forecast'),

        BlocSelector<WeatherCubit, WeatherState, WeeklyForecastPreviewModelUI?>(
          selector: (state) => state.weather?.today.weeklyForecastPreview,
          builder: (context, state) {
            if (state == null) {
              if (kDebugMode)
                print(
                  'WeekForecastPreviewWidget BlocSelector return CircularProgressIndicator',
                );
              return const CustomCircularProgressIndicator();
            } else {
              if (kDebugMode)
                print(
                  'WeekForecastPreviewWidget BlocSelector return GestureDetector',
                );

              return GestureDetector(
                onTap: () => navigationService.pushWeeklyForecastRoute(context),

                child: CardTile(
                  child: Column(
                    children: [
                      ...state.weeklyForecastPreviewDayList.map(
                        (e) => _InfoRow(item: e, sizeService: sizeService),
                      ),
                      const ThemedText(
                        text: 'More info...',
                        styleType: AppTextStyle.bodySmall,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.item, required this.sizeService});

  final WeeklyForecastPreviewDayModelUI item;
  final ResponsiveSizeService sizeService;

  @override
  Widget build(BuildContext contex) {
    if (kDebugMode) print('WeeklyForecastPreviewWidget _InfoRow');

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final constraintsMaxWidth = constraints.maxWidth;
        final iconSize = sizeService.percentageOf(constraintsMaxWidth, 10);
        final conditionTextHPadding = sizeService.percentageOf(
          constraintsMaxWidth,
          1.8,
        );
        final imageSpacing = sizeService.percentageOf(constraintsMaxWidth, 1.5);
        final temperatureRowMaxWidth = constraintsMaxWidth * 0.5;
        final firstRowMaxWidth = constraintsMaxWidth - temperatureRowMaxWidth;

        final day = getDay(item.dateTime);

        if (kDebugMode)
          print('WeeklyForecastPreviewWidget _InfoRow LayoutBuilder');

        return Row(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: firstRowMaxWidth),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                spacing: imageSpacing,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: iconSize),

                    child: ImageAssetWithNetworkFallback(
                      assetPath: item.condition.assetIconPath,
                      networkPath: item.condition.networkIconPath,
                    ),
                  ),
                  Flexible(
                    child: ThemedText(
                      text: day,
                      styleType: AppTextStyle.bodyMedium,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),

            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: conditionTextHPadding,
                      ),
                      child: ThemedText(
                        text: item.condition.text,
                        styleType: AppTextStyle.bodyMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: temperatureRowMaxWidth,
                    ),
                    child: LayoutBuilder(
                      builder: (BuildContext context, BoxConstraints constraints) {
                        final constraintsMaxWidth = constraints.maxWidth;
                        final spacing = sizeService.percentageOf(
                          constraintsMaxWidth,
                          1.2,
                        );

                        if (kDebugMode)
                          print(
                            'WeeklyForecastPreviewWidget LayoutBuilder _InfoRow LayoutBuilder 2',
                          );

                        return DailyTemperatureRangeWidget(
                          maxTemp: item.temperatureRange.maximum.celsius
                              .toString(),
                          minTemp: item.temperatureRange.minimum.celsius
                              .toString(),
                          spacing: spacing,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../../shared/services/index.dart';
import '../../../../../../../../shared/ui/card_tile/index.dart';
import '../../../../../../shared/ui/image_asset_with_network_fallback/index.dart';
import '../../../../../../shared/ui/widget_title/index.dart';
import '../../../../../../../../shared/utils/size_helper/index.dart';
import '../../../../../../shared/utils/day_helper/index.dart';
import '../../../../../models/index.dart';
import '../../../../../provider/weather_cubit.dart';
import '../../../../../provider/weather_state.dart';
import 'components/daily_temperature_range.dart';

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

    print('WeekForecastPreviewWidget build');
    final navigationService = ref.read(navigationServiceProvider);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const WidgetTitle(title: 'Weekly forecast'),

        BlocSelector<WeatherCubit, WeatherState, WeeklyForecastPreviewModelUI?>(
          selector: (state) => state.weather?.today.weeklyForecastPreview,
          builder: (context, state) {
            if (state == null) {
              print(
                'WeekForecastPreviewWidget BlocSelector return CircularProgressIndicator',
              );
              return const Center(child: CircularProgressIndicator());
            } else {
              print(
                'WeekForecastPreviewWidget BlocSelector return GestureDetector',
              );

              return GestureDetector(
                onTap: () => navigationService.pushWeeklyForecastRoute(context),

                child: CardTile(
                  child: Column(
                    children: [
                      ...state.weeklyForecastPreviewDayList.map(
                        (e) => _InfoRow(item: e),
                      ),
                      Text(
                        'More info...',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodySmall,
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
  const _InfoRow({required this.item});

  final WeeklyForecastPreviewDayModelUI item;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final constraintsMaxWidth = constraints.maxWidth;
        final iconSize = AdjustableSize.scaleByUnit(constraintsMaxWidth, 10);
        final conditionTextHPadding = AdjustableSize.scaleByUnit(
          constraintsMaxWidth,
          1.8,
        );
        final imageSpacing = AdjustableSize.scaleByUnit(
          constraintsMaxWidth,
          1.5,
        );
        final temperatureRowMaxWidth = constraintsMaxWidth * 0.5;
        final firstRowMaxWidth = constraintsMaxWidth - temperatureRowMaxWidth;

        final day = getDay(item.dateTime);

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
                    child: Text(
                      day,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
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
                      child: Text(
                        item.condition.text,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: temperatureRowMaxWidth,
                    ),
                    child: DailyTemperatureRangeWidget(
                      maxTemp: item.temperatureRange.maximum.celsius.toString(),
                      minTemp: item.temperatureRange.minimum.celsius.toString(),
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

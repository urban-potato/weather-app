import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerWidget, WidgetRef;
import 'package:talker_flutter/talker_flutter.dart' show Talker;

import '../../../../../../../../../shared/presentation/providers/index.dart'
    show responsiveSizeServiceProvider;
import '../../../../../../../../../shared/presentation/ui/card_tile/index.dart';
import '../../../../../../../../../shared/presentation/ui/custom_circular_progress_indicator/index.dart';
import '../../../../../../../../../shared/presentation/ui/themed_text/index.dart';
import '../../../../../../models/index.dart' show WindModelUI;
import '../../../../../../provider/index.dart';
import '../../../../../../shared/utils/wind_direction_helper/index.dart';

class WindInfoTile extends ConsumerWidget {
  const WindInfoTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final talker = context.read<Talker>();
    talker.info('WindInfoWidget build');

    final sizeService = ref.read(responsiveSizeServiceProvider.notifier);

    return BlocSelector<WeatherCubit, WeatherState, WindModelUI?>(
      selector: (state) => state.weather?.today.additionalInfo.wind,
      builder: (context, state) {
        if (state == null) {
          talker.info(
            'AdditionalInfoWidget _WindInfoCard BlocSelector CustomCircularProgressIndicator',
          );
          return const CustomCircularProgressIndicator();
        }

        talker.info('AdditionalInfoWidget _WindInfoCard BlocSelector CardTile');

        return CardTile(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              talker.info('WindInfoWidget LayoutBuilder');

              final constraintsMaxWidth = constraints.maxWidth;
              final iconSize = sizeService.percentageOf(
                constraintsMaxWidth,
                20,
              );
              final spacing = sizeService.percentageOf(
                constraintsMaxWidth,
                1.9,
              );

              final windDirection = getFullWindDirection(state.direction);
              final windSpeed = '${state.speed.kilometrePerHour} km/h';

              return Row(
                spacing: spacing,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ThemedText(
                          text: windDirection,
                          styleType: AppTextStyle.bodyMedium,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.clip,
                        ),
                        ThemedText(
                          text: windSpeed,
                          styleType: AppTextStyle.bodyMedium,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.clip,
                        ),
                      ],
                    ),
                  ),

                  Flexible(flex: 1, child: Icon(Icons.air, size: iconSize)),
                ],
              );
            },
          ),
        );
      },
    );
  }
}

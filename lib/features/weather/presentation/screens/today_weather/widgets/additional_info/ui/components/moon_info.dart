import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:talker_flutter/talker_flutter.dart' show Talker;

import '../../../../../../../../../shared/presentation/providers/index.dart'
    show navigationServiceProvider, responsiveSizeServiceProvider;
import '../../../../../../../../../shared/presentation/services/index.dart'
    show AppRoute;
import '../../../../../../../../../shared/presentation/ui/card_tile/index.dart';
import '../../../../../../../../../shared/presentation/ui/custom_circular_progress_indicator/index.dart';
import '../../../../../../../../../shared/presentation/ui/themed_text/index.dart';
import '../../../../../../models/index.dart' show MoonModelUI;
import '../../../../../../provider/index.dart';
import '../../../../../../shared/utils/assets_path_helper/index.dart';

class MoonInfoTile extends ConsumerWidget {
  const MoonInfoTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final talker = context.read<Talker>();
    talker.info('MoonInfoWidget build');

    final navigationService = ref.read(navigationServiceProvider);
    final sizeService = ref.read(responsiveSizeServiceProvider.notifier);

    return BlocSelector<WeatherCubit, WeatherState, MoonModelUI?>(
      selector: (state) => state.weather?.today.additionalInfo.moon,
      builder: (context, state) {
        if (state == null) {
          talker.info(
            'AdditionalInfoWidget _MoonInfoCard BlocSelector CustomCircularProgressIndicator',
          );
          return const CustomCircularProgressIndicator();
        }

        talker.info('AdditionalInfoWidget _MoonInfoCard BlocSelector CardTile');

        assert(debugCheckHasMaterial(context));

        final moonPhase = state.phase;
        final moonPhaseAssetPath = getMoonPhaseAssetPath(moonPhase);
        final tileBorderRadius = sizeService.borderRadius;

        return InkWell(
          borderRadius: BorderRadius.circular(tileBorderRadius),
          onTap: () => navigationService.push(AppRoute.moonInfo),
          child: CardTile(
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                talker.info('MoonInfoWidget LayoutBuilder');

                final constraintsMaxWidth = constraints.maxWidth;
                final iconSize = sizeService.percentageOf(
                  constraintsMaxWidth,
                  20,
                );
                final spacing = sizeService.percentageOf(
                  constraintsMaxWidth,
                  1.9,
                );

                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      spacing: spacing,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 3,
                          child: ThemedText(
                            text: moonPhase,
                            styleType: AppTextStyle.bodyMedium,
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.clip,
                          ),
                        ),

                        Flexible(
                          flex: 1,
                          child: ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: iconSize,
                              maxHeight: iconSize,
                            ),
                            child: moonPhaseAssetPath != null
                                ? SvgPicture.asset(
                                    moonPhaseAssetPath,
                                    excludeFromSemantics: true,
                                  )
                                : const Icon(CupertinoIcons.moon),
                          ),
                        ),
                      ],
                    ),
                    const ThemedText(
                      text: 'More info...',
                      styleType: AppTextStyle.bodySmall,
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}

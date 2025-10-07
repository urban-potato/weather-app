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
import '../../../../../../../../../shared/presentation/ui/themed_text/index.dart';
import '../../../../../../shared/utils/assets_path_helper/index.dart';

class MoonInfoWidget extends ConsumerWidget {
  const MoonInfoWidget({super.key, required this.moonPhase});

  final String moonPhase;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final talker = context.read<Talker>();
    talker.info('MoonInfoWidget build');

    final moonPhaseAssetPath = getMoonPhaseAssetPath(moonPhase);
    final navigationService = ref.read(navigationServiceProvider);
    final sizeService = ref.read(responsiveSizeServiceProvider.notifier);

    return GestureDetector(
      onTap: () => navigationService.push(AppRoute.moonInfo),

      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          talker.info('MoonInfoWidget LayoutBuilder');

          final constraintsMaxWidth = constraints.maxWidth;
          final iconSize = sizeService.percentageOf(constraintsMaxWidth, 20);
          final spacing = sizeService.percentageOf(constraintsMaxWidth, 1.9);

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
    );
  }
}

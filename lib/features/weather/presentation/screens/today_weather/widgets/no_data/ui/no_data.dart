import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerWidget, WidgetRef;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:talker_flutter/talker_flutter.dart' show Talker;

import '../../../../../../../../shared/presentation/providers/index.dart'
    show responsiveSizeServiceProvider;
import '../../../../../../../../shared/presentation/ui/themed_text/index.dart';
import '../../../../../../shared/resources/index.dart';

class NoDataWidget extends ConsumerWidget {
  const NoDataWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final talker = context.read<Talker>();
    talker.info('NoDataWidget build');

    final cloudFacePicture = AppSvgs.cloudFaces.negative.randomPicture;
    final sizeService = ref.read(responsiveSizeServiceProvider.notifier);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            talker.info('NoDataWidget LayoutBuilder');

            final constraintsMaxWidth = constraints.maxWidth;
            final spacing = sizeService.percentageOf(constraintsMaxWidth, 4.6);
            final pictureWidth = sizeService.percentageOf(
              constraintsMaxWidth,
              52.4,
            );

            return Column(
              spacing: spacing,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  cloudFacePicture,
                  excludeFromSemantics: true,
                  width: pictureWidth,
                ),
                const ThemedText(
                  text: 'Couldn\'t load data',
                  styleType: AppTextStyle.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

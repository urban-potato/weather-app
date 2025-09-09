import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../../shared/utils/size_helper/index.dart';
import '../../../../../../shared/resources/index.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cloudFacePicture = AppSvgs.cloudFaces.negative.randomPicture;

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final constraintsMaxWidth = constraints.maxWidth;
        final spacing = AdjustableSize.scaleByUnit(constraintsMaxWidth, 4.6);
        final pictureWidth = AdjustableSize.scaleByUnit(
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
            Text(
              'Failed to load data. Please check your internet connection and try again.',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        );
      },
    );
  }
}

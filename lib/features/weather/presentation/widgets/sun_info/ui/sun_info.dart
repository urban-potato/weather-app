import 'package:flutter/material.dart';

import '../../../../../../shared/utils/size_helper/index.dart';

class SunInfoWidget extends StatelessWidget {
  const SunInfoWidget({
    super.key,
    required this.sunriseTime,
    required this.sunsetTime,
  });

  final String sunriseTime;
  final String sunsetTime;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final constraintsMaxWidth = constraints.maxWidth;
        final iconize = AdjustableSize.scaleByUnit(constraintsMaxWidth, 20);
        final spacing = AdjustableSize.scaleByUnit(constraintsMaxWidth, 1.9);

        print('SunInfoWidget LayoutBuilder');

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
                  _ThemedRichText(time: sunriseTime, label: 'Sunrise'),
                  _ThemedRichText(time: sunsetTime, label: 'Sunset'),
                ],
              ),
            ),

            Flexible(
              flex: 1,
              child: Icon(Icons.wb_sunny_outlined, size: iconize),
            ),
          ],
        );
      },
    );
  }
}

class _ThemedRichText extends StatelessWidget {
  const _ThemedRichText({required this.time, required this.label});

  final String time;
  final String label;

  @override
  Widget build(BuildContext context) {
    print('SunInfoWidget _InfoText');

    return RichText(
      text: TextSpan(
        text: time,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.bold,
          height: 1.5,
        ),
        children: [
          TextSpan(
            text: ' $label',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../../../shared/utils/size_helpers/index.dart';

class SunData {
  SunData({required this.sunriseTime, required this.sunsetTime});

  final String sunriseTime;
  final String sunsetTime;
}

class SunInfoWidget extends StatelessWidget {
  const SunInfoWidget({super.key, required this.data});

  final SunData data;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final constraintsMaxWidth = constraints.maxWidth;
        final iconize = AdjustableSize.scaleByUnit(constraintsMaxWidth, 20);
        final spacing = AdjustableSize.scaleByUnit(constraintsMaxWidth, 1.9);

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
                  _InfoText(time: data.sunriseTime, label: 'Sunrise'),
                  _InfoText(time: data.sunsetTime, label: 'Sunset'),
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

class _InfoText extends StatelessWidget {
  const _InfoText({required this.time, required this.label});

  final String time;
  final String label;

  @override
  Widget build(BuildContext context) {
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

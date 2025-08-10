import 'package:flutter/material.dart';

import '../../../utils/adjustable_size/index.dart';

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
        final fontSize = AdjustableSize.scaleByUnit(constraintsMaxWidth, 10.5);
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
                  _InfoRow(
                    fontSize: fontSize,
                    time: data.sunriseTime,
                    label: 'Sunrise',
                  ),
                  _InfoRow(
                    fontSize: fontSize,
                    time: data.sunsetTime,
                    label: 'Sunset',
                  ),
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

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.fontSize,
    required this.time,
    required this.label,
  });

  final double fontSize;
  final String time;
  final String label;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: time,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w700,
          height: 1.5,
          fontSize: fontSize,
        ),
        children: [
          TextSpan(
            // text: '\n$label',
            text: ' $label',
            style: const TextStyle(fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}

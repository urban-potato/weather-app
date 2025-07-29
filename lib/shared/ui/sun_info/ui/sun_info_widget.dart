import 'package:flutter/material.dart';
import 'package:weather_app/shared/lib/adjustable_size/index.dart';

class SunInfoWidget extends StatelessWidget {
  const SunInfoWidget({super.key});

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
                  _InfoRow(fontSize: fontSize, time: '04:02', label: 'Sunrize'),
                  _InfoRow(fontSize: fontSize, time: '21:39', label: 'Sunset'),
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
            text: ' $label',
            style: const TextStyle(fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}

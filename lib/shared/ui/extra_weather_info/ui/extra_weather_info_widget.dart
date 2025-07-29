import 'package:flutter/material.dart';
import 'package:weather_app/shared/lib/adjustable_size/index.dart';

class ExtraWeatherInfoWidget extends StatelessWidget {
  const ExtraWeatherInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final data = <String, String>{
      'Feels like': '28°',
      'Humidity': '40%',
      'Chance of rain': '27%',
      'Pressure': '1001 mbar',
      'Visibility': '10 km',
    };

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: data.entries
          .map((e) => _InfoRow(label: e.key, value: e.value))
          .toList(),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final constraintsMaxWidth = constraints.maxWidth;
        final fontSize = AdjustableSize.scaleByUnit(constraintsMaxWidth, 9.3);
        final spacing = AdjustableSize.scaleByUnit(constraintsMaxWidth, 1.9);

        return Column(
          children: [
            Row(
              spacing: spacing,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: constraintsMaxWidth * 0.7,
                  ),
                  child: Text(
                    label,
                    style: TextStyle(fontSize: fontSize),
                    overflow: TextOverflow.clip,
                  ),
                ),

                Flexible(
                  child: Text(
                    textAlign: TextAlign.right,
                    value,
                    style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: FontWeight.w700,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ),
              ],
            ),
            const Divider(),
          ],
        );
      },
    );
  }
}

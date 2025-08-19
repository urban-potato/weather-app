import 'package:flutter/material.dart';

import '../../../utils/adjustable_size/index.dart';

class ResponsiveInfoList extends StatelessWidget {
  const ResponsiveInfoList({
    super.key,
    required this.data,
    this.withDivider,
    this.textColor,
    this.labelFontWeight,
    this.valueFontWeight,
  });

  final Map<String, String> data;
  final bool? withDivider;
  final Color? textColor;
  final FontWeight? labelFontWeight;
  final FontWeight? valueFontWeight;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: data.entries
          .map(
            (e) => _InfoRow(
              label: e.key,
              value: e.value,
              withDivider: withDivider,
              textColor: textColor,
              labelFontWeight: labelFontWeight,
              valueFontWeight: valueFontWeight,
            ),
          )
          .toList(),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.label,
    required this.value,
    required this.withDivider,
    required this.textColor,
    this.labelFontWeight,
    this.valueFontWeight,
  });

  final String label;
  final String value;
  final bool? withDivider;
  final Color? textColor;
  final FontWeight? labelFontWeight;
  final FontWeight? valueFontWeight;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final constraintsMaxWidth = constraints.maxWidth;
        final fontSize = AdjustableSize.scaleByUnit(constraintsMaxWidth, 9);
        final spacing = AdjustableSize.scaleByUnit(constraintsMaxWidth, 1.9);

        // print('fontSize 0 = $fontSize');

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
                    style: TextStyle(
                      fontSize: fontSize,
                      color: textColor,
                      fontWeight: labelFontWeight,
                    ),
                    overflow: TextOverflow.clip,
                  ),
                ),

                Flexible(
                  child: Text(
                    textAlign: TextAlign.right,
                    value,
                    style: TextStyle(
                      fontSize: fontSize,
                      fontWeight: valueFontWeight ?? FontWeight.w700,
                      color: textColor,
                    ),
                    overflow: TextOverflow.clip,
                  ),
                ),
              ],
            ),
            if (withDivider ?? true) const Divider(),
          ],
        );
      },
    );
  }
}

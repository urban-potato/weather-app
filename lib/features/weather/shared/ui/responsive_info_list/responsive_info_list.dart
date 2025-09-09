import 'package:flutter/material.dart';

import '../../../../../shared/ui/themed_text/index.dart';
import '../../../../../shared/utils/size_helper/index.dart';

class ResponsiveInfoList extends StatelessWidget {
  const ResponsiveInfoList({super.key, required this.data});

  final Map<String, String> data;

  @override
  Widget build(BuildContext context) {
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
        final spacing = AdjustableSize.scaleByUnit(constraintsMaxWidth, 1.9);

        print('LayoutBuilder ResponsiveInfoList');

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
                  child: ThemedText(
                    text: label,
                    styleType: AppTextStyle.bodyMedium,
                    overflow: TextOverflow.clip,
                  ),
                ),

                Flexible(
                  child: ThemedText(
                    text: value,
                    styleType: AppTextStyle.bodyMedium,
                    fontWeight: FontWeight.w700,
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.right,
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

import 'package:flutter/material.dart';

import '../../../../../shared/utils/size_helpers/index.dart';

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
                    style: Theme.of(context).textTheme.bodyMedium,
                    overflow: TextOverflow.clip,
                  ),
                ),

                Flexible(
                  child: Text(
                    textAlign: TextAlign.right,
                    value,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                    overflow: TextOverflow.clip,
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

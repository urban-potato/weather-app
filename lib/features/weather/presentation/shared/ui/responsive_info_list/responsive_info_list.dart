import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerWidget, WidgetRef;

import '../../../../../../shared/presentation/providers/index.dart'
    show responsiveSizeServiceProvider;
import '../../../../../../shared/domain/services/index.dart'
    show ResponsiveSizeService;
import '../../../../../../shared/presentation/ui/themed_text/index.dart';

class ResponsiveInfoList extends ConsumerWidget {
  const ResponsiveInfoList({super.key, required this.data});

  final Map<String, String> data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (kDebugMode) print('ResponsiveInfoList build');

    final sizeService = ref.read(responsiveSizeServiceProvider.notifier);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: data.entries
          .map(
            (e) => _InfoRow(
              label: e.key,
              value: e.value,
              sizeService: sizeService,
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
    required this.sizeService,
  });

  final String label;
  final String value;
  final ResponsiveSizeService sizeService;

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) print('ResponsiveInfoList _InfoRow');

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final constraintsMaxWidth = constraints.maxWidth;
        final spacing = sizeService.percentageOf(constraintsMaxWidth, 1.9);

        if (kDebugMode) print('ResponsiveInfoList _InfoRow LayoutBuilder');

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

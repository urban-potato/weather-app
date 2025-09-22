import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerWidget, WidgetRef;

import '../../../../../../shared/presentation/providers/index.dart'
    show responsiveSizeServiceProvider;
import '../../../../../../shared/presentation/ui/card_tile/index.dart';
import '../../../../../../shared/presentation/ui/themed_text/index.dart';

class InfoBadge extends ConsumerWidget {
  const InfoBadge({
    super.key,
    required this.color,
    required this.lable,
    required this.value,
    required this.icon,
  });

  final Color color;
  final String lable;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sizeService = ref.read(responsiveSizeServiceProvider.notifier);

    final hPadding = sizeService.screenPercentage(2.5);
    final vPadding = sizeService.screenPercentage(1.9);
    final iconSize = sizeService.screenPercentage(6);
    final iconSpacing = sizeService.screenPercentage(2);
    final textSpacing = sizeService.screenPercentage(1);

    return CardTile(
      padding: EdgeInsets.symmetric(vertical: vPadding, horizontal: hPadding),
      color: color,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: iconSpacing,
        children: [
          Icon(icon, color: Colors.white, size: iconSize),
          Flexible(
            child: Row(
              spacing: textSpacing,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(child: _InfoText(text: lable)),
                Flexible(child: _InfoText(text: value)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoText extends StatelessWidget {
  const _InfoText({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return ThemedText(
      text: text,
      styleType: AppTextStyle.labelMedium,
      overflow: TextOverflow.clip,
      color: Colors.white,
    );
  }
}

import 'package:flutter/material.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({
    super.key,
    this.loadingProgress,
    this.semanticsLabel = 'loading',
    this.size,
  });

  final ImageChunkEvent? loadingProgress;
  final String semanticsLabel;
  final double? size;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    print('CustomCircularProgressIndicator');

    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          strokeCap: StrokeCap.round,
          semanticsLabel: semanticsLabel,
          color: theme.brightness == Brightness.light
              ? theme.primaryColorDark
              : theme.primaryColorLight,
          value:
              (loadingProgress != null &&
                  loadingProgress?.expectedTotalBytes != null)
              ? (loadingProgress!.cumulativeBytesLoaded /
                    loadingProgress!.expectedTotalBytes!)
              : null,
        ),
      ),
    );
  }
}

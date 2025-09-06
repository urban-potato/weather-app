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
    return Center(
      child: SizedBox(
        width: size,
        height: size,
        child: CircularProgressIndicator(
          strokeCap: StrokeCap.round,
          semanticsLabel: semanticsLabel,
          color: Theme.of(context).brightness == Brightness.light
              ? Theme.of(context).primaryColorDark
              : Theme.of(context).primaryColorLight,
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

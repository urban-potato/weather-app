import 'package:flutter/material.dart';

import '../../../../../shared/ui/custom_circular_progress_indicator/index.dart';

class ImageAssetWithNetworkFallback extends StatelessWidget {
  const ImageAssetWithNetworkFallback({
    super.key,
    required this.assetPath,
    required this.networkPath,
    this.errorWidget = const SizedBox(),
    this.semanticLabel,
    this.loadingIndicatorSize,
  });

  final String assetPath;
  final String networkPath;
  final Widget errorWidget;
  final String? semanticLabel;
  final double? loadingIndicatorSize;

  @override
  Widget build(BuildContext context) {
    return assetPath.isNotEmpty
        ? Image.asset(
            assetPath,
            semanticLabel: semanticLabel,
            errorBuilder: (context, error, stackTrace) => Image.network(
              networkPath,
              semanticLabel: semanticLabel,
              errorBuilder: (context, error, stackTrace) => errorWidget,
              loadingBuilder:
                  (
                    BuildContext context,
                    Widget child,
                    ImageChunkEvent? loadingProgress,
                  ) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return CustomCircularProgressIndicator(
                      size: loadingIndicatorSize,
                      loadingProgress: loadingProgress,
                    );
                  },
            ),
          )
        : Image.network(
            networkPath,
            semanticLabel: semanticLabel,
            errorBuilder: (context, error, stackTrace) => errorWidget,
          );
  }
}

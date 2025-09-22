import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerWidget, WidgetRef;

import '../../../../../../shared/presentation/providers/index.dart'
    show responsiveSizeServiceProvider;

class SunInfoWidget extends ConsumerWidget {
  const SunInfoWidget({
    super.key,
    required this.sunriseTime,
    required this.sunsetTime,
  });

  final String sunriseTime;
  final String sunsetTime;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (kDebugMode) print('SunInfoWidget build');

    final sizeService = ref.read(responsiveSizeServiceProvider.notifier);

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final constraintsMaxWidth = constraints.maxWidth;
        final iconize = sizeService.percentageOf(constraintsMaxWidth, 20);
        final spacing = sizeService.percentageOf(constraintsMaxWidth, 1.9);

        if (kDebugMode) print('SunInfoWidget LayoutBuilder');

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
                  _ThemedRichText(time: sunriseTime, label: 'Sunrise'),
                  _ThemedRichText(time: sunsetTime, label: 'Sunset'),
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

class _ThemedRichText extends StatelessWidget {
  const _ThemedRichText({required this.time, required this.label});

  final String time;
  final String label;

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) print('SunInfoWidget _InfoText');

    return RichText(
      text: TextSpan(
        text: time,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.bold,
          height: 1.5,
        ),
        children: [
          TextSpan(
            text: ' $label',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}

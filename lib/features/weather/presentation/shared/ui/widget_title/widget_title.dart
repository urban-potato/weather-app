import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerWidget, WidgetRef;
import 'package:talker_flutter/talker_flutter.dart' show Talker;

import '../../../../../../shared/presentation/providers/index.dart'
    show responsiveSizeServiceProvider;
import '../../../../../../shared/presentation/ui/themed_text/index.dart';

class WidgetTitle extends ConsumerWidget {
  const WidgetTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    context.read<Talker>().info('WidgetTitle build');

    final sizeService = ref.read(responsiveSizeServiceProvider.notifier);
    final bottomPadding = sizeService.screenPercentage(0.75);

    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: ThemedText(
        text: title,
        styleType: AppTextStyle.titleMedium,
        overflow: TextOverflow.clip,
      ),
    );
  }
}

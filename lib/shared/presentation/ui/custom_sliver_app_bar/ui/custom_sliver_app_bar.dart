import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/index.dart'
    show navigationServiceProvider, responsiveSizeServiceProvider;
import '../../../../domain/services/index.dart' show NavigationService;

typedef ActionConfig = ({IconData icon, VoidCallback? onPressed});

class CustomSliverAppBar extends ConsumerWidget {
  const CustomSliverAppBar({
    super.key,
    this.title,
    this.ifShowArrowBack = true,
    this.leading,
    this.leadingIcon,
    this.leadingCallback,
    this.actions,
    this.actionConfigs,
  });

  final String? title;
  final bool ifShowArrowBack;
  final Widget? leading;
  final IconData? leadingIcon;
  final VoidCallback? leadingCallback;
  final List<Widget>? actions;
  final List<ActionConfig>? actionConfigs;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigationService = ref.read(navigationServiceProvider);
    final sizeService = ref.read(responsiveSizeServiceProvider.notifier);

    final toolbarHeight = sizeService.screenPercentage(12);
    final contentSize = sizeService.screenPercentage(5);

    final theme = Theme.of(context);

    final finalLeading = Align(
      alignment: Alignment.centerLeft,
      child: _buildLeading(
        context: context,
        navigationService: navigationService,
        contentSize: contentSize,
      ),
    );
    final finalActions = _buildActions(contentSize: contentSize);
    final finalTitle = _buildTitle(theme: theme, contentSize: contentSize);

    if (kDebugMode) print('CustomSliverAppBar build');

    return SliverAppBar(
      pinned: true,
      toolbarHeight: toolbarHeight,
      title: finalTitle,
      centerTitle: true,
      backgroundColor: theme.scaffoldBackgroundColor,
      surfaceTintColor: theme.scaffoldBackgroundColor,
      leading: finalLeading,
      actions: finalActions,
      leadingWidth: toolbarHeight,
    );
  }

  Widget? _buildTitle({required ThemeData theme, required double contentSize}) {
    if (title == null) return null;

    final finalTitle = Text(
      title!,
      style: theme.textTheme.headlineMedium?.copyWith(fontSize: contentSize),
    );

    return finalTitle;
  }

  List<Widget>? _buildActions({required double contentSize}) {
    if (actions == null && actionConfigs == null) return null;

    List<Widget>? finalActions = actions;

    if (finalActions == null && actionConfigs != null) {
      finalActions = actionConfigs!.map((config) {
        return IconButton(
          icon: Icon(config.icon),
          iconSize: contentSize,
          onPressed: config.onPressed ?? () {},
        );
      }).toList();
    }
    return finalActions;
  }

  Widget? _buildLeading({
    required BuildContext context,
    required NavigationService navigationService,
    required double contentSize,
  }) {
    if (leading == null && leadingIcon == null) {
      if (ifShowArrowBack) {
        return IconButton(
          icon: const Icon(Icons.arrow_back),
          iconSize: contentSize,
          onPressed: () => navigationService.pop(context),
        );
      }
      return null;
    }

    Widget? finalLeading;

    if (leading != null) {
      finalLeading = leading;
    } else if (leadingIcon != null) {
      finalLeading = IconButton(
        icon: Icon(leadingIcon),
        iconSize: contentSize,
        onPressed: leadingCallback ?? () {},
      );
    }

    return finalLeading;
  }
}

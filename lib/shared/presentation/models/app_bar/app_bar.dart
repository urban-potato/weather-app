import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

typedef ActionConfig = ({IconData icon, VoidCallback? onPressed});

class AppBarModelUI extends Equatable {
  final String? title;
  final bool? ifShowArrowBack;
  final Widget? leading;
  final IconData? leadingIcon;
  final VoidCallback? leadingCallback;
  final List<Widget>? actions;
  final List<ActionConfig>? actionConfigs;

  const AppBarModelUI({
    this.title,
    this.ifShowArrowBack,
    this.leading,
    this.leadingIcon,
    this.leadingCallback,
    this.actions,
    this.actionConfigs,
  });

  AppBarModelUI copyWith({
    String? title,
    bool? ifShowArrowBack,
    Widget? leading,
    IconData? leadingIcon,
    VoidCallback? leadingCallback,
    List<Widget>? actions,
    List<ActionConfig>? actionConfigs,
  }) {
    return AppBarModelUI(
      title: title ?? this.title,
      ifShowArrowBack: ifShowArrowBack ?? this.ifShowArrowBack,
      leading: leading ?? this.leading,
      leadingIcon: leadingIcon ?? this.leadingIcon,
      leadingCallback: leadingCallback ?? this.leadingCallback,
      actions: actions ?? this.actions,
      actionConfigs: actionConfigs ?? this.actionConfigs,
    );
  }

  @override
  List<Object?> get props => [
    title,
    ifShowArrowBack,
    leading,
    leadingIcon,
    leadingCallback,
    actions,
    actionConfigs,
  ];
}

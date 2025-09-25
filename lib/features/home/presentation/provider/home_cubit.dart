import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/presentation/models/index.dart'
    show AppBarModelUI, ActionConfig;
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState(appBar: AppBarModelUI()));

  void changeAppBar({
    String? title,
    bool? ifShowArrowBack,
    Widget? leading,
    IconData? leadingIcon,
    VoidCallback? leadingCallback,
    List<Widget>? actions,
    List<ActionConfig>? actionConfigs,
  }) {
    final appBar = AppBarModelUI(
      title: title,
      ifShowArrowBack: ifShowArrowBack,
      leading: leading,
      leadingIcon: leadingIcon,
      leadingCallback: leadingCallback,
      actions: actions,
      actionConfigs: actionConfigs,
    );
    emit(HomeState(appBar: appBar));
  }

  void updateAppBarTitle({String? title}) {
    final appBar = state.appBar.copyWith(title: title);
    emit(HomeState(appBar: appBar));
  }
}

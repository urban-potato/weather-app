import 'package:equatable/equatable.dart';

import '../../../../shared/presentation/models/app_bar/app_bar.dart'
    show AppBarModelUI;

class HomeState extends Equatable {
  final AppBarModelUI appBar;

  const HomeState({required this.appBar});

  @override
  List<Object?> get props => [appBar];
}

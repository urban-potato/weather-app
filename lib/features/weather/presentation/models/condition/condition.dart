import 'package:equatable/equatable.dart';

class ConditionModelUI extends Equatable {
  final String text;
  final String iconPath;

  const ConditionModelUI({required this.text, required this.iconPath});

  @override
  List<Object?> get props => [text, iconPath];
}

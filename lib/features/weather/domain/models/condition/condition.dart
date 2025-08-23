import 'package:equatable/equatable.dart';

class ConditionModelDomain extends Equatable {
  final String text;
  final String iconPath;
  final int code;

  const ConditionModelDomain({
    required this.text,
    required this.iconPath,
    required this.code,
  });

  @override
  List<Object?> get props => [text, iconPath, code];
}

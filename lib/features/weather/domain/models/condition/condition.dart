import 'package:equatable/equatable.dart';

class ConditionModelDomain extends Equatable {
  final String text;
  final String networkIconPath;
  final int code;

  const ConditionModelDomain({
    required this.text,
    required this.networkIconPath,
    required this.code,
  });

  @override
  List<Object?> get props => [text, networkIconPath, code];
}

import 'package:equatable/equatable.dart';

class ConditionModelUI extends Equatable {
  final String text;
  final String networkIconPath;
  final String assetIconPath;

  const ConditionModelUI({
    required this.text,
    required this.networkIconPath,
    required this.assetIconPath,
  });

  @override
  List<Object?> get props => [text, networkIconPath, assetIconPath];
}

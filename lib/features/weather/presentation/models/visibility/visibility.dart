import 'package:equatable/equatable.dart';

class VisibilityModelUI extends Equatable {
  final int kilometers;
  final int miles;

  const VisibilityModelUI({required this.kilometers, required this.miles});

  @override
  List<Object?> get props => [kilometers, miles];
}

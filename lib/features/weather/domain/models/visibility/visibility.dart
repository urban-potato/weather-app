import 'package:equatable/equatable.dart';

class VisibilityModelDomain extends Equatable {
  final double kilometers;
  final double miles;

  const VisibilityModelDomain({required this.kilometers, required this.miles});

  @override
  List<Object?> get props => [kilometers, miles];
}

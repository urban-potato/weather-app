import 'package:equatable/equatable.dart';

class LocationModelDomain extends Equatable {
  final String name;
  final String country;

  const LocationModelDomain({required this.name, required this.country});

  @override
  List<Object?> get props => [name, country];
}

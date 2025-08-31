import 'package:equatable/equatable.dart';

class LocationModelDomain extends Equatable {
  final String name;
  final String country;
  final DateTime localtime;

  const LocationModelDomain({
    required this.name,
    required this.country,
    required this.localtime,
  });

  @override
  List<Object?> get props => [name, country, localtime];
}

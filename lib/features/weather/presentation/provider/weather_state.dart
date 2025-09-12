import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../models/index.dart';

abstract class WeatherState extends Equatable {
  final WeatherModelUI? weather;
  final DioException? error;

  const WeatherState({this.weather, this.error});

  @override
  List<Object?> get props => [weather, error];
}

class WeatherInitial extends WeatherState {
  const WeatherInitial();
}

class WeatherLoading extends WeatherState {
  const WeatherLoading({super.weather});
}

class WeatherLoaded extends WeatherState {
  const WeatherLoaded({super.weather});
}

class WeatherFailure extends WeatherState {
  const WeatherFailure({super.weather, super.error});
}

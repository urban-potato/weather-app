import 'dart:developer';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/services/index.dart';
import '../../shared/utils/update_permission_helper/index.dart';
import '../mappers/weather.dart';
import '../../../../shared/resources/remote_data_state/index.dart';
import '../../domain/usecases/index.dart';
import 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit({
    required GetWeatherUseCase getWeatherUseCase,
    required this.conditionsService,
  }) : _getWeatherUseCase = getWeatherUseCase,
       super(const WeatherLoading());

  final GetWeatherUseCase _getWeatherUseCase;
  final ConditionsService conditionsService;

  Future<void> loadWeather() async {
    if (kDebugMode) print('--- CUBIT WeatherBloc _loadWeather ---');
    final weather = state.weather;
    final lastUpdated = weather?.lastUpdated;

    if (kDebugMode) log('emit(WeatherLoading(weather: state.weather));');
    emit(WeatherLoading(weather: weather));

    // if (kDebugMode) log('emit(const WeatherLoading());');
    // emit(const WeatherLoading());

    if (!isUpdateAllowed(lastUpdated)) {
      await Future.delayed(const Duration(seconds: 1));
      if (kDebugMode) log('WE DON\'T UPDATE HEHEHEHEHE');
      if (kDebugMode) log('emit(WeatherLoaded(weather: state.weather));');
      emit(WeatherLoaded(weather: weather));
      return;
    }

    final dataState = await _getWeatherUseCase();

    if (dataState is RemoteDataSuccess && dataState.data != null) {
      final dataModelUI = dataState.data!.toWeatherModelUI(conditionsService);
      if (kDebugMode) log('emit(WeatherLoaded(dataModelUI));');
      emit(WeatherLoaded(weather: dataModelUI));
      return;
    }

    if (kDebugMode) log('emit(WeatherFailure(dataState.error));');
    emit(WeatherFailure(error: dataState.error));
  }
}

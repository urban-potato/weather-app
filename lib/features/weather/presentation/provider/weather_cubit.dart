import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/utils/update_permission_helper/index.dart';
import '../mappers/weather.dart';
import '../../../../shared/resources/data_state/index.dart';
import '../../domain/usecases/index.dart';
import 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit({required GetWeatherUseCase getWeatherUseCase})
    : _getWeatherUseCase = getWeatherUseCase,
      super(const WeatherLoading());

  final GetWeatherUseCase _getWeatherUseCase;

  Future<void> loadWeather() async {
    print('--- CUBIT WeatherBloc _loadWeather ---');
    final weather = state.weather;
    final lastUpdated = weather?.lastUpdated;

    log('emit(WeatherLoading(weather: state.weather));');
    emit(WeatherLoading(weather: weather));

    // log('emit(const WeatherLoading());');
    // emit(const WeatherLoading());

    if (!isUpdateAllowed(lastUpdated)) {
      await Future.delayed(const Duration(seconds: 1));
      log('WE DON\'T UPDATE HEHEHEHEHE');
      log('emit(WeatherLoaded(weather: state.weather));');
      emit(WeatherLoaded(weather: weather));
      return;
    }

    final dataState = await _getWeatherUseCase();

    if (dataState is DataSuccess && dataState.data != null) {
      final dataModelUI = dataState.data!.toWeatherModelUI();
      log('emit(WeatherLoaded(dataModelUI));');
      emit(WeatherLoaded(weather: dataModelUI));
      return;
    }

    log('emit(WeatherFailure(dataState.error));');
    emit(WeatherFailure(error: dataState.error));
  }
}

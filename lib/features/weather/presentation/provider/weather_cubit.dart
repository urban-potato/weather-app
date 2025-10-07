import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/services/index.dart';
import '../shared/utils/update_permission_helper/index.dart';
import '../mappers/weather.dart';
import '../../../../shared/domain/data_states/remote/index.dart';
import '../../domain/usecases/index.dart';
import 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit({
    required GetWeatherUseCase getWeatherUseCase,
    required this.conditionsService,
  }) : _getWeatherUseCase = getWeatherUseCase,
       super(const WeatherInitial());

  final GetWeatherUseCase _getWeatherUseCase;
  final ConditionsService conditionsService;

  Future<void> loadWeather() async {
    final weather = state.weather;
    final lastUpdated = weather?.lastUpdated;

    emit(WeatherLoading(weather: weather));

    if (!isUpdateAllowed(lastUpdated)) {
      await Future.delayed(const Duration(seconds: 1));
      emit(WeatherLoaded(weather: weather));
      return;
    }

    final dataState = await _getWeatherUseCase();

    if (dataState is RemoteDataSuccess && dataState.data != null) {
      final dataModelUI = dataState.data!.toWeatherModelUI(conditionsService);
      emit(WeatherLoaded(weather: dataModelUI));
      return;
    }

    emit(WeatherFailure(weather: weather, error: dataState.error));
  }
}

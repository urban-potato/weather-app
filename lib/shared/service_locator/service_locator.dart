import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/weather/data/data_sources/local/index.dart';
import '../../features/weather/data/data_sources/remote/index.dart';
import '../../features/weather/data/repositories_impl/index.dart';
import '../../features/weather/domain/repositories/index.dart';
import '../../features/weather/domain/usecases/index.dart';
import '../../features/weather/presentation/provider/weather_cubit.dart';
import '../../features/weather/shared/utils/conditions_helper/index.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<Dio>(Dio());
  sl.registerSingleton<WeatherApiService>(WeatherApiService(sl<Dio>()));
  sl.registerSingleton<WeatherRepository>(
    WeatherRepositoryImpl(weatherApiService: sl<WeatherApiService>()),
  );
  sl.registerSingleton<GetWeatherUseCase>(
    GetWeatherUseCase(weatherRepository: sl<WeatherRepository>()),
  );
  sl.registerFactory<WeatherCubit>(
    () => WeatherCubit(getWeatherUseCase: sl<GetWeatherUseCase>()),
  );

  sl.registerSingleton<ConditionsService>(const ConditionsService());
  sl.registerSingleton<ConditionsRepository>(
    ConditionsRepositoryImpl(conditionsService: sl<ConditionsService>()),
  );
  sl.registerSingleton<GetConditionsUseCase>(
    GetConditionsUseCase(conditionsRepository: sl<ConditionsRepository>()),
  );
  sl.registerSingleton<ConditionsHelper>(
    ConditionsHelper(getConditionsUseCase: sl<GetConditionsUseCase>()),
  );
  await sl<ConditionsHelper>().loadConditions();
}

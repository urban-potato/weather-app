import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/weather/data/data_sources/local/index.dart';
import '../../features/weather/data/data_sources/remote/index.dart';
import '../../features/weather/data/repositories_impl/index.dart';
import '../../features/weather/domain/repositories/index.dart';
import '../../features/weather/domain/services/index.dart';
import '../../features/weather/domain/usecases/index.dart';
import '../../features/weather/presentation/provider/weather_cubit.dart';
import '../../features/weather/data/services_impl/index.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies() async {
  // remote services
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<WeatherApiClient>(WeatherApiClient(getIt<Dio>()));
  getIt.registerSingleton<WeatherRepository>(
    WeatherRepositoryImpl(weatherApiService: getIt<WeatherApiClient>()),
  );
  getIt.registerSingleton<GetWeatherUseCase>(
    GetWeatherUseCase(weatherRepository: getIt<WeatherRepository>()),
  );

  // local services
  getIt.registerSingleton<ConditionsClient>(const ConditionsClient());
  getIt.registerSingleton<ConditionsRepository>(
    ConditionsRepositoryImpl(conditionsService: getIt<ConditionsClient>()),
  );
  getIt.registerSingleton<GetConditionsUseCase>(
    GetConditionsUseCase(conditionsRepository: getIt<ConditionsRepository>()),
  );

  // TODO: try catch?
  getIt.registerSingletonAsync<ConditionsService>(() async {
    final conditionsService = ConditionsServiceImpl(
      getConditionsUseCase: getIt<GetConditionsUseCase>(),
    );
    await conditionsService.loadConditions();

    return conditionsService;
  });

  // state management
  getIt.registerFactory<WeatherCubit>(
    () => WeatherCubit(
      getWeatherUseCase: getIt<GetWeatherUseCase>(),
      conditionsService: getIt<ConditionsService>(),
    ),
  );
}

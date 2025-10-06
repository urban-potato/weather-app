import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

import '../../features/weather/data/data_sources/local/index.dart';
import '../../features/weather/data/data_sources/remote/index.dart';
import '../../features/weather/data/repositories/index.dart';
import '../../features/weather/domain/repositories/index.dart';
import '../../features/weather/domain/services/index.dart';
import '../../features/weather/domain/usecases/index.dart';
import '../../features/weather/presentation/provider/weather_cubit.dart';
import '../../features/weather/data/services/index.dart';
import '../app_config.dart';

final getIt = GetIt.instance;

Future<void> initializeDependencies({required AppConfig config}) async {
  // remote services
  final talkerDioLogger = TalkerDioLogger(
    talker: config.talker,
    settings: const TalkerDioLoggerSettings(printResponseData: false),
  );

  final dio = Dio();
  dio.interceptors.add(talkerDioLogger);

  getIt.registerSingleton<Dio>(dio);
  getIt.registerSingleton<WeatherRemoteDataSource>(
    WeatherRemoteDataSource(getIt<Dio>()),
  );
  getIt.registerSingleton<WeatherRepository>(
    WeatherRepositoryImpl(
      weatherRemoteDataSource: getIt<WeatherRemoteDataSource>(),
    ),
  );
  getIt.registerSingleton<GetWeatherUseCase>(
    GetWeatherUseCase(weatherRepository: getIt<WeatherRepository>()),
  );

  // local services
  getIt.registerSingleton<ConditionsLocalDataSource>(
    const ConditionsLocalDataSource(),
  );
  getIt.registerSingleton<ConditionsRepository>(
    ConditionsRepositoryImpl(
      conditionsLocalDataSource: getIt<ConditionsLocalDataSource>(),
    ),
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

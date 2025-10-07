import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../shared/infrastructure/configs/api_config.dart';
import '../../../../shared/domain/data_states/remote/index.dart';
import '../../domain/models/index.dart' show WeatherModelDomain;
import '../../domain/repositories/index.dart';
import '../data_sources/remote/index.dart';
import '../mappers/index.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherRemoteDataSource _weatherRemoteDataSource;

  WeatherRepositoryImpl({
    required WeatherRemoteDataSource weatherRemoteDataSource,
  }) : _weatherRemoteDataSource = weatherRemoteDataSource;

  @override
  Future<RemoteDataState<WeatherModelDomain>> getWeather(
    String location,
  ) async {
    try {
      final httpResponse = await _weatherRemoteDataSource.getWeather(
        apiKey: weatherApiKey,
        days: weatherApiDays,
        ifGetAqi: weatherApiIfGetAqi,
        location: location,
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        final weatherModelData = httpResponse.data;

        return RemoteDataSuccess(weatherModelData.toWeatherModelDomain());
      } else {
        return RemoteDataFailed(
          DioException(
            requestOptions: httpResponse.response.requestOptions,
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            message: 'Some error occurred',
          ),
        );
      }
    } on DioException catch (e) {
      return RemoteDataFailed(e);
    }
  }
}

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../../shared/infrastructure/configs/api_config.dart';
import '../../../models/index.dart';

part 'weather.g.dart';

@RestApi(baseUrl: weatherApiBaseURL)
abstract class WeatherRemoteDataSource {
  factory WeatherRemoteDataSource(Dio dio) = _WeatherRemoteDataSource;

  @GET('/forecast.json')
  Future<HttpResponse<WeatherModelData>> getWeather({
    @Query('key') String? apiKey,
    @Query('q') String? location,
    @Query('days') String? days,
    @Query('aqi') String? ifGetAqi,
  });
}

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../../shared/constants/constants.dart';
import '../../../models/index.dart';

part 'weather_api_client.g.dart';

@RestApi(baseUrl: weatherApiBaseURL)
abstract class WeatherApiClient {
  factory WeatherApiClient(Dio dio) = _WeatherApiClient;

  @GET('/forecast.json')
  Future<HttpResponse<WeatherModelData>> getWeather({
    @Query('key') String? apiKey,
    @Query('q') String? location,
    @Query('days') String? days,
    @Query('aqi') String? ifGetAqi,
  });
}

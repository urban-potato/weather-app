import '../../../../shared/resources/data_state/index.dart';
import '../models/index.dart';

abstract interface class WeatherRepository {
  Future<DataState<WeatherModelDomain>> getWeather(String location);
}

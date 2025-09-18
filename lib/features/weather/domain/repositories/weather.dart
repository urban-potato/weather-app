import '../../../../shared/resources/remote_data_state/index.dart';
import '../models/index.dart';

abstract interface class WeatherRepository {
  Future<RemoteDataState<WeatherModelDomain>> getWeather(String location);
}

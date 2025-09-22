import '../../../../shared/domain/data_states/remote/index.dart';
import '../models/index.dart';

abstract interface class WeatherRepository {
  Future<RemoteDataState<WeatherModelDomain>> getWeather(String location);
}

import '../../../../shared/resources/data_state/index.dart';
import '../../../../shared/usecases/index.dart';
import '../models/index.dart';
import '../repositories/index.dart';

class GetWeatherUseCase
    implements UseCase<DataState<WeatherModelDomain>, String> {
  final WeatherRepository _weatherRepository;

  GetWeatherUseCase({required WeatherRepository weatherRepository})
    : _weatherRepository = weatherRepository;

  // TODO: Изменить захардкоденный location

  @override
  Future<DataState<WeatherModelDomain>> call({void params}) {
    return _weatherRepository.getWeather('London');
  }
}

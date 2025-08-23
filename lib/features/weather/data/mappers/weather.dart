import 'package:intl/intl.dart';

import '../../domain/models/index.dart';
import '../models/index.dart';

// TODO: Добавить проверки при парсинге - DateFormat, DateTime
extension on WeatherModelData {
  WeatherModelDomain toWeatherModelDomain() {
    final currentTemperatureDomain = TemperatureModelDomain(
      celsius: current.tempC,
      fahrenheit: current.tempF,
    );

    final currentConditionDomain = ConditionModelDomain(
      text: current.condition.text,
      iconPath: 'https:${current.condition.icon}',
      code: current.condition.code,
    );

    final currentWindDomain = WindModelDomain(
      speed: WindSpeedModelDomain(
        milePerHour: current.windMph,
        kilometrePerHour: current.windKph,
      ),
      direction: current.windDir,
    );

    final currentPressureDomain = PressureModelDomain(
      millibars: current.pressureMb,
      inches: current.pressureIn,
    );

    final currentFeelsLikeDomain = TemperatureModelDomain(
      celsius: current.feelslikeC,
      fahrenheit: current.feelslikeF,
    );

    final currentVisibilityDomain = VisibilityModelDomain(
      kilometers: current.visKm,
      miles: current.visMiles,
    );

    final currentAirQualityDomain = AirQualityModelDomain(
      co: current.airQuality.co,
      no2: current.airQuality.no2,
      o3: current.airQuality.o3,
      so2: current.airQuality.so2,
      pm25: current.airQuality.pm25,
      pm10: current.airQuality.pm10,
      gbDefraIndex: current.airQuality.gbDefraIndex,
    );

    final forecastDayListDomain = forecast.forecastday.map((f) {
      final sunDomain = SunModelDomain(
        sunrise: DateFormat(
          'yyyy-MM-dd h:mm a',
        ).parse('${f.date} ${f.astro.sunrise}'),
        sunset: DateFormat(
          'yyyy-MM-dd h:mm a',
        ).parse('${f.date} ${f.astro.sunset}'),
      );

      final moonDomain = MoonModelDomain(
        moonrise: DateFormat(
          'yyyy-MM-dd h:mm a',
        ).parse('${f.date} ${f.astro.moonrise}'),
        moonset: DateFormat(
          'yyyy-MM-dd h:mm a',
        ).parse('${f.date} ${f.astro.moonset}'),
        moonPhase: f.astro.moonPhase,
        moonIllumination: f.astro.moonIllumination,
      );

      final astroDomain = AstroModelDomain(sun: sunDomain, moon: moonDomain);

      final hourlyForecastDomain = f.hour.map((h) {
        final conditionDomain = ConditionModelDomain(
          text: h.condition.text,
          iconPath: 'https:${h.condition.icon}',
          code: h.condition.code,
        );

        final temperatureDomain = TemperatureModelDomain(
          celsius: h.tempC,
          fahrenheit: h.tempF,
        );

        final windSpeedDomain = WindSpeedModelDomain(
          milePerHour: h.windMph,
          kilometrePerHour: h.windKph,
        );

        return HourModelDomain(
          dateTime: DateTime.parse(h.time),
          condition: conditionDomain,
          temperature: temperatureDomain,
          windSpeed: windSpeedDomain,
        );
      }).toList();

      final maxTempDomain = TemperatureModelDomain(
        celsius: f.day.maxTempC,
        fahrenheit: f.day.maxTempF,
      );

      final minTempDomain = TemperatureModelDomain(
        celsius: f.day.minTempC,
        fahrenheit: f.day.minTempF,
      );

      final avgTempDomain = TemperatureModelDomain(
        celsius: f.day.avgTempC,
        fahrenheit: f.day.avgTempF,
      );

      final maxWindDomain = WindSpeedModelDomain(
        milePerHour: f.day.maxWindMph,
        kilometrePerHour: f.day.maxWindKph,
      );

      final avgVisabilityDomain = VisibilityModelDomain(
        kilometers: f.day.avgVisKm,
        miles: f.day.avgVisMiles,
      );

      final precipitationDomain = PrecipitationModelDomain(
        chanceOfRain: f.day.dailyChanceOfRain,
        chanceOfSnow: f.day.dailyChanceOfSnow,
      );

      final conditionDomain = ConditionModelDomain(
        text: f.day.condition.text,
        iconPath: 'https:${f.day.condition.icon}',
        code: f.day.condition.code,
      );

      return ForecastDayModelDomain(
        date: DateTime.parse(f.date),
        day: DayModelDomain(
          maxTemp: maxTempDomain,
          minTemp: minTempDomain,
          avgTemp: avgTempDomain,
          maxWind: maxWindDomain,
          avgVisability: avgVisabilityDomain,
          avgHumidity: f.day.avgHumidity,
          precipitation: precipitationDomain,
          condition: conditionDomain,
          uv: f.day.uv,
        ),
        astro: astroDomain,
        hourlyForecast: hourlyForecastDomain,
      );
    }).toList();

    return WeatherModelDomain(
      current: CurrentModelDomain(
        temperature: currentTemperatureDomain,
        condition: currentConditionDomain,
        wind: currentWindDomain,
        pressure: currentPressureDomain,
        humidity: current.humidity,
        feelsLike: currentFeelsLikeDomain,
        visibility: currentVisibilityDomain,
        uv: current.uv,
        airQuality: currentAirQualityDomain,
      ),
      forecast: ForecastModelDomain(forecastDayList: forecastDayListDomain),
      location: LocationModelDomain(
        name: location.name,
        country: location.country,
      ),
    );
  }
}

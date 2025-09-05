import '../../domain/models/index.dart';
import '../../domain/services/index.dart';
import '../models/index.dart';

extension ConvertToWeatherModelUI on WeatherModelDomain {
  WeatherModelUI toWeatherModelUI(ConditionsService conditionsService) {
    final todayDomain = forecast.forecastDayList[0];
    final tomorrowDomain = forecast.forecastDayList[1];

    final todayMainWeatherUI = MainWeatherModelUI(
      lastUpdated: current.lastUpdated,
      temperature: TemperatureModelUI(
        celsius: current.temperature.celsius.round(),
        fahrenheit: current.temperature.fahrenheit.round(),
      ),
      // TODO: здесь где ConditionModelUI text ну;но будет выдавать текст в зависимости от языка в settings пользователя
      condition: ConditionModelUI(
        text:
            conditionsService.getText(
              code: current.condition.code,
              isDay: current.isDay,
            ) ??
            current.condition.text,
        assetIconPath: conditionsService.getAssetIconPath(
          code: current.condition.code,
          isDay: current.isDay,
        ),
        networkIconPath: current.condition.networkIconPath,
      ),
      temperatureRange: TemperatureRangeModelUI(
        maximum: TemperatureModelUI(
          celsius: todayDomain.day.maxTemp.celsius.round(),
          fahrenheit: todayDomain.day.maxTemp.fahrenheit.round(),
        ),
        minimum: TemperatureModelUI(
          celsius: todayDomain.day.minTemp.celsius.round(),
          fahrenheit: todayDomain.day.minTemp.fahrenheit.round(),
        ),
      ),
      uv: current.uv.round(),
      airQualityGbDefraIndex: current.airQuality.gbDefraIndex,
    );

    final weeklyForecastPreviewUI = WeeklyForecastPreviewModelUI(
      weeklyForecastPreviewDayList: forecast.forecastDayList.take(3).map((f) {
        return WeeklyForecastPreviewDayModelUI(
          dateTime: f.date,
          condition: ConditionModelUI(
            text:
                conditionsService.getText(
                  code: f.day.condition.code,
                  isDay: true,
                ) ??
                f.day.condition.text,
            assetIconPath: conditionsService.getAssetIconPath(
              code: f.day.condition.code,
              isDay: true,
            ),
            networkIconPath: f.day.condition.networkIconPath,
          ),
          temperatureRange: TemperatureRangeModelUI(
            maximum: TemperatureModelUI(
              celsius: f.day.maxTemp.celsius.round(),
              fahrenheit: f.day.maxTemp.fahrenheit.round(),
            ),
            minimum: TemperatureModelUI(
              celsius: f.day.minTemp.celsius.round(),
              fahrenheit: f.day.minTemp.fahrenheit.round(),
            ),
          ),
        );
      }).toList(),
    );

    final todayHoursList = todayDomain.hourlyForecast
        .map((h) => _mapHourModelDomainToHourModelUI(h, conditionsService))
        .where((h) {
          final localDateTime = location.localtime;
          final hDateTime = h.dateTime;

          if (hDateTime.year == localDateTime.year &&
              hDateTime.month == localDateTime.month &&
              hDateTime.day == localDateTime.day &&
              hDateTime.hour >= localDateTime.hour) {
            return true;
          }
          return false;
        })
        .toList();

    if (todayHoursList.length < 24) {
      final tomorrowHoursList = tomorrowDomain.hourlyForecast
          .map((h) => _mapHourModelDomainToHourModelUI(h, conditionsService))
          .take(24 - todayHoursList.length);

      todayHoursList.addAll(tomorrowHoursList);
    }

    final todayHourlyForecastUi = HourlyForecastModelUI(
      localtime: location.localtime,
      hoursList: todayHoursList,
    );

    final todayAdditionalInfoUI = AdditionalInfoModelUI(
      wind: WindModelUI(
        speed: WindSpeedModelUI(
          milePerHour: current.wind.speed.milePerHour,
          kilometrePerHour: current.wind.speed.kilometrePerHour,
        ),
        direction: current.wind.direction,
      ),
      sun: SunModelUI(
        sunrise: todayDomain.astro.sun.sunrise,
        sunset: todayDomain.astro.sun.sunset,
      ),
      moon: MoonModelUI(
        phase: todayDomain.astro.moon.moonPhase,
        moonrise: todayDomain.astro.moon.moonrise,
        moonset: todayDomain.astro.moon.moonset,
        illumination: todayDomain.astro.moon.moonIllumination.round(),
      ),
      otherWeatherInfo: OtherWeatherInfoModelUI(
        feelsLike: TemperatureModelUI(
          celsius: current.feelsLike.celsius.round(),
          fahrenheit: current.feelsLike.fahrenheit.round(),
        ),
        humidity: current.humidity,
        pressure: PressureModelUI(
          millibars: current.pressure.millibars.round(),
          inches: current.pressure.inches.round(),
        ),
        visibility: VisibilityModelUI(
          kilometers: current.visibility.kilometers.round(),
          miles: current.visibility.miles.round(),
        ),
      ),
      precipitation: PrecipitationModelUI(
        chanceOfRain: todayDomain.day.precipitation.chanceOfRain,
        chanceOfSnow: todayDomain.day.precipitation.chanceOfSnow,
      ),
    );

    final weeklyForecastDayList = forecast.forecastDayList.take(7).map((f) {
      return WeeklyForecastDayModelUI(
        date: f.date,
        temperature: TemperatureModelUI(
          celsius: f.day.avgTemp.celsius.round(),
          fahrenheit: f.day.avgTemp.fahrenheit.round(),
        ),
        condition: ConditionModelUI(
          text:
              conditionsService.getText(
                code: f.day.condition.code,
                isDay: true,
              ) ??
              f.day.condition.text,
          assetIconPath: conditionsService.getAssetIconPath(
            code: f.day.condition.code,
            isDay: true,
          ),
          networkIconPath: f.day.condition.networkIconPath,
        ),
        temperatureRange: TemperatureRangeModelUI(
          maximum: TemperatureModelUI(
            celsius: f.day.maxTemp.celsius.round(),
            fahrenheit: f.day.maxTemp.fahrenheit.round(),
          ),
          minimum: TemperatureModelUI(
            celsius: f.day.minTemp.celsius.round(),
            fahrenheit: f.day.minTemp.fahrenheit.round(),
          ),
        ),
        uv: f.day.uv.round(),
        sun: SunModelUI(
          sunrise: f.astro.sun.sunrise,
          sunset: f.astro.sun.sunset,
        ),
        precipitation: PrecipitationModelUI(
          chanceOfRain: f.day.precipitation.chanceOfRain,
          chanceOfSnow: f.day.precipitation.chanceOfSnow,
        ),
        humidity: f.day.avgHumidity,
        visibility: VisibilityModelUI(
          kilometers: f.day.avgVisability.kilometers.round(),
          miles: f.day.avgVisability.miles.round(),
        ),
        windSpeed: WindSpeedModelUI(
          milePerHour: f.day.maxWind.milePerHour,
          kilometrePerHour: f.day.maxWind.kilometrePerHour,
        ),
      );
    }).toList();

    final weeklyMoonList = forecast.forecastDayList.map((f) {
      return MoonModelUI(
        phase: f.astro.moon.moonPhase,
        moonrise: f.astro.moon.moonrise,
        moonset: f.astro.moon.moonset,
        illumination: f.astro.moon.moonIllumination.round(),
      );
    }).toList();

    return WeatherModelUI(
      location: LocationModelUI(
        name: location.name,
        country: location.country,
        localtime: location.localtime,
      ),
      today: TodayModelUI(
        mainWeather: todayMainWeatherUI,
        weeklyForecastPreview: weeklyForecastPreviewUI,
        hourlyForecast: todayHourlyForecastUi,
        additionalInfo: todayAdditionalInfoUI,
      ),
      weeklyForecast: WeeklyForecastModelUI(
        forecastDayList: weeklyForecastDayList,
      ),
      weeklyMoon: WeeklyMoonModelUI(moonList: weeklyMoonList),
      lastUpdated: DateTime.now(),
    );
  }

  HourModelUI _mapHourModelDomainToHourModelUI(
    HourModelDomain h,
    ConditionsService conditionsService,
  ) {
    return HourModelUI(
      dateTime: h.dateTime,
      condition: ConditionModelUI(
        text:
            conditionsService.getText(code: h.condition.code, isDay: h.isDay) ??
            h.condition.text,
        assetIconPath: conditionsService.getAssetIconPath(
          code: h.condition.code,
          isDay: h.isDay,
        ),
        networkIconPath: h.condition.networkIconPath,
      ),
      temperature: TemperatureModelUI(
        celsius: h.temperature.celsius.round(),
        fahrenheit: h.temperature.fahrenheit.round(),
      ),
      windSpeed: WindSpeedModelUI(
        milePerHour: h.windSpeed.milePerHour,
        kilometrePerHour: h.windSpeed.kilometrePerHour,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerStatefulWidget, ConsumerState;
import 'package:intl/intl.dart';
import 'package:talker_flutter/talker_flutter.dart' show Talker;

import '../../../../../../../../shared/presentation/providers/index.dart'
    show responsiveSizeServiceProvider;
import '../../../../../../../../shared/presentation/ui/card_tile/index.dart';
import '../../../../../../../../shared/presentation/ui/custom_circular_progress_indicator/index.dart';
import '../../../../../shared/ui/responsive_info_list/index.dart';
import '../../../../../shared/utils/wind_direction_helper/index.dart';
import '../../../../../models/index.dart';
import '../../../../../provider/weather_cubit.dart';
import '../../../../../provider/weather_state.dart';
import '../../../../../widgets/sun_info/index.dart';
import '../../../../../shared/ui/widget_title/index.dart';
import 'components/moon_info.dart';
import 'components/wind_info.dart';

class AdditionalInfoWidget extends ConsumerStatefulWidget {
  const AdditionalInfoWidget({super.key});

  @override
  ConsumerState<AdditionalInfoWidget> createState() =>
      _AdditionalInfoWidgetState();
}

class _AdditionalInfoWidgetState extends ConsumerState<AdditionalInfoWidget>
    with AutomaticKeepAliveClientMixin<AdditionalInfoWidget> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    context.read<Talker>().info('AdditionalInfoWidget build');

    final sizeService = ref.read(responsiveSizeServiceProvider.notifier);
    final contentMaxWidth = sizeService.contentMaxWidth;
    final tilesSpacing = sizeService.screenPercentage(2.7);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const WidgetTitle(title: 'Additional Information'),

        Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: contentMaxWidth),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: tilesSpacing,
              children: [
                Flexible(
                  child: Column(
                    spacing: tilesSpacing,
                    children: const [
                      _WindInfoCard(),
                      _SunInfoCard(),
                      _MoonInfoCard(),
                    ],
                  ),
                ),

                Flexible(
                  child: Column(
                    spacing: tilesSpacing,
                    children: const [
                      _OtherWeatherInfoCard(),
                      _PrecipitationInfoCard(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _PrecipitationInfoCard extends StatelessWidget {
  const _PrecipitationInfoCard();

  @override
  Widget build(BuildContext context) {
    final talker = context.read<Talker>();
    talker.info('AdditionalInfoWidget _PrecipitationInfoCard build');

    return BlocSelector<WeatherCubit, WeatherState, PrecipitationModelUI?>(
      selector: (state) => state.weather?.today.additionalInfo.precipitation,
      builder: (context, state) {
        if (state == null) {
          talker.info(
            'AdditionalInfoWidget _PrecipitationInfoCard BlocSelector CustomCircularProgressIndicator',
          );

          return const CustomCircularProgressIndicator();
        } else {
          talker.info(
            'AdditionalInfoWidget _PrecipitationInfoCard BlocSelector CardTile',
          );

          final precipitationData = {
            'Chance of rain': '${state.chanceOfRain}%',
            'Chance of snow': '${state.chanceOfSnow}%',
          };

          return CardTile(child: ResponsiveInfoList(data: precipitationData));
        }
      },
    );
  }
}

class _OtherWeatherInfoCard extends StatelessWidget {
  const _OtherWeatherInfoCard();

  @override
  Widget build(BuildContext context) {
    final talker = context.read<Talker>();
    talker.info('AdditionalInfoWidget _OtherWeatherInfoCard build');

    return BlocSelector<WeatherCubit, WeatherState, OtherWeatherInfoModelUI?>(
      selector: (state) => state.weather?.today.additionalInfo.otherWeatherInfo,
      builder: (context, state) {
        if (state == null) {
          talker.info(
            'AdditionalInfoWidget _OtherWeatherInfoCard BlocSelector CustomCircularProgressIndicator',
          );

          return const CustomCircularProgressIndicator();
        } else {
          talker.info(
            'AdditionalInfoWidget _OtherWeatherInfoCard BlocSelector CardTile',
          );

          final otherWeatherData = {
            'Feels like': '${state.feelsLike.celsius}°',
            'Humidity': '${state.humidity}%',
            'Pressure': '${state.pressure.millibars} mbar',
            'Visibility': '${state.visibility.kilometers} km',
          };

          return CardTile(child: ResponsiveInfoList(data: otherWeatherData));
        }
      },
    );
  }
}

class _MoonInfoCard extends StatelessWidget {
  const _MoonInfoCard();

  @override
  Widget build(BuildContext context) {
    final talker = context.read<Talker>();
    talker.info('AdditionalInfoWidget _MoonInfoCard build');

    return BlocSelector<WeatherCubit, WeatherState, MoonModelUI?>(
      selector: (state) => state.weather?.today.additionalInfo.moon,
      builder: (context, state) {
        if (state == null) {
          talker.info(
            'AdditionalInfoWidget _MoonInfoCard BlocSelector CustomCircularProgressIndicator',
          );
          return const CustomCircularProgressIndicator();
        } else {
          talker.info(
            'AdditionalInfoWidget _MoonInfoCard BlocSelector CardTile',
          );

          return CardTile(child: MoonInfoWidget(moonPhase: state.phase));
        }
      },
    );
  }
}

class _SunInfoCard extends StatelessWidget {
  const _SunInfoCard();

  @override
  Widget build(BuildContext context) {
    final talker = context.read<Talker>();
    talker.info('AdditionalInfoWidget _SunInfoCard build');

    return BlocSelector<WeatherCubit, WeatherState, SunModelUI?>(
      selector: (state) => state.weather?.today.additionalInfo.sun,
      builder: (context, state) {
        if (state == null) {
          talker.info(
            'AdditionalInfoWidget _SunInfoCard BlocSelector CustomCircularProgressIndicator',
          );
          return const CustomCircularProgressIndicator();
        } else {
          talker.info(
            'AdditionalInfoWidget _SunInfoCard BlocSelector CardTile',
          );

          return CardTile(
            child: SunInfoWidget(
              sunriseTime: DateFormat.Hm().format(state.sunrise),
              sunsetTime: DateFormat.Hm().format(state.sunset),
            ),
          );
        }
      },
    );
  }
}

class _WindInfoCard extends StatelessWidget {
  const _WindInfoCard();

  @override
  Widget build(BuildContext context) {
    final talker = context.read<Talker>();
    talker.info('AdditionalInfoWidget _WindInfoCard build');

    return BlocSelector<WeatherCubit, WeatherState, WindModelUI?>(
      selector: (state) => state.weather?.today.additionalInfo.wind,
      builder: (context, state) {
        if (state == null) {
          talker.info(
            'AdditionalInfoWidget _WindInfoCard BlocSelector CustomCircularProgressIndicator',
          );
          return const CustomCircularProgressIndicator();
        } else {
          talker.info(
            'AdditionalInfoWidget _WindInfoCard BlocSelector CardTile',
          );

          return CardTile(
            child: WindInfoWidget(
              windDirection: getFullWindDirection(state.direction),
              windSpeed: '${state.speed.kilometrePerHour} km/h',
            ),
          );
        }
      },
    );
  }
}

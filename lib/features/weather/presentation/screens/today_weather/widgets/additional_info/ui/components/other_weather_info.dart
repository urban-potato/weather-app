import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talker_flutter/talker_flutter.dart' show Talker;

import '../../../../../../../../../shared/presentation/ui/card_tile/index.dart';
import '../../../../../../../../../shared/presentation/ui/custom_circular_progress_indicator/index.dart';
import '../../../../../../models/index.dart' show OtherWeatherInfoModelUI;
import '../../../../../../provider/index.dart';
import '../../../../../../shared/ui/responsive_info_list/index.dart';

class OtherWeatherInfoTile extends StatelessWidget {
  const OtherWeatherInfoTile({super.key});

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

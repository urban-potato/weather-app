import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talker_flutter/talker_flutter.dart' show Talker;

import '../../../../../../../../../shared/presentation/ui/card_tile/index.dart';
import '../../../../../../../../../shared/presentation/ui/custom_circular_progress_indicator/index.dart';
import '../../../../../../models/index.dart' show PrecipitationModelUI;
import '../../../../../../provider/index.dart';
import '../../../../../../shared/ui/responsive_info_list/index.dart';

class PrecipitationInfoTile extends StatelessWidget {
  const PrecipitationInfoTile({super.key});

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

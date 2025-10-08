import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:talker_flutter/talker_flutter.dart' show Talker;

import '../../../../../../../../../shared/presentation/ui/card_tile/index.dart';
import '../../../../../../../../../shared/presentation/ui/custom_circular_progress_indicator/index.dart';
import '../../../../../../models/index.dart' show SunModelUI;
import '../../../../../../provider/index.dart';
import '../../../../../../widgets/sun_info/index.dart';

class SunInfoTile extends StatelessWidget {
  const SunInfoTile({super.key});

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
        }

        talker.info('AdditionalInfoWidget _SunInfoCard BlocSelector CardTile');

        return CardTile(
          child: SunInfoWidget(
            sunriseTime: DateFormat.Hm().format(state.sunrise),
            sunsetTime: DateFormat.Hm().format(state.sunset),
          ),
        );
      },
    );
  }
}

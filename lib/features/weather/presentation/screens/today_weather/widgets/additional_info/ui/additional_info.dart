import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerStatefulWidget, ConsumerState;
import 'package:talker_flutter/talker_flutter.dart' show Talker;

import '../../../../../../../../shared/presentation/providers/index.dart'
    show responsiveSizeServiceProvider;
import '../../../../../shared/ui/widget_title/index.dart';
import 'components/moon_info.dart';
import 'components/other_weather_info.dart';
import 'components/precipitation_info.dart';
import 'components/sun_info.dart';
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
                      WindInfoTile(),
                      SunInfoTile(),
                      MoonInfoTile(),
                    ],
                  ),
                ),

                Flexible(
                  child: Column(
                    spacing: tilesSpacing,
                    children: const [
                      OtherWeatherInfoTile(),
                      PrecipitationInfoTile(),
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

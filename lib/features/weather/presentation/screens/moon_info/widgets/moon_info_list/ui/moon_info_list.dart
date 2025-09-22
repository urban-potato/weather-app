import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerWidget, WidgetRef;

import '../../../../../../../../shared/providers/index.dart'
    show responsiveSizeServiceProvider;
import 'components/day_tile.dart';

class MoonInfoListWidget extends ConsumerWidget {
  const MoonInfoListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sizeService = ref.read(responsiveSizeServiceProvider.notifier);

    final moonData = <MoonData>[
      MoonData(
        date: 'Today',
        moonPhase: 'New Moon',
        moonrise: '11:59 AM',
        moonset: '10:41 PM',
        moonIllumination: 26,
      ),
      MoonData(
        date: 'Tomorrow',
        moonPhase: 'Waxing Crescent',
        moonrise: '11:59 AM',
        moonset: '10:41 PM',
        moonIllumination: 10,
      ),
      MoonData(
        date: '05.07',
        moonPhase: 'First Quarter',
        moonrise: '11:59 AM',
        moonset: '10:41 PM',
        moonIllumination: 31,
      ),
      MoonData(
        date: '06.07',
        moonPhase: 'Waxing Gibbous',
        moonrise: '11:59 AM',
        moonset: '10:41 PM',
        moonIllumination: 23,
      ),
      MoonData(
        date: '07.07',
        moonPhase: 'Full Moon',
        moonrise: '11:59 AM',
        moonset: '10:41 PM',
        moonIllumination: 100,
      ),
      MoonData(
        date: '08.07',
        moonPhase: 'Waning Gibbous',
        moonrise: '11:59 AM',
        moonset: '10:41 PM',
        moonIllumination: 16,
      ),
      MoonData(
        date: '09.07',
        moonPhase: 'Last Quarter',
        moonrise: '11:59 AM',
        moonset: '10:41 PM',
        moonIllumination: 5,
      ),
    ];

    final separatorHeight = sizeService.screenPercentage(4);

    return SliverList.separated(
      itemBuilder: (context, index) => DayTileWidget(data: moonData[index]),
      separatorBuilder: (context, index) => SizedBox(height: separatorHeight),
      itemCount: moonData.length,
    );
  }
}

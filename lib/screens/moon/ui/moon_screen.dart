import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../../../shared/ui/custom_sliver_app_bar/index.dart';
import '../../../shared/utils/adjustable_size/index.dart';
import '../components/day_tile.dart';

@RoutePage()
class MoonScreen extends StatelessWidget {
  const MoonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final moonData = <MoonData>[
      MoonData(
        date: '03.07',
        moonPhase: 'New Moon',
        moonrise: '11:59 AM',
        moonset: '10:41 PM',
        moonIllumination: 26,
      ),
      MoonData(
        date: '04.07',
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

    ScreenBasedSize.instance.init(context);

    final hPadding = ScreenBasedSize.instance.getSidesPadding();
    final separatorHeight = ScreenBasedSize.instance.scaleByUnit(5);

    return CustomScrollView(
      slivers: [
        const CustomSliverAppBar(locationName: 'Saint Petersburg'),

        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: hPadding,
          ).copyWith(bottom: hPadding),
          sliver: SliverList.separated(
            itemBuilder: (context, index) => DayTile(data: moonData[index]),
            separatorBuilder: (context, index) =>
                SizedBox(height: separatorHeight),
            itemCount: moonData.length,
          ),
        ),
      ],
    );
  }
}

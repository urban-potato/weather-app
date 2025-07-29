import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import 'package:weather_app/shared/lib/adjustable_size/index.dart';
import '../../../shared/layout/card_tile/index.dart';
import '../../../shared/ui/custom_sliver_app_bar/index.dart';
import '../../../shared/ui/extra_weather_info/index.dart';
import '../../../shared/ui/main_weather/index.dart';
import '../../../shared/ui/sun_info/index.dart';

@RoutePage()
class WeekForecastScreen extends StatelessWidget {
  const WeekForecastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const CustomSliverAppBar(locationName: 'Saint Petersburg'),

        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          sliver: SliverList.separated(
            itemBuilder: (context, index) => const _DayTile(),
            separatorBuilder: (context, index) => const SizedBox(height: 26),
            itemCount: 7,
          ),
        ),
      ],
    );
  }
}

class _DayTile extends StatelessWidget {
  const _DayTile();

  @override
  Widget build(BuildContext context) {
    ScreenBasedSize.instance.init(context);

    final contentMaxWidth = ScreenBasedSize.instance.getContentMaxWidth();
    final tilesSpacing = ScreenBasedSize.instance.scaleByUnit(2.7);

    return Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: contentMaxWidth),
        child: Column(
          spacing: tilesSpacing,
          children: const [_DateTile(), _InfoWidgetsRow()],
        ),
      ),
    );
  }
}

class _InfoWidgetsRow extends StatelessWidget {
  const _InfoWidgetsRow();

  @override
  Widget build(BuildContext context) {
    ScreenBasedSize.instance.init(context);

    final contentMaxWidth = ScreenBasedSize.instance.getContentMaxWidth();
    final tilesSpacing = contentMaxWidth / 2 / 17;

    return Row(
      spacing: tilesSpacing,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Column(
            spacing: tilesSpacing,
            children: const [
              CardTile(child: MainWeatherWidget()),
              CardTile(child: SunInfoWidget()),
            ],
          ),
        ),

        const Flexible(child: CardTile(child: ExtraWeatherInfoWidget())),
      ],
    );
  }
}

class _DateTile extends StatelessWidget {
  const _DateTile();

  @override
  Widget build(BuildContext context) {
    ScreenBasedSize.instance.init(context);

    final horizontalPadding = ScreenBasedSize.instance.scaleByUnit(1);
    final verticalPadding = ScreenBasedSize.instance.scaleByUnit(2);
    final fontSize = ScreenBasedSize.instance.scaleByUnit(3.2);

    return CardTile(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: verticalPadding,
        horizontal: horizontalPadding,
      ),
      child: Text(
        '01.07',
        style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
        overflow: TextOverflow.clip,
      ),
    );
  }
}

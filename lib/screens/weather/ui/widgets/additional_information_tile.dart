import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../shared/ui/basic_tile/index.dart';

class AdditionalInformationTile extends StatelessWidget {
  const AdditionalInformationTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Additional Information',
          style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
        ),
        StaggeredGrid.count(
          crossAxisCount: 5,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: [
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 1,
              child: BasicTile(child: _AdditionalInformationWindTile()),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 3,
              mainAxisCellCount: 3,
              child: BasicTile(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: _AdditionalInformationBigTile(),
              ),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: 2,
              mainAxisCellCount: 1,
              child: BasicTile(child: _AdditionalInformationSunTile()),
            ),
          ],
        ),
      ],
    );
  }
}

class _AdditionalInformationBigTile extends StatelessWidget {
  const _AdditionalInformationBigTile();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _AdditionalInformationBigTileRow(label: 'Feels like', value: '28°'),
        _AdditionalInformationBigTileRow(label: 'Humidity', value: '40%'),
        _AdditionalInformationBigTileRow(label: 'Chance of rain', value: '27%'),
        _AdditionalInformationBigTileRow(label: 'Pressure', value: '1001 mbar'),
        _AdditionalInformationBigTileRow(label: 'UV', value: '1'),
        _AdditionalInformationBigTileRow(label: 'Visibility', value: '10 km'),
      ],
    );
  }
}

class _AdditionalInformationBigTileRow extends StatelessWidget {
  const _AdditionalInformationBigTileRow({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label),
            Text(value, style: TextStyle(fontWeight: FontWeight.w700)),
          ],
        ),
        Divider(height: 15),
      ],
    );
  }
}

class _AdditionalInformationSunTile extends StatelessWidget {
  const _AdditionalInformationSunTile();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                text: '04:02',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  height: 1.5,
                ),
                children: [
                  TextSpan(
                    text: ' Sunrize',
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            RichText(
              text: TextSpan(
                text: '21:39',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  height: 1.5,
                ),
                children: [
                  TextSpan(
                    text: ' Sunset',
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ],
        ),

        Icon(Icons.wb_sunny_outlined, size: 32),
      ],
    );
  }
}

class _AdditionalInformationWindTile extends StatelessWidget {
  const _AdditionalInformationWindTile();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Southwest',
              style: TextStyle(fontWeight: FontWeight.w700, height: 1.5),
            ),
            Text(
              '20.9 km/h',
              style: TextStyle(fontWeight: FontWeight.w700, height: 1.5),
            ),
          ],
        ),

        Icon(Icons.air, size: 32),
      ],
    );
  }
}

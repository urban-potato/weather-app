import 'package:flutter_riverpod/flutter_riverpod.dart' show Notifier;

import 'responsive_size.dart';

abstract class ResponsiveSizeNotifier extends Notifier<double?>
    implements ResponsiveSizeService {}

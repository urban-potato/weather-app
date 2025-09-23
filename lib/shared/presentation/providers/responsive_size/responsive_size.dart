import 'package:flutter_riverpod/flutter_riverpod.dart'
    show NotifierProvider, Notifier;

import '../../../domain/services/index.dart' show ResponsiveSizeService;

abstract class ResponsiveSizeNotifier extends Notifier<double?>
    implements ResponsiveSizeService {}

final responsiveSizeServiceProvider =
    NotifierProvider<ResponsiveSizeNotifier, double?>(() {
      throw UnimplementedError('ResponsiveSizeService not initialized');
    });

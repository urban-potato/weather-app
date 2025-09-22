import 'package:flutter_riverpod/flutter_riverpod.dart' show NotifierProvider;

import '../../../domain/services/index.dart' show ResponsiveSizeNotifier;

final responsiveSizeServiceProvider =
    NotifierProvider<ResponsiveSizeNotifier, double?>(() {
      throw UnimplementedError('ResponsiveSizeService not initialized');
    });

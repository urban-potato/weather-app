import 'package:flutter_riverpod/flutter_riverpod.dart' show NotifierProvider;

import '../../services/responsive_size/responsive_size_notifier.dart'
    show ResponsiveSizeNotifier;

final responsiveSizeServiceProvider =
    NotifierProvider<ResponsiveSizeNotifier, double?>(() {
      throw UnimplementedError('ResponsiveSizeService not initialized');
    });

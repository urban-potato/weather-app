import 'package:flutter_riverpod/flutter_riverpod.dart' show Provider;

import '../../services/index.dart' show NavigationService;

final navigationServiceProvider = Provider<NavigationService>((ref) {
  throw UnimplementedError('NavigationService not initialized');
});

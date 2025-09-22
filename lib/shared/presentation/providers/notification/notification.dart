import 'package:flutter_riverpod/flutter_riverpod.dart' show Provider;

import '../../../domain/services/index.dart' show NotificationService;

final notificationServiceProvider = Provider<NotificationService>((ref) {
  throw UnimplementedError('NotificationService not initialized');
});

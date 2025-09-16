import 'package:flutter/material.dart';

abstract interface class AnimatedBanner<S extends StatefulWidget>
    implements State<S> {
  void dismissWithAnimation();
}

abstract interface class NotificationService {
  void showMessage(BuildContext context, String message, {int duration});
  void dispose();
}

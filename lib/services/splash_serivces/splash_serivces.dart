import 'dart:async';

import 'package:flutter/cupertino.dart';

import '../../config/routes/routes_name.dart';

class SplashServices {
  void checkAuthentication(BuildContext context) {
    Timer(
      const Duration(seconds: 2),
          () => Navigator.pushNamedAndRemoveUntil(context, RoutesName.login, (route) => false),
    );
  }
}

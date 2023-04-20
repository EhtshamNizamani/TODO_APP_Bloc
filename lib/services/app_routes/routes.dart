import 'package:bloc_api/screen/home/recycle.dart';
import 'package:bloc_api/screen/home/home_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? onGanerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case HomeScreen.routeName:
        return MaterialPageRoute(builder: (context) => HomeScreen());
      case RecycelBinScreen.routeName:
        return MaterialPageRoute(
            builder: (context) => const RecycelBinScreen());
      default:
        return null;
    }
  }
}

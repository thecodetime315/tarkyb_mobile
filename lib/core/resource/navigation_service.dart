import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class NavigationService {
  static BuildContext? currentContext = navigatorKey.currentContext;


  static Future<dynamic>? navigateTo(String routeName, dynamic arguments) {
    return navigatorKey.currentState
        ?.pushNamed(routeName, arguments: arguments);
  }

  static void back() {
    return navigatorKey.currentState?.pop();
  }

  static  Future<dynamic>? navigateAndReplacement(String routeName, dynamic arguments) {
    return navigatorKey.currentState
        ?.pushReplacementNamed(routeName, arguments: arguments);
  }

  static Future<dynamic>? removeUntil(String routeName, dynamic arguments) {
    return navigatorKey.currentState?.pushNamedAndRemoveUntil(
        routeName, (Route<dynamic> route) => false,
        arguments: arguments);
  }
}

import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class NavigationService {
  static BuildContext? currentContext = navigatorKey.currentContext;

  static Route<dynamic> _materialPageRoute(Widget page) => MaterialPageRoute(builder: (_) => page);

  static Future<dynamic>? navigateTo(Widget page) {
    return navigatorKey.currentState!.push(_materialPageRoute(page));
  }

  static void back() {
    return navigatorKey.currentState?.pop();
  }

  static  Future<dynamic>? navigateAndReplacement(Widget page) {
    return navigatorKey.currentState!.pushReplacement(_materialPageRoute(page));
  }

  static Future<dynamic>? removeUntil(Widget page) {
    return navigatorKey.currentState?.pushAndRemoveUntil(
      _materialPageRoute(page),
          (_) => false,
    );
  }
}

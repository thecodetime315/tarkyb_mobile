import 'package:base_flutter/MyApp.dart';
import 'package:flutter/material.dart';

import 'app_strings_manager.dart';

class RoutesNames {
  static const String splashRoute = "/";
  static const String intro = "/intro";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPassWordRoute = "/forgotPassWord";
  static const String mainRoute = "/main";
  static const String storeDetailsRoute = "/storeDetails";
}

class RouteGenerator {
  static Route<dynamic> getRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesNames.mainRoute:
        return MaterialPageRoute(builder: (_) =>  MyApp());
      default:
        return undefineRoute();
    }
  }

  static Route<dynamic> undefineRoute() {
    return MaterialPageRoute(
      builder: (_) =>const Scaffold(
        body: Center(
          child: Text(AppStringsManager.notFound),
        ),
      ),
    );
  }
}

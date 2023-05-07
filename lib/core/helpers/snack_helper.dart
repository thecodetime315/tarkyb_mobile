import 'package:flutter/material.dart';

import '../resource/navigation_service.dart';

class SnackBarHelper {
  static void showAppSnack(Widget child, Color shapeColor, Color backgroundColor,
      {bool isShapeDefaultColor = true, bool isDefaultBackGroundColor = true, Duration? duration}) {
    ScaffoldMessenger.of(NavigationService.currentContext!).hideCurrentSnackBar();
    ScaffoldMessenger.of(NavigationService.currentContext!).showSnackBar(SnackBar(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: isShapeDefaultColor ? Colors.black : shapeColor,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        duration: duration ?? const Duration(milliseconds: 800),
        backgroundColor: isDefaultBackGroundColor ? Colors.white : backgroundColor,
        content: child));
  }

  static void showBasicSnack({required String msg, Color? color}) {
    ScaffoldMessenger.of(NavigationService.currentContext!).hideCurrentSnackBar();
    ScaffoldMessenger.of(NavigationService.currentContext!).showSnackBar(SnackBar(
      content: Text(msg),
      backgroundColor: color,
    ));
  }

  static void customShowAppSnack(Widget child, Color shapeColor, Color backgroundColor,
      {bool isShapeDefaultColor = true, bool isDefaultBackGroundColor = true}) {
    ScaffoldMessenger.of(NavigationService.currentContext!).hideCurrentSnackBar();
    ScaffoldMessenger.of(NavigationService.currentContext!).showSnackBar(SnackBar(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: isShapeDefaultColor ? Colors.black : shapeColor,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        duration: const Duration(milliseconds: 800),
        backgroundColor: isDefaultBackGroundColor ? Colors.white : backgroundColor,
        content: child));
  }
}
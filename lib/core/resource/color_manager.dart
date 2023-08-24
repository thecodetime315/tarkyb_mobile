import 'package:flutter/material.dart';

class ColorManager {
  // todo: add to singleton class
  static Color primary = HexColor.fromHex("#2B4560");
  static Color secondary = HexColor.fromHex("#009ECF");
  static Color darkGrey = HexColor.fromHex("#525252");
  static Color grey = HexColor.fromHex("#737477");
  static Color lightGrey = HexColor.fromHex("#9E9E9E");
  static Color primaryOpacity70 = HexColor.fromHex("#B3ED9728");
  static Color textOnBoarding = HexColor.fromHex("#009ECF");
  static Color detailsContainer = HexColor.fromHex("#3F37B1D6");

  // new colors
  static Color darkPrimary = HexColor.fromHex("#d17d11");
  static Color grey1 = HexColor.fromHex("#707070");
  static Color grey2 = HexColor.fromHex("#989898");
  static Color white = HexColor.fromHex("#FFFFFF");
  static Color offWhite = HexColor.fromHex("#F8F8F8");
  static Color error = HexColor.fromHex("#e61f34");
  static Color green = HexColor.fromHex("#90C73E");
  static Color black= HexColor.fromHex("#000000"); // red color
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "FF$hexColorString"; // 8 char with opacity 100%
    }
    return Color(int.parse(hexColorString, radix: 16));
  }
}
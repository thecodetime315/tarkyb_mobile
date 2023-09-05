// ignore_for_file: must_be_immutable

import 'package:base_flutter/core/resource/font_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../resource/color_manager.dart';

class MyText extends StatelessWidget {
  String title;
  Color? color = ColorManager.primary;
  double? size;
  TextAlign? alien = TextAlign.start;
  TextDecoration? decoration= TextDecoration.none;
  TextOverflow? overflow;
  bool? isNumber;
  FontWeight? fontWeight;

  MyText({required this.title, this.color, this.size, this.alien,this.decoration,this.overflow,this.isNumber=false,this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: alien,
      maxLines: 2,
      // textScaleFactor: context.locale.languageCode=="ar"? 1.2:1.4,
      style: TextStyle(
        color: color?? ColorManager.primary,
        fontSize: size?? 12,
        decoration: decoration,

        wordSpacing: 3,
        fontWeight: fontWeight?? FontWeight.w400,
        fontFamily: FontConstants.fontFamily
      ),
      overflow: overflow,
    );
  }
}

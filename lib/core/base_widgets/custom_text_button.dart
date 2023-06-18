

import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:flutter/material.dart';

import '../resource/font_manager.dart';

class CustomTextButton extends StatelessWidget {
  final String title;
  final Function() onTap;
  final Color? color;
  final AlignmentGeometry? alignment;
  final double? fontSize;
  final double? horizontal;
  final double? vertical;
  const CustomTextButton({Key? key, required this.title, required this.onTap, this.color, this.fontSize, this.alignment, this.horizontal, this.vertical}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment ?? Alignment.center,
      child: InkWell(
        onTap: onTap,
        child: Container(
          margin:  EdgeInsets.symmetric(horizontal: horizontal ?? 4,vertical:vertical ?? 5 ),
          child: Text(title,style: TextStyle(color:color ?? ColorManager.primary
            ,fontSize: fontSize ?? 15, fontFamily: FontConstants.fontFamily
          ),),
        ),
      ),
    );
  }
}
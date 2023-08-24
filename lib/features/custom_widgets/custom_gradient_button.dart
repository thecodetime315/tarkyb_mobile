import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:flutter/material.dart';

import '../../core/base_widgets/my_text.dart';


class CustomGradientButton extends StatelessWidget {
  final String title;
  final Function()? onTap;
  final Color? textColor;
  final Color? color;
  final Color? borderColor;
  final BorderRadius? borderRadius;
  final EdgeInsets? margin;
  final IconData? icon;
  final double? width;
  final double? fontSize;
  final double? height;
  final double? elevation;
  final bool? disabled;
  final String? fontFamily;
  final FontWeight? fontWeight;

  const CustomGradientButton({
    required this.title,
    this.onTap,
    this.color,
    this.disabled,
    this.textColor,
    this.borderRadius,
    this.margin,
    this.icon,
    this.borderColor,
    this.fontFamily,
    this.fontSize,
    this.width,
    this.height,
    this.fontWeight,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: disabled ?? false,
      child: Container(
        width: width ?? MediaQuery.of(context).size.width,
        height: height ?? 45,
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(5.0),
          gradient:  LinearGradient(
            begin: Alignment(1, 0),
            end: Alignment(-1.00, -0.00),
            colors: [
              ColorManager.primary,
              ColorManager.secondary,
            ],
          ),
        ),
        margin:
        margin ?? const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
            MaterialStateProperty.all(Colors.transparent,),
            shadowColor: MaterialStateProperty.all(Colors.transparent,),

            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: borderRadius ?? BorderRadius.circular(15.0),
              ),
            ),
          ),
          onPressed: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon != null
                  ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Icon(
                  icon,
                  color: textColor,
                  size: 20,
                ),
              )
                  : SizedBox(),
              MyText(
                title: title,
                size: fontSize ?? 14,
                color: textColor ?? ColorManager.white,
                fontWeight: FontWeight.w500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

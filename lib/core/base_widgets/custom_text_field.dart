import 'package:flutter/material.dart';

import '../resource/color_manager.dart';
import '../resource/font_manager.dart';
import '../resource/style_manager.dart';
import '../resource/value_manager.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hint;
  final String? upperText;
  final String? label;
  final TextInputAction? textInputAction;
  final FieldTypes fieldTypes;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType type;
  final bool readOnly;
  final bool? autoFocus;
  final int? maxLines;
  final double? width;
  final FocusNode? focusNode;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final void Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;
  const CustomTextField({
    this.controller,
    this.hint,
    required this.validator,
    this.textInputAction = TextInputAction.next,
    this.readOnly = false,
    this.label,
    this.maxLines = 1,
    this.onChanged,
    this.onTap,
    this.onFieldSubmitted,
    required this.fieldTypes,
    required this.type,
    this.suffixIcon,
    this.prefixIcon,
    this.width,
    this.focusNode,
    this.autoFocus,
    this.upperText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(
        vertical: AppPadding.p12,
        horizontal: AppPadding.p12,
      ),
      child: InkWell(
        onTap: onTap,
        child: AbsorbPointer(
          absorbing: fieldTypes == FieldTypes.clickable,
          child: TextFormField(
            autofocus: autoFocus ?? false,
            focusNode: focusNode,
            controller: controller,
            textInputAction: textInputAction,
            keyboardType: type,
            readOnly: readOnly,
            maxLines: maxLines,
            obscureText: fieldTypes == FieldTypes.password,
            autofillHints: getAutoFillHints(type),
            onChanged: onChanged,
            onFieldSubmitted: onFieldSubmitted,
            validator: validator,
            style: getMediumStyle(
                color: ColorManager.primary, fontSize: FontSize.s12),
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: ColorManager.white),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: ColorManager.white),
              ),
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: ColorManager.error),
              ),
              border: UnderlineInputBorder(),
              hintText: hint,
              hintStyle: TextStyle(color: ColorManager.white,fontSize: 14,fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ),
    );
  }
}

List<String> getAutoFillHints(TextInputType inputType) {
  if (inputType == TextInputType.emailAddress) {
    return [AutofillHints.email];
  } else if (inputType == TextInputType.datetime) {
    return [AutofillHints.birthday];
  } else if (inputType == TextInputType.phone) {
    return [AutofillHints.telephoneNumber];
  } else if (inputType == TextInputType.url) {
    return [AutofillHints.url];
  }
  return [AutofillHints.name, AutofillHints.username];
}

enum FieldTypes { normal, clickable, readonly, chat, password, rich, disable }

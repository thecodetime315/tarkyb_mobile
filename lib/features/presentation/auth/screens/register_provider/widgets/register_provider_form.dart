
import 'package:base_flutter/core/base_widgets/custom_text_field.dart';
import 'package:base_flutter/core/helpers/validator.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/localization/app_localizations.dart';



class RegisterProviderForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        CustomTextField(
          validator: (value) => value?.validateEmpty(context),
          fieldTypes: FieldTypes.normal,
          type: TextInputType.text,
          hint: "الرجاء ادخال الاسم",
        ),
        CustomTextField(
          validator: (value) => value?.validatePhone(context),
          fieldTypes: FieldTypes.normal,
          type: TextInputType.phone,
          hint: tr(context,'phone'),
        ),
        CustomTextField(
          validator: (value) => value?.validateEmpty(context),
          fieldTypes: FieldTypes.normal,
          type: TextInputType.emailAddress,
          upperText: "البريد الالكترونى (اختياري) ",
          hint: "الرجاء ادخال البريد الالكترونى",
          prefixIcon: Icon(
            Icons.email,
            color: ColorManager.primary,
          ),
        ),
        CustomTextField(
          validator: (value) => value?.validatePassword(context),
          fieldTypes: FieldTypes.password,
          type: TextInputType.text,
          hint: "الرجاء ادخال كلمة المرور",
          prefixIcon: Icon(
            Icons.lock,
            color: ColorManager.primary,
          ),
        ),
        CustomTextField(
          //todo change validate to confirm validate
          validator: (value) => value?.validatePassword(context),
          fieldTypes: FieldTypes.password,
          type: TextInputType.text,
          hint: "الرجاء ادخال تأكيد كلمة المرور",
          prefixIcon: Icon(
            Icons.lock,
            color: ColorManager.primary,
          ),
        ),
      ],
    ));
  }
}

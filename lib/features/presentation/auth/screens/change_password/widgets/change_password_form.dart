import 'package:base_flutter/core/base_widgets/custom_text_field.dart';
import 'package:base_flutter/core/helpers/validator.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:flutter/material.dart';

class ChangePasswordForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CustomTextField(
            validator: (value) => value?.validatePassword(context),
            fieldTypes: FieldTypes.password,
            type: TextInputType.text,
            hint: "كلمة المرور القديمة",
            textColor: ColorManager.primary,
          ),
          CustomTextField(
            validator: (value) => value?.validatePassword(context),
            fieldTypes: FieldTypes.password,
            type: TextInputType.text,
            hint: "كلمة المرور الجديدة",
            textColor: ColorManager.primary,

          ),
          CustomTextField(
            validator: (value) => value?.validatePasswordConfirm(context, pass: ''),
            fieldTypes: FieldTypes.password,
            type: TextInputType.text,
            hint: "تكرار كلمة المرور الجديدة",
            textColor: ColorManager.primary,

          ),
        ],
      ),
    );
  }
}

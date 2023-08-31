import 'package:base_flutter/core/helpers/validator.dart';
import 'package:base_flutter/features/presentation/auth/screens/reset_password/cubit/reset_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/base_widgets/custom_text_field.dart';
import '../../../../../../core/resource/color_manager.dart';



class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<ResetPasswordCubit>().formKey,
        child: Column(
      children: [
        CustomTextField(
          validator: (value) => value?.validatePassword(context),
          fieldTypes: FieldTypes.password,
          type: TextInputType.text,
          upperText: "كلمة المرور",
          hint: "الرجاء ادخال كلمة المرور",
          textColor: ColorManager.white,
          controller: context.read<ResetPasswordCubit>().passwordController,
          prefixIcon: Icon(
            Icons.lock,
            color: ColorManager.primary,
          ),
        ),
        CustomTextField(
          textColor: ColorManager.white,
          controller: context.read<ResetPasswordCubit>().confirmPasswordController,
          validator: (value) => value?.validatePasswordConfirm(context, pass: context.read<ResetPasswordCubit>().passwordController.text),
          fieldTypes: FieldTypes.password,
          type: TextInputType.text,
          upperText: "تأكيد كلمة المرور",
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

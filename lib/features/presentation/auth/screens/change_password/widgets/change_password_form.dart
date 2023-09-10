import 'package:base_flutter/core/base_widgets/custom_text_field.dart';
import 'package:base_flutter/core/helpers/validator.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:base_flutter/features/presentation/auth/screens/change_password/change_password_cubit/change_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ChangePasswordCubit>();
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          CustomTextField(
            controller: cubit.oldPassword,
            validator: (value) => value?.validatePassword(context),
            fieldTypes: FieldTypes.password,
            type: TextInputType.text,
            hint: "كلمة المرور القديمة",
            textColor: ColorManager.primary,
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextField(
            controller: cubit.newPassword,
            validator: (value) => value?.validatePassword(context),
            fieldTypes: FieldTypes.password,
            type: TextInputType.text,
            hint: "كلمة المرور الجديدة",
            textColor: ColorManager.primary,
          ),
          SizedBox(
            height: 10,
          ),
          CustomTextField(
            controller: cubit.confirmNewPassword,
            validator: (value) => value?.validatePasswordConfirm(context,
                pass: cubit.newPassword.text),
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

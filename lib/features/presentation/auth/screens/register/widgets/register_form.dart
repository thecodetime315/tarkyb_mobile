
import 'package:base_flutter/core/base_widgets/custom_text_field.dart';
import 'package:base_flutter/core/helpers/validator.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:base_flutter/features/presentation/auth/screens/register/register_cubit/register_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/localization/app_localizations.dart';



class RegisterForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<RegisterCubit>().formKey,
        child: Column(
      children: [
        CustomTextField(
          validator: (value) => value?.validateEmpty(context),
          fieldTypes: FieldTypes.normal,
          type: TextInputType.text,
          controller: context.read<RegisterCubit>().name,
          hint: "الرجاء ادخال الاسم",
          textColor: ColorManager.white,
        ),
        CustomTextField(
          textColor: ColorManager.white,

          validator: (value) => value?.validatePhone(context),
          fieldTypes: FieldTypes.normal,
          type: TextInputType.phone,
          controller: context.read<RegisterCubit>().phone,

          hint: tr(context,'phone'),
        ),
        CustomTextField(
          textColor: ColorManager.white,

          validator: (value) => value?.validateEmpty(context),
          fieldTypes: FieldTypes.normal,
          type: TextInputType.emailAddress,
          hint: "الرجاء ادخال البريد الالكترونى",
          controller: context.read<RegisterCubit>().email,
        ),
        CustomTextField(
          textColor: ColorManager.white,

          validator: (value) => value?.validatePassword(context),
          fieldTypes: FieldTypes.password,
          type: TextInputType.text,
          hint: "الرجاء ادخال كلمة المرور",
          controller: context.read<RegisterCubit>().passwordController,

          prefixIcon: Icon(
            Icons.lock,
            color: ColorManager.primary,
          ),
        ),
        CustomTextField(
          textColor: ColorManager.white,

          validator: (value) => value?.validatePasswordConfirm(context, pass: context.read<RegisterCubit>().passwordController.text,
    ),
          fieldTypes: FieldTypes.password,
          controller: context.read<RegisterCubit>().confirmPasswordController,

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

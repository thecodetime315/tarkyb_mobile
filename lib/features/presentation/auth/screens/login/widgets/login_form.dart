import 'package:base_flutter/core/helpers/validator.dart';
import 'package:base_flutter/core/localization/app_localizations.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:base_flutter/features/presentation/auth/screens/login/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/base_widgets/custom_text_field.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Form(
        key: context.read<LoginCubit>().formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              validator: (value) => value?.validateEmail(context),
              fieldTypes: FieldTypes.normal,
              type: TextInputType.emailAddress,
              controller: context.read<LoginCubit>().email,
              hint: tr(context, 'mail'),
              textColor: ColorManager.white,
            ),
            CustomTextField(
              validator: (value) => value?.validatePassword(context),
              fieldTypes: FieldTypes.password,
              type: TextInputType.text,
              controller: context.read<LoginCubit>().passwordController,
              hint: tr(context, "password"),
              textColor: ColorManager.white,

            ),
          ],
        ));
  }
}

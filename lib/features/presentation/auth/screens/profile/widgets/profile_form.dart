
import 'package:base_flutter/core/localization/app_localizations.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:base_flutter/features/presentation/auth/screens/profile/profile_cubit/profile_cubit.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/base_widgets/custom_text_field.dart';

import 'package:base_flutter/core/helpers/validator.dart';


class ProfileForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = ProfileCubit.get(context);
    return Form(
      key: cubit.formKey,
        child: Column(
      children: [
        CustomTextField(
          validator: (value) => value?.validateEmpty(context),
          fieldTypes: FieldTypes.normal,
          type: TextInputType.text,
          hint: tr(context, "name"),
          controller: cubit.name,
          textColor: ColorManager.primary,
        ),
        // CustomTextField(
        //   validator: (value) => value?.validatePhone(context),
        //   fieldTypes: FieldTypes.normal,
        //   type: TextInputType.phone,
        //   hint: tr(context,'phone'),
        //   controller: cubit.phone,
        //   textColor: ColorManager.primary,
        // ),
        CustomTextField (
          validator: (value) => value?.validateEmail(context),
          fieldTypes: FieldTypes.normal,
          type: TextInputType.emailAddress,
          controller: cubit.email,
          hint: tr(context, "mail"),
          textColor: ColorManager.primary,
        ),
      ],
    ));
  }
}

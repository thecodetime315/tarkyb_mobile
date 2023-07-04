import 'package:base_flutter/core/helpers/validator.dart';
import 'package:base_flutter/core/localization/app_localizations.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/base_widgets/custom_text_field.dart';




class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
          validator: (value) => value?.validatePhone(context),
          fieldTypes: FieldTypes.normal,
          type: TextInputType.phone,
          hint: tr(context,'mail'),
        ),

        CustomTextField(
          validator: (value) => value?.validatePhone(context),
          fieldTypes: FieldTypes.password,
          type: TextInputType.text,
          hint: tr(context,"password"),
        ),
      ],
    ));
  }
}

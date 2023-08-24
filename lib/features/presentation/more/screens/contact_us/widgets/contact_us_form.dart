import 'package:flutter/material.dart';
import 'package:base_flutter/core/helpers/validator.dart';
import '../../../../../../core/base_widgets/custom_text_field.dart';
import '../../../../../../core/localization/app_localizations.dart';
import '../../../../../../core/resource/color_manager.dart';

class ContactUsForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          CustomTextField(
              validator: (value) => value?.validateEmpty(context),
              fieldTypes: FieldTypes.normal,
              type: TextInputType.text,
              hint: "الاسم",
              textColor: ColorManager.primary),
          CustomTextField(
            validator: (value) => value?.validatePhone(context),
            fieldTypes: FieldTypes.normal,
            type: TextInputType.phone,
            hint: tr(context, 'phone'),
            textColor: ColorManager.primary,
          ),
          CustomTextField(
            validator: (value) => value?.validateEmpty(context),
            fieldTypes: FieldTypes.rich,
            type: TextInputType.text,
            hint: "الرساله",
            textColor:ColorManager.primary,
            maxLines: 5,
          ),
        ],
      ),
    );
  }
}

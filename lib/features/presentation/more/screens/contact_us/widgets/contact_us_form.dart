import 'package:base_flutter/features/presentation/more/screens/contact_us/cubit/contact_us_cubit.dart';
import 'package:flutter/material.dart';
import 'package:base_flutter/core/helpers/validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/base_widgets/custom_text_field.dart';
import '../../../../../../core/localization/app_localizations.dart';
import '../../../../../../core/resource/color_manager.dart';

class ContactUsForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<ContactUsCubit>();
    return Form(
      key: cubit.formKey,
      child: Column(
        children: [
          CustomTextField(
              validator: (value) => value?.validateEmpty(context),
              fieldTypes: FieldTypes.normal,
              type: TextInputType.text,
              controller: cubit.name,
              hint: "الاسم",
              textColor: ColorManager.primary),
          CustomTextField(
              validator: (value) => value?.validateEmail(context),
              fieldTypes: FieldTypes.normal,
              type: TextInputType.emailAddress,
              controller: cubit.email,
              hint: "البريد الالكتروني",
              textColor: ColorManager.primary),
          CustomTextField(
            validator: (value) => value?.validatePhone(context),
            fieldTypes: FieldTypes.normal,
            type: TextInputType.phone,
            controller: cubit.phone,
            hint: tr(context, 'phone'),
            textColor: ColorManager.primary,
          ),
          CustomTextField(
            validator: (value) => value?.validateEmpty(context),
            fieldTypes: FieldTypes.rich,
            type: TextInputType.text,
            hint: "الرساله",
            controller: cubit.message,
            textColor:ColorManager.primary,
            maxLines: 5,
          ),
        ],
      ),
    );
  }
}

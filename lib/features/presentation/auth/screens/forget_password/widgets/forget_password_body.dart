import 'package:base_flutter/core/base_widgets/custom_button.dart';
import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/core/helpers/validator.dart';
import 'package:base_flutter/core/resource/navigation_service.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/base_widgets/custom_text_field.dart';
import '../../../../../../core/base_widgets/my_text.dart';
import '../../../../../../core/localization/app_localizations.dart';
import '../../../../../../core/resource/color_manager.dart';
import '../../../../../custom_widgets/logo_widget.dart';
import '../../reset_password/reset_password_view.dart';
import 'forget_password_texts.dart';

class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          // LogoWidget(),
          AuthHeader(
            headerTitle: tr(context, 'forgetPassword'),
            headerWidget: MyText(
              title: "استرجاع حسابك",
              color: ColorManager.white,
              size: 17,
              fontWeight: FontWeight.w400,
            ),
          ),
          ForgetPasswordTexts(),
          Form(
            child: CustomTextField(
              validator: (value) => value?.validateEmail(context),
              fieldTypes: FieldTypes.normal,
              type: TextInputType.emailAddress,
              hint: tr(context, 'mail'),
              textColor: ColorManager.white,
            ),
          ),
          Spacer(),
          CustomButton(
            margin: EdgeInsets.only(bottom: 30),
            title: tr(context, "send"),
            width: context.width * 0.7,
            color: ColorManager.white,
            textColor: ColorManager.primary,
            onTap: () {
              NavigationService.navigateTo(ResetPasswordView());
            },
          ),
        ],
      ),
    );
  }
}

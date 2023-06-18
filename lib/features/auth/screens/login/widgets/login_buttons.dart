


import 'package:base_flutter/core/base_widgets/custom_button.dart';
import 'package:base_flutter/core/base_widgets/custom_text_button.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:base_flutter/core/resource/font_manager.dart';
import 'package:base_flutter/core/resource/navigation_service.dart';
import 'package:base_flutter/features/auth/screens/register/register_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../core/localization/app_localizations.dart';

class LoginButtons extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(title: tr('login'),onTap: (){},margin: EdgeInsets.symmetric(horizontal: 30,vertical: 25),),
        CustomTextButton(title: "تخطي التسجيل", onTap: (){},color: ColorManager.grey2,),
        Text.rich(
            TextSpan(
                text: tr("don'tHaveAccount"),
                style: TextStyle(fontSize: 16,fontWeight: FontWeight.normal,color: ColorManager.black,fontFamily: FontConstants.fontFamily),
                children: <InlineSpan>[
                  TextSpan(
                    text: tr("register"),
                    style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal,color: ColorManager.primary,fontFamily: FontConstants.fontFamily),
                    recognizer: TapGestureRecognizer()..onTap=(){
                      NavigationService.navigateTo(RegisterView());
                    }
                  )
                ]
            )
        )
      ],
    );
  }
}



import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/resource/color_manager.dart';

class ForgetPasswordTexts extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyText(title: "برجاء كتابة بريدك الإلكتروني لارسال كود التحقق",size: 14,fontWeight: FontWeight.w400,color: ColorManager.white,
        ),
        SizedBox(height: 35,),
      ],
    );
  }
}

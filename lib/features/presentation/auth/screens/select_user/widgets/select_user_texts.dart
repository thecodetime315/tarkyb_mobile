
import 'package:flutter/material.dart';

import '../../../../../../core/base_widgets/my_text.dart';
import '../../../../../../core/resource/color_manager.dart';

class SelectUserTexts extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyText(
          title:
          'أهلا وسهلا بك قم بتسجيل حساب \nوتمتع بالعديد من الخدمات والمزايا',
          size: 19,
          color: ColorManager.white,
        ),
        SizedBox(height: 50,),
        MyText(
          title:
          'حدد هويتك لبدء عملية التسجيل',
          size: 18,
          fontWeight: FontWeight.w400,
          color: ColorManager.white,
        ),
      ],
    );
  }
}



import 'package:flutter/material.dart';

import '../../../../core/base_widgets/my_text.dart';
import '../../../../core/resource/color_manager.dart';

class TechnicianTextsItem extends StatelessWidget {
  final String title;
  final String value;

  const TechnicianTextsItem({Key? key, required this.title, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(alignment: Alignment.topRight,child: MyText(title: title,size: 16,fontWeight: FontWeight.w400,color: ColorManager.primary,)),
        SizedBox(height: 7,),
        Align(alignment: Alignment.topRight,child: MyText(title: value,
          size: 14,fontWeight: FontWeight.w400,color: ColorManager.grey2,alien: TextAlign.start,)),
        SizedBox(height: 10,),
        Divider(height: 4,endIndent: 10,indent: 10,color: ColorManager.grey2,),


      ],
    );
  }
}

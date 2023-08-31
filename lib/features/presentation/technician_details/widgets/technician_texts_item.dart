

import 'package:flutter/material.dart';

import '../../../../core/base_widgets/my_text.dart';
import '../../../../core/resource/color_manager.dart';

class TechnicianTextsItem extends StatelessWidget {
  final String value;

  const TechnicianTextsItem({Key? key, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(alignment: Alignment.topRight,child: MyText(title: value,
      size: 14,fontWeight: FontWeight.w400,color: ColorManager.grey2,alien: TextAlign.start,));
  }
}

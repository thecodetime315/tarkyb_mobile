

import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:flutter/material.dart';

class TimeItem extends StatelessWidget {
  final String periodName;
  final String title;

  const TimeItem({Key? key, required this.title, required this.periodName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: MyText(title: periodName,size: 12,),
      subtitle: MyText(title: title,color: ColorManager.grey2,),
    );
  }
}

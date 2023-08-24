

import 'package:flutter/material.dart';

import '../../../../core/base_widgets/my_text.dart';
import '../../../../core/resource/color_manager.dart';

class OrderServiceItem extends StatelessWidget {
final String title;
final String value;
final bool? isLast;

  const OrderServiceItem({Key? key, required this.title, required this.value, this.isLast =false}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(title: "$title :", color: ColorManager.grey2,size: 12,),
              MyText(title: value, color: ColorManager.primary,size: 12,)
            ],
          ),
        ),
     isLast == false?    Divider(height: 5,color: ColorManager.grey2.withOpacity(0.7),
          endIndent: 15,indent: 15,) : SizedBox(),
      ],
    );
  }
}

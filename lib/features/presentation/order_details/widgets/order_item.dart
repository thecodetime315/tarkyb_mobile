

import 'package:base_flutter/core/extensions/media_query.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: 5.0,vertical: 15),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyText(title: "$title :", color: ColorManager.grey2,size: 12,),
              Container(constraints: BoxConstraints(maxWidth: context.width*0.6),child: MyText(title: value, color: ColorManager.primary,size: 11.5,),)
            ],
          ),
        ),
     isLast == false?    Divider(height: 5,color: ColorManager.grey2.withOpacity(0.7),
          endIndent: 15,indent: 15,) : SizedBox(),
      ],
    );
  }
}

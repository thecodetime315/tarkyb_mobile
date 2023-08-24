import 'package:base_flutter/core/base_widgets/cache_image.dart';
import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:flutter/material.dart';


class OrderDetailsServiceItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.13,

      padding: EdgeInsets.symmetric(horizontal: 5),
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: ColorManager.grey2.withOpacity(0.2)),
          boxShadow: [
            BoxShadow(
              color: ColorManager.grey2.withOpacity(0.15),
              blurRadius: 4,
              offset: Offset(1, 1),
              spreadRadius: 0,
            ),
          ]),
      child: Row(
        children: [
          CachedImage(
            url:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTlaCezvY_1lKlFT4NzQb5np7wZQ1TlROCyg&usqp=CAU",
            height: 80,
            width: 80,
            borderRadius: BorderRadius.circular(4),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(title: "تركيب مكيف سبليت",size: 12,),
              SizedBox(height: 10,),
              MyText(title: "عدد :2",size: 12,),

            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              MyText(title: "100ر.س",size: 12,),
              SizedBox(height: 10,),
              MyText(title: "الاجمالي : 200ر.س",size: 12,),

            ],
          ),
        ],
      ),
    );
  }
}

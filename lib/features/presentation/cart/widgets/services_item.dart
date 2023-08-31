

import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:flutter/material.dart';

import '../../../../core/base_widgets/cache_image.dart';
import '../../../../core/base_widgets/my_text.dart';
import '../../../../core/resource/color_manager.dart';

class ServicesItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: context.width*0.9,
      decoration: BoxDecoration(
        color: ColorManager.white,
        boxShadow: [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 4,
            offset: Offset(0, 4),
            spreadRadius: 0,
          )
        ],
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Color(0xFFF3F3F3)),

      ),
      padding: EdgeInsets.symmetric(horizontal: 5),
      margin: EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CachedImage(url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTlaCezvY_1lKlFT4NzQb5np7wZQ1TlROCyg&usqp=CAU",height: 30,width: 30,
            borderRadius: BorderRadius.circular(4),),
          MyText(
            title: "تركيب مكيف سبليت",
            size: 11,
          ),
          MyText(
            title: "150 ر.س",
            size: 11,
          ),
          Row(
            children: [
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  gradient:  LinearGradient(
                    begin: Alignment(1, 0),
                    end: Alignment(-1.00, -0.00),
                    colors: [
                      ColorManager.primary,
                      ColorManager.secondary,
                    ],
                  ),
                ),
                child: Center(child: MyText(title: "+",color: ColorManager.white,size: 25,),),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: MyText(
                  title: "2",
                  size: 12,
                ),
              ),
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: ColorManager.grey2.withOpacity(0.7)),
                ),
                child: Center(child: MyText(title: "-",color: ColorManager.grey2,size: 25,),),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

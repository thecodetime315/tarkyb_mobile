import 'package:flutter/material.dart';

import '../../../../core/base_widgets/my_text.dart';
import '../../../../core/resource/color_manager.dart';

class TechnicianInfo extends StatelessWidget {
  final String image;
  final String value;

  const TechnicianInfo({Key? key, required this.image, required this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
    // margin: EdgeInsets.symmetric(horizontal: 5),
      height: 65,
      width: 100,
      decoration: BoxDecoration(
        color: ColorManager.detailsContainer,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: ColorManager.white,
            radius: 17,
            child: Image.asset(
              image,
              scale: 2.3,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          MyText(
            title: value,
            size: 13,
            fontWeight: FontWeight.w400,
            color: ColorManager.primary,
          )
        ],
      ),
    );
  }
}

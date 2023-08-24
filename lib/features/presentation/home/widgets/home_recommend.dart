import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:base_flutter/core/resource/navigation_service.dart';
import 'package:flutter/material.dart';
import '../../../custom_widgets/technical_person_card.dart';
import '../../all_recommend_technicians/all_recommend_technicians.dart';

class HomeRecommend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            MyText(
              title: "ترشيحات لك",
              color: ColorManager.primary,
              size: 16,
              fontWeight: FontWeight.w400,
            ),
            InkWell(
                onTap: () {
                  NavigationService.navigateTo(AllRecommendTechnicians());
                },
                child: MyText(
                  title: "عرض الكل",
                  color: ColorManager.grey2,
                  size: 13,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.underline,
                )),
          ],
        ),
        SizedBox(
          height: 12,
        ),
        Column(
          children: List.generate(3, (index) => TechnicalPersonCard()),
        )
      ],
    );
  }
}

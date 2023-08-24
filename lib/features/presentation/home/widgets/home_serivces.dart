import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:flutter/material.dart';

import 'home_services_item.dart';

class HomeServices extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyText(
          title: "خدماتنا",
          fontWeight: FontWeight.w400,
          color: ColorManager.primary,
          alien: TextAlign.start,
          size: 16,
        ),
        SizedBox(
          height: 12,
        ),
        Wrap(
          children: List.generate(
              5,
              (index) => HomeServicesItem()),
        ),
      ],
    );
  }
}

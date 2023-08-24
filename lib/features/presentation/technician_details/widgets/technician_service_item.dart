

import 'package:flutter/material.dart';

import '../../../../core/base_widgets/my_text.dart';
import '../../../../core/resource/color_manager.dart';

class TechnicianServiceItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: ColorManager.grey2),
        ),
        child: Row(
          children: [
            Checkbox(value: false, onChanged: (val) {}),
            MyText(
              title: "الخدمات",
              size: 12,
              fontWeight: FontWeight.w400,
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: MyText(
                title: "250 ر.س",
                size: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

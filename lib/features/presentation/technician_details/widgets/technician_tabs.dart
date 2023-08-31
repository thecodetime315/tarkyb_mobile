
import 'package:flutter/material.dart';

import '../../../../core/resource/color_manager.dart';
import '../../../../core/resource/font_manager.dart';
import '../../orders/widgets/tab_bar_item.dart';

class TechnicianTabs extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
      child: TabBar(
        indicatorColor:ColorManager.primary,
        indicatorSize: TabBarIndicatorSize.tab,
        labelColor: ColorManager.primary,
        unselectedLabelColor: ColorManager.grey,
        labelStyle: TextStyle(
            fontFamily: FontConstants.fontFamily,
            fontWeight: FontWeight.w400,
            fontSize: 13,
            color: ColorManager.primary),
        unselectedLabelStyle: TextStyle(
            fontFamily: FontConstants.fontFamily,
            fontWeight: FontWeight.w400,
            fontSize: 13,
            color: ColorManager.grey),
        tabs: [
          TabBarItem(title: "الوصف"),
          TabBarItem(title: "الخدمات"),
          TabBarItem(title: "أيام العمل"),
          TabBarItem(title: "أراء العملاء"),
        ],
      ),
    );
  }
}

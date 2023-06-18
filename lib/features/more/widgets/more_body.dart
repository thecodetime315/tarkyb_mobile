import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/resource/assets_manager.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:base_flutter/core/resource/navigation_service.dart';
import 'package:base_flutter/features/more/screens/policy/policy_view.dart';
import 'package:base_flutter/features/more/screens/terms/terms_view.dart';
import 'package:base_flutter/features/more/widgets/more_item.dart';
import 'package:flutter/material.dart';

import '../screens/about/about_view.dart';

class MoreBody extends StatelessWidget {
  const MoreBody();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: MyText(
            title: "معلومات حسابى",
            size: 12,
            color: ColorManager.grey2,
            fontWeight: FontWeight.w600,
          ),
        ),
        MoreItem(
          titleItem: 'الملف الشخصي',
          imageItem: AssetsManager.profile,
          onTap: () {},
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: MyText(
            title: "إعدادات عامة",
            size: 12,
            color: ColorManager.grey2,
            fontWeight: FontWeight.w600,
          ),
        ),
        MoreItem(
          titleItem: 'إعدادات اللفة',
          imageItem: AssetsManager.translate,
          onTap: () {},
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: MyText(
            title: "معلومات عامة",
            size: 12,
            color: ColorManager.grey2,
            fontWeight: FontWeight.w600,
          ),
        ),
        MoreItem(
          titleItem: 'من نحن',
          imageItem: AssetsManager.about,
          onTap: () {
            NavigationService.navigateTo(AboutView());
          },
        ),
        MoreItem(
          titleItem: 'تواصل معنا',
          imageItem: AssetsManager.contactus,
          onTap: () {},
        ),
        MoreItem(
          titleItem: 'سياسة الخصوصية',
          imageItem: AssetsManager.policy,
          onTap: () {
            NavigationService.navigateTo(PolicyView());
          },
        ),
        MoreItem(
          titleItem: 'الشروط والاحكام',
          imageItem: AssetsManager.terms,
          onTap: () {
            NavigationService.navigateTo(TermsView());
          },
        ),
        MoreItem(
          titleItem: 'قيم التطبيق',
          imageItem: AssetsManager.wallet,
          onTap: () {},
        ),
        SizedBox(
          height: 10,
        ),
        MoreItem(
          titleItem: 'تسجيل خروج',
          imageItem: AssetsManager.logout,
          onTap: () {},
          isLogout: true,
        ),
      ],
    );
  }
}

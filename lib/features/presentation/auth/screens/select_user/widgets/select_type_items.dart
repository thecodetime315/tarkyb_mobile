import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/core/resource/navigation_service.dart';
import 'package:base_flutter/features/presentation/auth/screens/register/register_view.dart';
import 'package:base_flutter/features/presentation/auth/screens/register_provider/register_provider_view.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/base_widgets/my_text.dart';
import '../../../../../../core/resource/assets_manager.dart';
import '../../../../../../core/resource/color_manager.dart';

class SelectTypeItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              InkWell(
                onTap:(){
                  NavigationService.navigateTo(RegisterView());
                },
                child: Container(
                  height: context.height * 0.2,
                  width: context.width * 0.4,
                  decoration: BoxDecoration(
                    color: ColorManager.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: Image.asset(AssetsManager.user),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              MyText(
                title: 'مستخدم',
                size: 18,
                fontWeight: FontWeight.w400,
                color: ColorManager.white,
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              InkWell(
                onTap:(){
                  NavigationService.navigateTo(RegisterProviderView());
                },
                child: Container(
                  height: context.height * 0.2,
                  width: context.width * 0.4,
                  decoration: BoxDecoration(
                    color: ColorManager.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Center(
                    child: Image.asset(AssetsManager.technical),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              MyText(
                title: 'فني خدمة ',
                size: 18,
                fontWeight: FontWeight.w400,
                color: ColorManager.white,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

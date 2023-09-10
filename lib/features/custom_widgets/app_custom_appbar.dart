import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/core/resource/assets_manager.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:base_flutter/core/resource/navigation_service.dart';
import 'package:base_flutter/core/resource/value_manager.dart';
import 'package:base_flutter/features/presentation/notifications/notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppCustomAppbar extends StatelessWidget {
  final String titlePage;
  final Widget body;
  final Widget? bottomNavigationBar;

  const AppCustomAppbar({Key? key, required this.titlePage, required this.body, this.bottomNavigationBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.offWhite,
        body: Column(
          children: [
            Container(
              height: context.height * 0.14,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin:Alignment(1, 0) ,
                    end: Alignment(-1.00, -0.00),
                    colors: [
                      ColorManager.primary,
                      ColorManager.secondary,
                    ],
                  )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(width: context.width*0.1,),
                  Spacer(),
                  Container(
                    padding: const EdgeInsets.only(top: 5),
                    child: Center(
                        child: MyText(
                          title: titlePage,
                          color: ColorManager.white,
                          size: 16,
                          fontWeight: FontWeight.w600,
                        ),
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: ()=> NavigationService.navigateTo(Notifications()),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
                      child: SvgPicture.asset(
                        AssetsManager.notification_icon,
                        color: ColorManager.white,
                        height: 40,
                        width: 40,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(child: body),
          ],
        ),
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}

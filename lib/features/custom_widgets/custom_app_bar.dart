import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/core/resource/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/resource/assets_manager.dart';
import '../../core/resource/color_manager.dart';
import '../presentation/notifications/notifications.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final Widget child;
  final bool? needNotify;
  final Widget? bottomNavigationBar;

  const CustomAppBar(
      {Key? key,
      required this.title,
      required this.child,
      this.needNotify = true, this.bottomNavigationBar})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: Column(
        children: [
          Container(
            height: context.height * 0.2,
            width: context.width,
            padding: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
              gradient: LinearGradient(
                begin: Alignment(1, 0),
                end: Alignment(-1.00, -0.00),
                colors: [ColorManager.primary, ColorManager.secondary],
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () => NavigationService.back(),
                  icon: Icon(
                    Icons.adaptive.arrow_back,
                    color: ColorManager.white,
                  ),
                  padding: EdgeInsets.zero,
                ),
                MyText(
                  title: title,
                  color: ColorManager.white,
                  size: 15,
                  fontWeight: FontWeight.w400,
                ),
                needNotify == true
                    ? InkWell(
                        onTap: () {
                          NavigationService.navigateTo(Notifications());
                        },
                        child: SvgPicture.asset(
                          AssetsManager.notification_icon,
                          color: ColorManager.white,
                          height: 40,
                        ),
                      )
                    : SizedBox(
                        width: context.width * 0.1,
                      ),
              ],
            ),
          ),
          Expanded(child: child)
        ],
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}

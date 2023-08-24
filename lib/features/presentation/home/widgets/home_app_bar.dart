import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/resource/assets_manager.dart';
import '../../../../core/resource/color_manager.dart';
import '../../../../core/resource/value_manager.dart';

class HomeAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.15,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment(1, 0),
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
          Container(
            width: context.width * 0.1,
          ),
          Spacer(),
          Container(
            padding: const EdgeInsets.only(top: 5),
            child: Image.asset(
              AssetsManager.logoWithoutCircle,
              scale: 2.5,
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
            child: SvgPicture.asset(
              AssetsManager.notification_icon,
              color: ColorManager.white,
            ),
          ),
        ],
      ),
    );
  }
}

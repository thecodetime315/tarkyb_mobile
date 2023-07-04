import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:flutter/material.dart';

import '../../core/resource/assets_manager.dart';
import '../../core/resource/color_manager.dart';

class AuthHeader extends StatelessWidget {
  final String headerTitle;
  final Widget headerWidget;

  const AuthHeader({Key? key, required this.headerTitle, required this.headerWidget}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(AssetsManager.authHeader,height: 300,),
        Positioned(
          bottom:0,
          top: MediaQuery.of(context).size.height * -0.3,
          left: 0,
          right: 0,
          child: Center(
            child: MyText(
              title: headerTitle,
              color: ColorManager.white,
              size: 18,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Positioned(
          bottom:10,
          top: 10,
          left: 0,
          right: 0,
          child: Center(
            child: headerWidget,
          ),
        ),


      ],
    );
  }
}

import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:base_flutter/core/resource/navigation_service.dart';
import 'package:flutter/material.dart';

import 'my_text.dart';

class AuthHeaderText extends StatelessWidget {
  final String title;
  final bool showBack;

  const AuthHeaderText({required this.title, this.showBack=true});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          MyText(
            title: title,
            size: 17,
            color: ColorManager.primary,
          ),
          Offstage(
            offstage: !showBack,
            child: IconButton(
                icon: Icon(
                  Icons.arrow_forward,
                  color: ColorManager.black,
                  size: 25,
                ),
                onPressed: ()=> NavigationService.back(),
            ),
          )
        ],
      ),
    );
  }
}

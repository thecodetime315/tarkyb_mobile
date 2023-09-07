import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/core/resource/assets_manager.dart';
import 'package:base_flutter/core/resource/navigation_service.dart';
import 'package:base_flutter/features/custom_widgets/custom_gradient_button.dart';
import 'package:base_flutter/features/presentation/auth/screens/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class VisitorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LottieBuilder.asset(
            AssetsManager.visitorJson,
            height: 300,
            width: context.width * 0.9,
            fit: BoxFit.fill,
          ),
          SizedBox(height: 5,),
          MyText(title: "يجب تسجيل حسابك أولا"),
          SizedBox(height: 10,),
          CustomGradientButton(
            title: "تسجيل الحساب",
            onTap: () {
              NavigationService.removeUntil(LoginView());
            },
          ),
        ],
      ),
    );
  }
}

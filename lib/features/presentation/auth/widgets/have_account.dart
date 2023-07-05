import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:base_flutter/core/resource/navigation_service.dart';
import 'package:base_flutter/features/presentation/auth/screens/login/login_view.dart';
import 'package:flutter/material.dart';

class HaveAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        NavigationService.navigateAndReplacement(LoginView());
      },
      child: MyText(
        title: "لديك حساب بالفعل؟ تسجيل دخول",
        size: 10,
        fontWeight: FontWeight.normal,
        color: ColorManager.white,
      ),
    );
  }
}

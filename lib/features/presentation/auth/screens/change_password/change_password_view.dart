import 'package:base_flutter/features/presentation/auth/screens/change_password/widgets/change_password_body.dart';
import 'package:flutter/material.dart';

import '../../../../custom_widgets/custom_app_bar.dart';

class ChangePasswordView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: "تغيير كلمة المرور",
      needNotify: false,
      child: ChangePasswordBody(),
    );
  }
}

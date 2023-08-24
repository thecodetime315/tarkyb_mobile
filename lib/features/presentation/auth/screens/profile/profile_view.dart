
import 'package:base_flutter/features/presentation/auth/screens/profile/widgets/profile_body.dart';
import 'package:flutter/material.dart';

import '../../../../custom_widgets/custom_app_bar.dart';


class ProfileView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(title: 'الملف الشخصي', child: ProfileBody(),needNotify: false,);
  }
}

import 'package:base_flutter/features/presentation/auth/screens/change_password/widgets/change_password_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../custom_widgets/custom_app_bar.dart';
import 'change_password_cubit/change_password_cubit.dart';

class ChangePasswordView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangePasswordCubit(),
      child: CustomAppBar(
        title: "تغيير كلمة المرور",
        needNotify: false,
        child: ChangePasswordBody(),
      ),
    );
  }
}

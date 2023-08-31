import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/core/helpers/app_loader_helper.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:base_flutter/core/utils/enums.dart';
import 'package:base_flutter/features/custom_widgets/auth_custom_appbar.dart';
import 'package:base_flutter/features/presentation/auth/screens/forget_password/forget_cubit/forget_cubit.dart';
import 'package:base_flutter/features/presentation/auth/screens/forget_password/widgets/forget_password_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: BlocProvider(
        create: (context) => ForgetCubit(),
        child: ForgetPasswordBody(),
      ),
    );
  }
}

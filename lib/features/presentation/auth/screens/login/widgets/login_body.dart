import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/localization/app_localizations.dart';
import 'package:base_flutter/core/resource/assets_manager.dart';
import 'package:base_flutter/features/presentation/auth/screens/login/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/resource/color_manager.dart';
import '../../../../../custom_widgets/logo_widget.dart';
import 'forget_password_button.dart';
import 'login_buttons.dart';
import 'login_form.dart';

class LoginBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 15,
              ),
              AuthHeader(
                headerTitle: tr(context, 'login'),
                headerWidget: MyText(
                  title: "اهلا بعودتك !",
                  color: ColorManager.white,
                  size: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              LoginForm(),
              ForgetPasswordButton(),
              LoginButtons(),
              Image.asset(AssetsManager.bottomPattern,),
            ],
          ),
        ),
      ),
    );
  }
}

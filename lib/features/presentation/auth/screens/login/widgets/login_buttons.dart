import 'package:base_flutter/core/base_widgets/custom_button.dart';
import 'package:base_flutter/core/helpers/app_loader_helper.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:base_flutter/core/resource/font_manager.dart';
import 'package:base_flutter/core/resource/navigation_service.dart';
import 'package:base_flutter/core/utils/enums.dart';
import 'package:base_flutter/features/presentation/auth/screens/login/login_cubit/login_cubit.dart';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/localization/app_localizations.dart';
import '../../register/register_view.dart';

class LoginButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
           if(state.loginState == RequestState.init || state.loginState == RequestState.init){
             return CustomButton(
               title: tr(context, 'login'),
               color: ColorManager.white,
               borderRadius: BorderRadius.circular(15),
               textColor: ColorManager.primary,
               onTap: () {
                 context.read<LoginCubit>().login(context);
               },
               margin: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
             );
           }
           if(state.loginState == RequestState.loading){
             return Center(child: AppLoaderHelper.showSimpleLoading(color: ColorManager.white),);
           }
           return Container();
          },
        ),
        Text.rich(
          TextSpan(
            text: tr(context, "don'tHaveAccount"),
            style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.normal,
                color: ColorManager.white,
                fontFamily: FontConstants.fontFamily),
            children: <InlineSpan>[
              TextSpan(
                text: tr(context, "register"),
                style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.normal,
                    color: ColorManager.white,
                    fontFamily: FontConstants.fontFamily),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    NavigationService.navigateTo(RegisterView());
                  },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

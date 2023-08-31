import 'package:base_flutter/core/base_widgets/custom_button.dart';
import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/core/localization/app_localizations.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:base_flutter/core/resource/navigation_service.dart';
import 'package:base_flutter/features/presentation/auth/screens/reset_password/cubit/reset_password_cubit.dart';

import 'package:base_flutter/features/presentation/auth/screens/reset_password/widgets/reset_password_form.dart';
import 'package:base_flutter/features/presentation/auth/screens/reset_password/widgets/reset_password_texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/base_widgets/my_text.dart';
import '../../../../../../core/helpers/app_loader_helper.dart';
import '../../../../../../core/utils/enums.dart';
import '../../../../../custom_widgets/logo_widget.dart';
import '../../login/login_view.dart';

class ResetPasswordBody extends StatelessWidget {
  const ResetPasswordBody();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPasswordCubit(),
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // LogoWidget(),
                AuthHeader(
                  headerTitle: 'استعد حسابك',
                  headerWidget: MyText(
                    title: "استعد حسابك",
                    color: ColorManager.white,
                    size: 17,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                ResetPasswordForm(),
                SizedBox(height: 50,),
                BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
                  builder: (context, state) {
                    if (state.resetState == RequestState.init ||
                        state.resetState == RequestState.loaded)
                      return CustomButton(
                        margin: EdgeInsets.only(bottom: 30, left: 15, right: 15),
                        title: tr(context, "send"),
                        width: context.width * 0.7,
                        color: ColorManager.white,
                        textColor: ColorManager.primary,
                        onTap: () {
                          print("object");
                          context.read<ResetPasswordCubit>().resetPassword();
                        },
                      );
                    if (state.resetState == RequestState.loading)
                      return Center(
                        child: AppLoaderHelper.showSimpleLoading(
                            color: ColorManager.white),
                      );
                    return SizedBox();
                  },
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}

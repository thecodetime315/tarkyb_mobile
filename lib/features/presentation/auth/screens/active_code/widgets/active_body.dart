import 'package:base_flutter/core/base_widgets/custom_button.dart';
import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/core/localization/app_localizations.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:base_flutter/core/resource/value_manager.dart';
import 'package:base_flutter/features/presentation/auth/screens/active_code/cubit/check_otp_cubit.dart';
import 'package:base_flutter/features/presentation/auth/screens/active_code/widgets/receive_code.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/helpers/app_loader_helper.dart';
import '../../../../../../core/utils/enums.dart';
import 'active_form.dart';
import 'active_image.dart';
import 'active_texts.dart';

class ActiveBody extends StatelessWidget {
  final String phone;
  final String fromWhere;

  const ActiveBody({Key? key, required this.phone, required this.fromWhere}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CheckOtpCubit(),
      child: Expanded(
        child: Padding(
          padding: EdgeInsets.all(AppPadding.p8),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ActiveImage(),
                ActiveTexts(),
                ActiveForm(),
                ReceiveCode(phone: phone,),
                SizedBox(height: 20,),
                BlocBuilder<CheckOtpCubit, CheckOtpState>(
                  builder: (context, state) {
                    if (state.checkOtpState == RequestState.init ||
                        state.checkOtpState == RequestState.loaded)
                      return CustomButton(
                        margin: EdgeInsets.only(bottom: 30, left: 15, right: 15),
                        title: tr(context, "send"),
                        width: context.width * 0.7,
                        color: ColorManager.white,
                        textColor: ColorManager.primary,
                        onTap: () {
                          print("fromWhere : $fromWhere");
                          context.read<CheckOtpCubit>().checkOtp(phone, fromWhere);
                        },
                      );
                    if (state.checkOtpState == RequestState.loading)
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

import 'package:base_flutter/core/base_widgets/custom_button.dart';
import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/core/helpers/validator.dart';
import 'package:base_flutter/core/resource/navigation_service.dart';
import 'package:base_flutter/features/presentation/auth/screens/forget_password/forget_cubit/forget_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/base_widgets/custom_text_field.dart';
import '../../../../../../core/base_widgets/my_text.dart';
import '../../../../../../core/helpers/app_loader_helper.dart';
import '../../../../../../core/localization/app_localizations.dart';
import '../../../../../../core/resource/color_manager.dart';
import '../../../../../../core/resource/value_manager.dart';
import '../../../../../../core/utils/enums.dart';
import '../../../../../custom_widgets/logo_widget.dart';
import 'forget_password_texts.dart';

class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        // padding: EdgeInsets.zero,
        children: [

          Container(
            padding: EdgeInsets.only(top: AppPadding.p24,right: 10,left: 10),
            height: context.height * 0.13,
            color: ColorManager.primary,
            child: Row(
              children: [
                IconButton(
                  onPressed: () => NavigationService.back(),
                  icon: Icon(Icons.adaptive.arrow_back,color: ColorManager.white,),
                ),
                MyText(
                  title: "استرجاع الحساب",
                  color: ColorManager.white,
                  size: 17,
                ),
              ],
            ),
          ),
          AuthHeader(
            headerTitle: tr(context, 'forgetPassword'),
            headerWidget: MyText(
              title: "استرجاع حسابك",
              color: ColorManager.white,
              size: 17,
              fontWeight: FontWeight.w400,
            ),
          ),
          ForgetPasswordTexts(),
          Form(
            key: context.read<ForgetCubit>().formKey,
            child: CustomTextField(
              validator: (value) => value?.validatePhone(context),
              fieldTypes: FieldTypes.normal,
              type: TextInputType.phone,
              controller: context.read<ForgetCubit>().phone,
              hint: tr(context, 'phone'),
              textColor: ColorManager.white,
            ),
          ),
          BlocBuilder<ForgetCubit, ForgetState>(
            builder: (context, state) {
              if (state.forgetState == RequestState.init ||
                  state.forgetState == RequestState.loaded)
                return CustomButton(
                  margin: EdgeInsets.only(bottom: 30, left: 15, right: 15),
                  title: tr(context, "send"),
                  width: context.width * 0.7,
                  color: ColorManager.white,
                  textColor: ColorManager.primary,
                  onTap: () {
                    print("object");
                    context.read<ForgetCubit>().forgetPassword();
                  },
                );
              if (state.forgetState == RequestState.loading)
                return Center(
                  child: AppLoaderHelper.showSimpleLoading(
                      color: ColorManager.white),
                );
              return SizedBox();
            },
          ),
        ],
      ),
    );
  }
}

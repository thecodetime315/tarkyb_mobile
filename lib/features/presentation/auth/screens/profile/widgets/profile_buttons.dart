import 'package:base_flutter/core/base_widgets/custom_button.dart';
import 'package:base_flutter/core/base_widgets/custom_text_button.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:base_flutter/core/resource/navigation_service.dart';
import 'package:base_flutter/core/utils/enums.dart';
import 'package:base_flutter/features/presentation/auth/screens/profile/profile_cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/helpers/app_loader_helper.dart';
import '../../change_password/change_password_view.dart';

class ProfileButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            if(state.profileState == RequestState.init || state.profileState == RequestState.error){
              return CustomButton(
                title: 'حفظ التغييرات',
                onTap: () {
                  context.read<ProfileCubit>().updateProfile(context);
                },
              );
            }
            if(state.profileState == RequestState.loading){
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: AppLoaderHelper.showSimpleLoading(),),
              );
            }
            return SizedBox();
          },
        ),
        CustomTextButton(
          title: 'تغيير كلمة المرور',
          onTap: () {
            NavigationService.navigateTo(ChangePasswordView());
          },
          color: ColorManager.black,
        )
      ],
    );
  }
}

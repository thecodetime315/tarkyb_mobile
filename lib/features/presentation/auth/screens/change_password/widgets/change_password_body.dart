import 'package:base_flutter/core/base_widgets/custom_button.dart';
import 'package:base_flutter/core/localization/app_localizations.dart';
import 'package:base_flutter/core/utils/enums.dart';
import 'package:base_flutter/features/presentation/auth/screens/change_password/change_password_cubit/change_password_cubit.dart';
import 'package:base_flutter/features/presentation/auth/screens/change_password/change_password_cubit/change_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/helpers/app_loader_helper.dart';
import 'change_password_form.dart';

class ChangePasswordBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            children: [
              ChangePasswordForm(),
              if(state.changePasswordState == RequestState.init || state.changePasswordState == RequestState.loaded )
                CustomButton(title: tr(context, "confirm"), onTap: () {
                  context.read<ChangePasswordCubit>().changePassword();
                },),
              if(state.changePasswordState == RequestState.loading)
                Center(child: AppLoaderHelper.showSimpleLoading(),),
            ],
          ),
        );
      },
    );
  }
}

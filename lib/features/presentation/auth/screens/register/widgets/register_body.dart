import 'package:base_flutter/core/helpers/app_loader_helper.dart';
import 'package:base_flutter/core/resource/assets_manager.dart';
import 'package:base_flutter/features/presentation/auth/screens/register/widgets/register_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/base_widgets/custom_button.dart';
import '../../../../../../core/localization/app_localizations.dart';
import '../../../../../../core/resource/color_manager.dart';
import '../../../../../../core/utils/enums.dart';
import '../../../../../custom_widgets/logo_widget.dart';
import '../../../widgets/have_account.dart';
import '../register_cubit/register_cubit.dart';

class RegisterBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // todo : finish register cubit with buttons
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 25,),
            AuthHeader(
              headerTitle: 'تسجيل مستخدم',
              headerWidget: Image.asset(
                AssetsManager.userWithoutCircle, color: ColorManager.white,),
            ),
            RegisterForm(),
            BlocBuilder<RegisterCubit, RegisterState>(
              builder: (context, state) {
                if(state.registerState == RequestState.init || state.registerState == RequestState.error){
                  return CustomButton(
                    title: tr(context, 'confirm'),
                    color: ColorManager.white,
                    textColor: ColorManager.primary,
                    onTap: () {
                      context.read<RegisterCubit>().register(context);
                    },
                    margin: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
                  );
                }
                if(state.registerState == RequestState.loading){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: AppLoaderHelper.showSimpleLoading(color: ColorManager.white),),
                  );
                }else{
                  return SizedBox();
                }
              },
            ),
            HaveAccount(),
            Image.asset(AssetsManager.bottomPattern),
          ],
        ),
      ),
    );
  }
}

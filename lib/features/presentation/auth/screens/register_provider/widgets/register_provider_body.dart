import 'package:base_flutter/core/resource/assets_manager.dart';
import 'package:base_flutter/core/resource/navigation_service.dart';
import 'package:base_flutter/features/presentation/auth/screens/register_provider/widgets/register_provider_form.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/base_widgets/custom_button.dart';
import '../../../../../../core/localization/app_localizations.dart';
import '../../../../../../core/resource/color_manager.dart';
import '../../../../../custom_widgets/logo_widget.dart';
import '../../../widgets/have_account.dart';
import '../../active_code/active_view.dart';

class RegisterProviderBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          AuthHeader(
            headerTitle: 'تسجيل فني ',
            headerWidget: Image.asset(
              AssetsManager.technicalWithoutCircle,
              color: ColorManager.white,
            ),
          ),
          RegisterProviderForm(),
          CustomButton(
            title: tr(context, 'confirm'),
            color: ColorManager.white,
            textColor: ColorManager.primary,
            onTap: () {
              NavigationService.navigateTo(ActiveView());
            },
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
          ),
          HaveAccount(),
          Image.asset(AssetsManager.bottomPattern),
        ],
      ),
    );
  }
}

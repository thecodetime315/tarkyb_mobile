import 'package:base_flutter/core/resource/assets_manager.dart';
import 'package:base_flutter/core/resource/navigation_service.dart';
import 'package:base_flutter/features/presentation/auth/screens/register/widgets/register_form.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/base_widgets/custom_button.dart';
import '../../../../../../core/base_widgets/my_text.dart';
import '../../../../../../core/localization/app_localizations.dart';
import '../../../../../../core/resource/color_manager.dart';
import '../../../../../custom_widgets/logo_widget.dart';
import '../../active_code/active_view.dart';

class RegisterBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 25,),
          AuthHeader(
            headerTitle: tr(context, 'login'),
            headerWidget: MyText(
              title: "اهلا بعودتك !",
              color: ColorManager.white,
              size: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          RegisterForm(),
          CustomButton(
            title: tr(context,'confirm'),
            color: ColorManager.white,
            textColor: ColorManager.primary,
            onTap: () {
              NavigationService.navigateTo(ActiveView());
            },
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
          ),
          Image.asset(AssetsManager.bottomPattern),
        ],
      ),
    );
  }
}


import 'package:base_flutter/features/presentation/auth/screens/register_provider/widgets/register_provider_body.dart';
import 'package:flutter/material.dart';
import '../../../../../core/resource/color_manager.dart';



class RegisterProviderView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: RegisterProviderBody(),
    );
  }
}

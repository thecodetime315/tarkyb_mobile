
import 'package:base_flutter/features/presentation/auth/screens/register/widgets/register_body.dart';
import 'package:flutter/material.dart';import '../../../../../core/resource/color_manager.dart';



class RegisterView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: RegisterBody(),
    );
  }
}

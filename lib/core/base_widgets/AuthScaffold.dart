import 'package:flutter/material.dart';

import '../resource/color_manager.dart';

class AuthScaffold extends StatelessWidget {
  final Widget child;

  AuthScaffold({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      body: child,
    );
  }
}

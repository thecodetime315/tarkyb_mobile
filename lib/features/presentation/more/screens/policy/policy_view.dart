

import 'package:base_flutter/features/presentation/more/screens/policy/widgets/policy_body.dart';
import 'package:flutter/material.dart';

import '../../../../custom_widgets/custom_app_bar.dart';

class PolicyView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: "سياسية الخصوصية",
      needNotify: false,
      child: PolicyBody(),
    );
  }
}



import 'package:base_flutter/features/presentation/more/screens/policy/widgets/policy_body.dart';
import 'package:flutter/material.dart';

import '../../../../custom_widgets/custom_app_bar.dart';

class PolicyView extends StatelessWidget {
final String value;

  const PolicyView({Key? key, required this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: "الشروط والاحكام",
      needNotify: false,
      child: PolicyBody(value: value,),
    );
  }
}

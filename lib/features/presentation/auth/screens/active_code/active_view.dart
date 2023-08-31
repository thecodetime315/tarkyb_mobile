import 'package:base_flutter/core/localization/app_localizations.dart';
import 'package:base_flutter/features/custom_widgets/auth_custom_appbar.dart';
import 'package:base_flutter/features/presentation/auth/screens/active_code/widgets/active_body.dart';
import 'package:flutter/material.dart';

class ActiveView extends StatelessWidget {
  final String phone;
  final String fromWhere;
  const ActiveView({Key? key, required this.phone, required this.fromWhere}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AuthCustomAppBar(
        title: tr(context, "activeCode"), needBack: false, child: ActiveBody(fromWhere: fromWhere,phone: phone,));
  }
}

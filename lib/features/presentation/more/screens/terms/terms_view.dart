

import 'package:base_flutter/core/localization/app_localizations.dart';
import 'package:base_flutter/features/presentation/more/screens/terms/widgets/terms_body.dart';
import 'package:flutter/material.dart';

import '../../../../custom_widgets/custom_app_bar.dart';

class TermsView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: tr(context,"terms"),
      needNotify: false,
      child: TermsBody(),
    );
  }
}

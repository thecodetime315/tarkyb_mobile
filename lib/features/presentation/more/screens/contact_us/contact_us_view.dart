

import 'package:base_flutter/features/presentation/more/screens/contact_us/widgets/contact_us_body.dart';
import 'package:flutter/material.dart';

import '../../../../custom_widgets/custom_app_bar.dart';

class ContactUsView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: "تواصل معنا",
      needNotify: false,
      child: ContactUsBody(),
    );
  }
}

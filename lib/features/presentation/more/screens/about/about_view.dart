import 'package:base_flutter/features/custom_widgets/custom_app_bar.dart';
import 'package:base_flutter/features/presentation/more/screens/about/widgets/about_body.dart';
import 'package:flutter/material.dart';


class AboutView extends StatelessWidget {
  final String value;
  const AboutView(this.value);

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      needNotify: false,
      title: "من نحن",
      child: AboutBody(value: value,),
    );
  }
}

import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:flutter/material.dart';

class AboutBody extends StatelessWidget {
  final String value;

  const AboutBody({Key? key, required this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
      children: [
        // LogoWidget(),
        MyText(
          color: ColorManager.black,
            size: 12,
            fontWeight: FontWeight.w400,
            title: value,
        ),
      ],
    );
  }
}

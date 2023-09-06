import 'package:base_flutter/core/resource/assets_manager.dart';
import 'package:base_flutter/core/utils/utils_imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../models/settings_model.dart';

class ContactUsSocial extends StatelessWidget {
  final List<SettingsModel> model;

  const ContactUsSocial({Key? key, required this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            Utils.launchURL(url: model[7].value ?? '');
          },
          child: SvgPicture.asset(AssetsManager.twitter),
        ),
        SizedBox(
          width: 15,
        ),
        InkWell(
          onTap: () {
            Utils.launchURL(url: model[5].value ?? '');
          },
          child: SvgPicture.asset(AssetsManager.facebook),
        ),
        SizedBox(
          width: 15,
        ),
        InkWell(
          onTap: () {
            Utils.launchURL(url: model[6].value ?? '');
          },
          child: SvgPicture.asset(AssetsManager.instagram),
        ),
      ],
    );
  }
}

import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/core/resource/assets_manager.dart';
import 'package:flutter/material.dart';
import '../../../../core/base_widgets/cache_image.dart';

class HomeSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      AssetsManager.homeImage,
      // fit: BoxFit.fitWidth,
      // filterQuality: FilterQuality.high,
    );
  }
}

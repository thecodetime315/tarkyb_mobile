import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:flutter/material.dart';
import '../../../../core/base_widgets/cache_image.dart';

class HomeSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.18,
      child: CachedImage(
        url:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsBtC4-m8DnE4ZJkd-xdMZsJ3RMxv1RHLUXg&usqp=CAU',
      ),
    );
  }
}

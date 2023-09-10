import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/core/resource/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/base_widgets/cache_image.dart';
import '../../../../core/base_widgets/my_text.dart';
import '../../../../core/resource/color_manager.dart';
import '../../../models/services_model.dart';
import '../../category_details/category_details_screen.dart';

class HomeServicesItem extends StatelessWidget {
  final ServicesModel model;

  const HomeServicesItem({Key? key, required this.model}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => NavigationService.navigateTo(CategoryDetailsScreen(
        title: model.name ?? "",
        id: model.id ?? 0,
      )),
      child: Container(
        width: context.width * 0.3,
        height: 100,
        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorManager.grey2.withOpacity(0.5),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            model.image!.contains("svg")
                ? SvgPicture.network(
                    model.image ?? '',
                    height: 40,
                    width: 40,
              color: ColorManager.primary,
                  )
                : CachedImage(
                    url: model.image ?? '',
                    height: 40,
                    width: 40,
                  ),
            SizedBox(
              height: 8,
            ),
            MyText(
              title: model.name ?? '',
              color: ColorManager.primary,
              alien: TextAlign.center,
              size: 9.5,
            ),
          ],
        ),
      ),
    );
  }
}

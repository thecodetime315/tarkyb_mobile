
import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:base_flutter/core/resource/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../core/base_widgets/cache_image.dart';
import '../../core/base_widgets/my_text.dart';
import '../../core/resource/assets_manager.dart';
import '../presentation/technician_details/technician_details.dart';

class TechnicalPersonCard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        NavigationService.navigateTo(TechnicianDetails());
      },
      child: Container(
        width: 325,
        height: 96,
        padding: EdgeInsets.symmetric(horizontal: 5),
        margin: EdgeInsets.symmetric(vertical: 4),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: ColorManager.grey2.withOpacity(0.5),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CachedImage(
              url:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOKgf1btqasr29ElrKVN80RPZxRDi4qTMnwQ&usqp=CAU",
              height: 85,
              width: 80,
              haveRadius: true,
              borderRadius: BorderRadius.circular(5),
              fit: BoxFit.cover,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    MyText(
                      title: "عمر احمد",
                      color: ColorManager.primary,
                      size: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    SizedBox(width: context.width*0.2,),
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      itemSize: 18,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      ignoreGestures: true,
                      itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(AssetsManager.experianceImg,height: 17,),
                      SizedBox(width: 5,),
                      MyText(
                        title: "10 سنوات خبرة",
                        color: ColorManager.grey2,
                        size: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(AssetsManager.locationPng,height: 17,),
                      SizedBox(width: 5,),
                      MyText(
                        title: "الرياض _ الدوحة",
                        color: ColorManager.grey2,
                        size: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:base_flutter/core/base_widgets/cache_image.dart';
import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/core/resource/assets_manager.dart';
import 'package:base_flutter/features/custom_widgets/custom_app_bar.dart';
import 'package:base_flutter/features/presentation/technician_details/widgets/technician_info.dart';
import 'package:base_flutter/features/presentation/technician_details/widgets/technician_services.dart';
import 'package:base_flutter/features/presentation/technician_details/widgets/technician_texts_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'client_opinion.dart';

class TechnicianDetailsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomAppBar(
            title: "التفاصيل",
            child: Container(
              width: context.width,
              padding: EdgeInsets.only(
                  top: context.height * 0.06, right: 10, left: 10),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MyText(
                      title: "عمر عبداللطيف",
                      size: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    RatingBar.builder(
                      initialRating: 4,
                      minRating: 1,
                      itemSize: 15,
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
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 18.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TechnicianInfo(
                            image: AssetsManager.locationPng,
                            value: 'الرياض',
                          ),
                          TechnicianInfo(
                            image: AssetsManager.experianceImg,
                            value: '10 سنوات',
                          ),
                          TechnicianInfo(
                            image: AssetsManager.ageUser,
                            value: '32 سنه',
                          ),
                        ],
                      ),
                    ),
                    TechnicianTextsItem(
                      title: "الوصف",
                      value:
                          "خبرة 10سنوات في مجال المكيفات الحمد لله فك و تركيب و صيانه جميع انواع المكيفات",
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    TechnicianTextsItem(
                      title: "أيام العمل",
                      value: "من السبت-الي الاربعاء",
                    ),
                    SizedBox(
                      height: 18,
                    ),
                    TechnicianServices(),
                    SizedBox(
                      height: 18,
                    ),
                    ClientOpinion(),
                  ],
                ),
              ),
            )),
        Positioned(
          child: CachedImage(
            url:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSR7__tt3LBKmLZE4XSyJAYZQ99Njg3fNhjILVl1G45gpMS_iE57cv4o0Xg9V8AZnY6kcc&usqp=CAU",
            height: 80,
            width: 80,
            haveRadius: true,
            borderRadius: BorderRadius.circular(40),
          ),
          top: context.height * 0.14,
          right: context.width * 0.4,
          left: context.width * 0.4,
        )
      ],
    );
  }
}

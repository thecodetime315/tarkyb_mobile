import 'package:base_flutter/core/base_widgets/cache_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../core/base_widgets/my_text.dart';
import '../../../../core/resource/color_manager.dart';

class ClientOpinion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
            alignment: Alignment.topRight,
            child: MyText(
                title: "أراء العملاء", size: 16, fontWeight: FontWeight.w400)),
        SizedBox(
          height: 14,
        ),
        Container(
            height: 120,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                      width: 230,
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 7),
                      decoration: BoxDecoration(
                          color: ColorManager.white,
                          borderRadius: BorderRadius.circular(4),
                          boxShadow: [
                            BoxShadow(
                              color: ColorManager.grey2.withOpacity(0.4),
                              spreadRadius: 0.1,
                              blurRadius: 7,
                              offset: Offset(1, 1), // Shadow position
                            ),
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CachedImage(
                                url:
                                    "https://media.istockphoto.com/id/484758778/photo/arabian-man-with-arms-crossed.jpg?s=612x612&w=0&k=20&c=tzKs6hXAOqOmw4iD9et84NdAovmbSTbNngnDmKebPYE=",
                                height: 40,
                                width: 40,
                                haveRadius: true,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MyText(
                                      title: "السيد ابو طلال",
                                      size: 12,
                                      fontWeight: FontWeight.w400,
                                      color: ColorManager.black,
                                    ),
                                    RatingBar.builder(
                                      initialRating: 5,
                                      minRating: 1,
                                      itemSize: 13,
                                      direction: Axis.horizontal,
                                      allowHalfRating: true,
                                      itemCount: 5,
                                      ignoreGestures: true,
                                      itemPadding:
                                          EdgeInsets.symmetric(horizontal: 1.0),
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
                              ),
                              Spacer(),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: MyText(
                                  title: "24 ديسمبر 2022",
                                  size: 10,
                                  fontWeight: FontWeight.w400,
                                  color: ColorManager.grey2,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(
                            child: MyText(
                              title:'ممتاز , تطبيق جميل والفني ممتاز وملتزم بالمواعيد واسعار ممتازه خدمة اكثر من رائعه',
                              size: 10,
                              fontWeight: FontWeight.w400,
                              color: ColorManager.black,
                            ),
                          )
                        ],
                      ));
                }))
      ],
    );
  }
}

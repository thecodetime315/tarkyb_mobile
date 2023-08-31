import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../core/base_widgets/my_text.dart';
import '../../../../core/resource/color_manager.dart';
import '../../../models/technician_details_model.dart';

class ClientReviewItem extends StatelessWidget {
  final Reviews? review;

  const ClientReviewItem({Key? key, this.review}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: review?.comment != null
            ? context.height * 0.17
            : context.height * 0.1,
        width: context.width * 0.85,
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
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
                SizedBox(
                  width: 7,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyText(
                        title: review?.reviewerId ?? '',
                        size: 12,
                        fontWeight: FontWeight.w400,
                        color: ColorManager.black,
                      ),
                      RatingBar.builder(
                        initialRating: review?.rating?.toDouble() ?? 0,
                        minRating: 1,
                        itemSize: 13,
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
                ),
                Spacer(),
                // Padding(
                //   padding:
                //   const EdgeInsets.symmetric(vertical: 5.0),
                //   child: MyText(
                //     title: "24 ديسمبر 2022",
                //     size: 10,
                //     fontWeight: FontWeight.w400,
                //     color: ColorManager.grey2,
                //   ),
                // ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: MyText(
                title: review?.comment ?? '',
                size: 10,
                fontWeight: FontWeight.w400,
                color: ColorManager.black,
              ),
            )
          ],
        ));
  }
}

import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:base_flutter/core/resource/navigation_service.dart';
import 'package:base_flutter/features/models/technician_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../core/base_widgets/cache_image.dart';
import '../../core/base_widgets/my_text.dart';
import '../../core/resource/assets_manager.dart';
import '../presentation/technician_details/cubits/tech_details_cubit.dart';
import '../presentation/technician_details/technician_details.dart';

class TechnicalPersonCard extends StatelessWidget {
  final TechnicianModel? model;
  final int isVip;


  const TechnicalPersonCard({Key? key, this.model, this.isVip = 0}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        NavigationService.navigateTo(BlocProvider(
  create: (context) => TechDetailsCubit()..getTechDetails(model?.id ?? 0,isVip),
  child: TechnicianDetails(id: model?.id ?? 0, isVip: isVip,),
));
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CachedImage(
              url: model?.image ?? '',
              height: 70,
              width: 70,
              haveRadius: true,
              borderRadius: BorderRadius.circular(5),
              fit: BoxFit.contain,
            ),
            SizedBox(
              width: 5,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 120,
                      child: MyText(
                        title: model?.name ?? '',
                        color: ColorManager.primary,
                        size: 11,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      width: context.width * 0.05,
                    ),
                    RatingBar.builder(
                      initialRating: double.parse(model?.ratingsAvgRating ?? "0"),
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
                // Padding(
                //   padding: const EdgeInsets.symmetric(vertical: 5.0),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.start,
                //     children: [
                //       Image.asset(
                //         AssetsManager.locationPng,
                //         height: 17,
                //       ),
                //       SizedBox(
                //         width: 5,
                //       ),
                //       MyText(
                //         title: model?.city ?? '',
                //         color: ColorManager.grey2,
                //         size: 10,
                //         fontWeight: FontWeight.w400,
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

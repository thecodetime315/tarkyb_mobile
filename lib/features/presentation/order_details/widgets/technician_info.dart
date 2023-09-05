

import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/features/presentation/order_details/cubit/order_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../core/base_widgets/cache_image.dart';
import '../../../../core/base_widgets/my_text.dart';
import '../../../../core/resource/assets_manager.dart';
import '../../../../core/resource/color_manager.dart';
import '../../../custom_widgets/custom_gradient_button.dart';

class TechnicianInfo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var model = context.read<OrderDetailsCubit>().state.orderDetailsModel?.technician;
    var cubit = context.read<OrderDetailsCubit>();

    return Container(
      width: context.width*0.8,
      padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
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
            borderRadius: BorderRadius.circular(30),
            fit: BoxFit.cover,
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      AssetsManager.locationPng,
                      height: 17,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    MyText(
                      title: model?.city ?? '',
                      color: ColorManager.grey2,
                      size: 10,
                      fontWeight: FontWeight.w400,
                    ),


                  ],
                ),
              ),
              CustomGradientButton(
                height: 30,
                width: context.width * 0.6,
                title: "محادثة الفني",

                onTap: () {
                  cubit.goToChat()
                  ;
                  // state.cancelOrder(context, cubit.state.orderDetailsModel?.id ?? 1, controller);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

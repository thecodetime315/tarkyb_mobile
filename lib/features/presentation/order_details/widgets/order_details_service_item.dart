import 'package:base_flutter/core/base_widgets/cache_image.dart';
import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:base_flutter/features/presentation/order_details/cubit/order_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/order_details_model.dart';


class OrderDetailsServiceItem extends StatelessWidget {
  final Services? orderService;

  const OrderDetailsServiceItem({Key? key,  this.orderService}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.13,

      padding: EdgeInsets.symmetric(horizontal: 5),
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: ColorManager.grey2.withOpacity(0.2)),
          boxShadow: [
            BoxShadow(
              color: ColorManager.grey2.withOpacity(0.15),
              blurRadius: 4,
              offset: Offset(1, 1),
              spreadRadius: 0,
            ),
          ]),
      child: Row(
        children: [
          CachedImage(
            url:
                "${orderService?.image}",
            height: 50,
            width: 50,
            borderRadius: BorderRadius.circular(4),
          ),
          SizedBox(width: 5,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyText(title: "${orderService?.name}",size: 11,),
              SizedBox(height: 10,),
              MyText(title: " عدد : ${orderService?.orderQuantity}",size: 11,),

            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              MyText(title: "${orderService?.price} ر.س ",size: 11,),
              SizedBox(height: 10,),
              MyText(title: " الاجمالي : ${orderService!.price! * orderService!.orderQuantity!} ر.س ",size: 11,),

            ],
          ),
        ],
      ),
    );
  }
}

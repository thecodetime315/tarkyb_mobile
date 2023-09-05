import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/features/presentation/order_details/cubit/order_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resource/color_manager.dart';
import 'order_item.dart';

class OrderDetailsItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<OrderDetailsCubit>().state.orderDetailsModel;
    return Container(
      // height: context.height*0.53,
      width: context.width*0.8,
      decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: ColorManager.grey2.withOpacity(0.8)),
          boxShadow: [
            BoxShadow(
              color: Color(0x19C2C2C2),
              blurRadius: 0,
              offset: Offset(0, 0),
              spreadRadius: 0,
            ),
            BoxShadow(
              color: Color(0x19C2C2C2),
              blurRadius: 21,
              offset: Offset(0, 9),
              spreadRadius: 0,
            )
          ]
      ),
      child: Column(
        children: [
          OrderServiceItem(
            title: "رقم الطلب",
            value: "#${cubit?.id}",
          ),
          OrderServiceItem(
            title: "حالة الطلب",
            value: "${cubit?.status}",
          ),
          OrderServiceItem(
            title: "العنوان ",
            value: "${cubit?.address?.address}",
          ),
          OrderServiceItem(
            title: "طريقة الدفع",
            value: "${cubit?.paymentStatus}",
          ),
          OrderServiceItem(
            title: "اجمالي الطلب",
            value: "${cubit?.total} ريال سعودي ",
          ),
          OrderServiceItem(
            title: "تاريخ التنفيذ",
            value: "${cubit?.datetime}",
          ),
          OrderServiceItem(
            title: "وقت التنفيذ",
            value: "${cubit?.period?.name} - من  ${cubit?.period?.from}  الي  ${cubit?.period?.to} ",
            isLast: true,
          ),
        ],
      ),
    );
  }
}

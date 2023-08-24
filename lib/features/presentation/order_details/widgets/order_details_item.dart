import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:flutter/material.dart';

import '../../../../core/resource/color_manager.dart';
import 'order_item.dart';

class OrderDetailsItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height*0.48,
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
            value: "12345678920NE001",
          ),
          OrderServiceItem(
            title: "حالة الطلب",
            value: "قيد التنفيذ",
          ),
          OrderServiceItem(
            title: "العنوان ",
            value: "السعودية - تبوك - شارع القنصلية",
          ),
          OrderServiceItem(
            title: "طريقة الدفع",
            value: "اونلاين",
          ),
          OrderServiceItem(
            title: "اجمالي الطلب",
            value: "320 ريال سعودي",
          ),
          OrderServiceItem(
            title: "تاريخ الطلب",
            value: "3 اكتوبر 2023",
          ),
          OrderServiceItem(
            title: "تاريخ التنفيذ",
            value: "3 اكتوبر 2023",
            isLast: true,
          ),
        ],
      ),
    );
  }
}

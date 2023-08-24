import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/features/custom_widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import 'order_details_item.dart';
import 'order_details_service_item.dart';

class OrderDetailsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: "تفاصيل الطلب",
      needNotify: false,
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 18),
        children: [
          OrderDetailsItem(),
          SizedBox(height: 20,),
          MyText(title: "الخدمات المطلوبة",size: 16,),
          SizedBox(height: 8,),
          Column(children: List.generate(2, (index) => OrderDetailsServiceItem()),)
          // todo : add buttons with order types

        ],
      ),
    );
  }
}

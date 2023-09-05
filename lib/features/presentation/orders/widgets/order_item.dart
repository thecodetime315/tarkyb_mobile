import 'package:base_flutter/core/base_widgets/cache_image.dart';
import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:base_flutter/core/resource/navigation_service.dart';
import 'package:base_flutter/features/presentation/order_details/order_details.dart';
import 'package:flutter/material.dart';

import '../../../models/orders_model.dart';

class OrderItem extends StatelessWidget {
  final OrdersModel orders;

  const OrderItem({Key? key, required this.orders}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        NavigationService.navigateTo(OrderDetails(id: orders.id ?? 0,));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        padding: EdgeInsets.symmetric(horizontal: 7, vertical: 5),
        decoration: BoxDecoration(
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 70,
              width: 70,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: ColorManager.offWhite,
                borderRadius: BorderRadius.circular(15),
              ),
              child: CachedImage(
                url:
                    "${orders.services?[0].image}",
                borderRadius: BorderRadius.circular(15),
                height: 60,
                width: 50,
                fit: BoxFit.fill,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      MyText(
                        title: "اسم الخدمة : ",
                        color: ColorManager.primary,
                        fontWeight: FontWeight.w400,
                        size: 12,
                      ),
                      SizedBox(
                        width: context.width*0.3,
                        child: MyText(
                          title: "${orders.services?[0].name}",
                          fontWeight: FontWeight.w400,
                          size: 10,
                          overflow: TextOverflow.ellipsis,
                          color: ColorManager.grey2,
                        ),
                      ),
                      Spacer(),
                      MyText(
                        title: "${orders.datetime}",
                        color: ColorManager.grey,
                        size: 9,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Divider(
                      height: 15,
                    ),
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 5,
                          ),
                          MyText(
                            title: "حالة الطلب : ",
                            color: ColorManager.primary,
                            size: 12,
                            fontWeight: FontWeight.w400,
                          ),
                          MyText(
                            title: "${orders.services?[0].status}",
                            color: ColorManager.grey2,
                            size: 11,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                      Spacer(),
                      Row(
                        children: [
                          MyText(
                            title: "المزيد",
                            color: ColorManager.primary,
                            size: 10,
                            fontWeight: FontWeight.w400,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 14,
                            color: ColorManager.primary,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

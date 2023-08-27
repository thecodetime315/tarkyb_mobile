import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:base_flutter/features/custom_widgets/custom_gradient_button.dart';
import 'package:base_flutter/features/presentation/cart/widgets/cart_services.dart';
import 'package:flutter/material.dart';

import '../../../../core/base_widgets/my_text.dart';
import '../../../custom_widgets/app_custom_appbar.dart';

class CartBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppCustomAppbar(
      titlePage: "السلة",
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Align(
                child: MyText(
                  title: "قائمة الطلبات",
                  size: 14,
                ),
                alignment: Alignment.topRight,
              ),
              SizedBox(
                height: 5,
              ),
              CartServices(),
              Divider(
                height: 20,
                color: ColorManager.grey2.withOpacity(0.8),
                indent: 5,
                endIndent: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyText(
                    title: "الاجمالي",
                    size: 14,
                    color: ColorManager.black,
                  ),
                  MyText(
                    title: "520 ر.س",
                    size: 16,
                    color: ColorManager.black,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomGradientButton(
        title: "الانتقال للدفع",
        margin: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        onTap: () {},
      ),
    );
  }
}

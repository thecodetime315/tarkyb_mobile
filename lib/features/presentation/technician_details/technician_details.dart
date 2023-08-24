import 'package:base_flutter/core/resource/navigation_service.dart';
import 'package:base_flutter/features/presentation/technician_details/widgets/technician_details_body.dart';
import 'package:flutter/material.dart';

import '../../custom_widgets/custom_gradient_button.dart';
import '../add_to_cart/add_to_cart.dart';

class TechnicianDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TechnicianDetailsBody(),
      bottomNavigationBar: CustomGradientButton(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        borderRadius: BorderRadius.circular(4),
        onTap: () {
          NavigationService.navigateTo(AddToCart());
        },
        title: "اطلب الخدمة",
      ),
    );
  }
}

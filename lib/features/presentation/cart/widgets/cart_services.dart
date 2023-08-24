

import 'package:base_flutter/features/presentation/cart/widgets/services_item.dart';
import 'package:flutter/material.dart';

class CartServices extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(15, (index) => ServicesItem()),
    );
  }
}

import 'package:base_flutter/features/presentation/add_to_cart/widgets/add_to_cart_body.dart';
import 'package:flutter/material.dart';


class AddToCart extends StatelessWidget {
  final List<int> servicesId;

  const AddToCart({Key? key, required this.servicesId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  AddToCartBody();
  }
}


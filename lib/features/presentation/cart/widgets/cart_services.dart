import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/features/presentation/cart/cart_logic.dart';
import 'package:base_flutter/features/presentation/cart/widgets/services_item.dart';
import 'package:flutter/material.dart';

class CartServices extends StatelessWidget {
  final CartLogic cartLogic;

  const CartServices({Key? key, required this.cartLogic}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: cartLogic.cartCubit.state.data!.services!.length > 2
          ? context.height * 0.3
          : context.height * 0.2,
      child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: cartLogic.cartCubit.state.data!.services!.length,
          itemBuilder: (_, index) {
            return ServicesItem(
              model: cartLogic.cartCubit.state.data!.services?[index], index: index,cartLogic: cartLogic, cartId: cartLogic.cartCubit.state.data!.id ?? 0,
            );
          }),
    );
  }
}

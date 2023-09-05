import 'package:base_flutter/features/custom_widgets/custom_gradient_button.dart';
import 'package:base_flutter/features/presentation/order_details/cubit/order_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class OrderButton extends StatefulWidget {
  @override
  State<OrderButton> createState() => _OrderButtonState();
}

class _OrderButtonState extends State<OrderButton> with SingleTickerProviderStateMixin {
 late AnimationController controller;


  @override
  void initState() {
    super.initState();
    controller  = AnimationController(vsync: this,duration: Duration(milliseconds: 700));
  }
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<OrderDetailsCubit>();
    switch (cubit.state.orderDetailsModel!.status) {
      case "pending":
        return CustomGradientButton(
          title: "الغاء الطلب",
          onTap: () {
            cubit.cancelOrder(context, cubit.state.orderDetailsModel?.id ?? 1, controller);
          },
        );
      case 'in-progress':
        return const SizedBox();
      case 'completed':
        return CustomGradientButton(
          title: "قيم الخدمة",
          onTap: () {
            cubit.ratingTechnician(context,cubit.state.orderDetailsModel?.technician?.id ?? 1,controller);
          },
        );
      case 'cancelled':
        return const SizedBox();

      case 'rejected':
        return const SizedBox();
    }
    return Container();
  }
}

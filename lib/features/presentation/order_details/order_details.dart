import 'package:base_flutter/features/presentation/order_details/cubit/order_details_cubit.dart';
import 'package:base_flutter/features/presentation/order_details/widgets/order_details_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderDetails extends StatelessWidget {
final int id ;

  const OrderDetails({Key? key, required this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderDetailsCubit()..getOrderDetails(id),
      child: OrderDetailsBody(),
    );
  }
}

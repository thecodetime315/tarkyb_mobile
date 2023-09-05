import 'package:base_flutter/features/presentation/orders/cubits/orders_cubit.dart';
import 'package:base_flutter/features/presentation/orders/tabs/current_order_view.dart';
import 'package:base_flutter/features/presentation/orders/tabs/finished_order_view.dart';
import 'package:base_flutter/features/presentation/orders/widgets/tab_bar_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class OrdersBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBarBody(),
        Flexible(
          child: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              BlocProvider(
                create: (context) =>
                OrdersCubit()
                  ..getCurrentOrders(),
                child: CurrentOrderView(),
              ),
              BlocProvider(
                create: (context) => OrdersCubit()..getFinishedOrders(),
                child: FinishedOrderView(),
              )
            ],
          ),
        ),
      ],
    );
  }
}

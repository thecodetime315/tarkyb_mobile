import 'package:base_flutter/core/helpers/app_loader_helper.dart';
import 'package:base_flutter/features/presentation/orders/cubits/orders_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../custom_widgets/no_data.dart';
import 'order_item.dart';

class OrderBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersCubit, OrdersState>(
      builder: (context, state) {
        if (state is OrdersSuccess) {
          return state.ordersList.length > 0
              ? ListView.builder(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  itemCount: state.ordersList.length,
                  itemBuilder: (context, index) {
                    return OrderItem(orders: state.ordersList[index],);
                  },
                )
              : NoData();
        }
        return state is OrdersLoading ? Center(child: AppLoaderHelper.showSimpleLoading(),) : NoData();
      },
    );
  }
}

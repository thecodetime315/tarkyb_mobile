import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/helpers/app_loader_helper.dart';
import 'package:base_flutter/core/utils/enums.dart';
import 'package:base_flutter/features/custom_widgets/custom_app_bar.dart';
import 'package:base_flutter/features/presentation/order_details/cubit/order_details_cubit.dart';
import 'package:base_flutter/features/presentation/order_details/widgets/technician_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../custom_widgets/custom_gradient_button.dart';
import 'order_button.dart';
import 'order_details_item.dart';
import 'order_details_service_item.dart';

class OrderDetailsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldState = GlobalKey<ScaffoldState>();
    return CustomAppBar(
      scaffoldKey: scaffoldState,
      title: "تفاصيل الطلب",
      needNotify: false,
      child: BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
        builder: (context, state) {
          if (state.getOrderDetailsState == RequestState.loading)
            return Center(
              child: AppLoaderHelper.showSimpleLoading(),
            );
          if (state.getOrderDetailsState == RequestState.loaded)
            return ListView(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 18),
              children: [
                OrderDetailsItem(),
                SizedBox(
                  height: 20,
                ),
                MyText(
                  title: "معلومات عن الفني",
                  size: 16,
                ),
                SizedBox(
                  height: 8,
                ),
                TechnicianInfo(),
                SizedBox(
                  height: 20,
                ),
                MyText(
                  title: "الخدمات المطلوبة",
                  size: 16,
                ),
                SizedBox(
                  height: 8,
                ),
                Column(
                  children: List.generate(
                      state.orderDetailsModel?.services?.length ?? 0,
                      (index) => OrderDetailsServiceItem(
                            orderService:
                                state.orderDetailsModel?.services?[index],
                          )),
                ),
                SizedBox(
                  height: 10,
                ),
                OrderButton(),
              ],
            );
          if (state.getOrderDetailsState == RequestState.error)
            return Center(
              child: MyText(
                title: "حدث خطأ ما",
              ),
            );
          return SizedBox();
        },
      ),
    );
  }
}

import 'package:base_flutter/core/generic_cubit/generic_cubit.dart';
import 'package:base_flutter/core/helpers/app_loader_helper.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:base_flutter/features/custom_widgets/custom_gradient_button.dart';
import 'package:base_flutter/features/models/cart_model.dart';
import 'package:base_flutter/features/presentation/cart/cart_logic.dart';
import 'package:base_flutter/features/presentation/cart/widgets/cart_info.dart';
import 'package:base_flutter/features/presentation/cart/widgets/cart_services.dart';
import 'package:base_flutter/features/presentation/cart/widgets/select_payment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/base_widgets/my_text.dart';
import '../../../custom_widgets/app_custom_appbar.dart';

class CartBody extends StatefulWidget {
  @override
  State<CartBody> createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {

  final CartLogic cartLogic = CartLogic();

  @override
  void initState() {
    cartLogic.getCart();
    cartLogic.getCities();
    cartLogic.getAreas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppCustomAppbar(
      titlePage: "السلة",
      body: BlocBuilder<GenericCubit<CartModel?>, GenericState<CartModel?>>(
        bloc: cartLogic.cartCubit,
        builder: (context, state) {
          if (state is GenericUpdateState) {
            return state.data != null ? SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          child: MyText(
                            title: "قائمة الطلبات",
                            size: 14,
                          ),
                          alignment: Alignment.topRight,
                        ),
                        InkWell(
                          onTap: () {
                            cartLogic.deleteAllCart();
                          },
                          child: MyText(
                            title: "مسح السلة",
                            size: 14,
                            color: ColorManager.error,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    CartServices(cartLogic: cartLogic,),
                    Divider(
                      height: 20,
                      color: ColorManager.grey2.withOpacity(0.8),
                      indent: 5,
                      endIndent: 5,
                    ),
                    CartInfo(cartLogic: cartLogic,),
                    Divider(
                      height: 20,
                      color: ColorManager.grey2.withOpacity(0.8),
                      indent: 5,
                      endIndent: 5,
                    ),
                    SelectPayment(cartLogic: cartLogic,),
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
                        BlocBuilder<GenericCubit<num>, GenericState<num>>(
                          bloc: cartLogic.totalPrice,
                          builder: (context, state) {
                            return MyText(
                              title: "${state.data} ر.س ",
                              size: 16,
                              color: ColorManager.black,
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ) : Center(child: MyText(title: "لا يوجد بيانات",),);
          }
          return Center(child: AppLoaderHelper.showSimpleLoading(),);
        },
      ),
      bottomNavigationBar: BlocBuilder<GenericCubit<bool>, GenericState<bool>>(
        bloc: cartLogic.loadingButton,
        builder: (context, state) {
            return state.data == false ?  CustomGradientButton(
              title: "الانتقال للدفع",
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              onTap: () {
                cartLogic.createOrder(
                    cartLogic.cartCubit.state.data?.technician?.id ?? 0, context,cartLogic.cartCubit.state.data?.vip ?? 0);
              },
            ): Center(child: AppLoaderHelper.showSimpleLoading(),);


        },
      ),
    );
  }
}

import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/core/generic_cubit/generic_cubit.dart';
import 'package:base_flutter/features/presentation/cart/cart_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../../core/base_widgets/cache_image.dart';
import '../../../../core/base_widgets/my_text.dart';
import '../../../../core/resource/color_manager.dart';
import '../../../models/cart_model.dart';


class ServicesItem extends StatelessWidget {
  final int index;
  final int cartId;
  final CartLogic cartLogic;
  final Services? model;

  ServicesItem({Key? key, this.model, required this.index, required this.cartLogic, required this.cartId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GenericCubit<int> counterCubit = GenericCubit(model?.quantity ?? 1);
    return Slidable(
      startActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          InkWell(
            onTap: () =>
            cartLogic.deleteService(serviceId: model?.id ?? 0, cartId: cartId),
            child: Container(
              height: 65,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
              child: Center(
                child: MyText(
                  title: "حذف الخدمة",
                  color: ColorManager.white,
                ),
              ),
            ),
          ),
        ],
      ),
      child: Container(
        height: 70,
        width: context.width * 0.9,
        decoration: BoxDecoration(
          color: ColorManager.white,
          boxShadow: [
            BoxShadow(
              color: Color(0x0A000000),
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Color(0xFFF3F3F3)),
        ),
        padding: EdgeInsets.symmetric(horizontal: 5),
        margin: EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CachedImage(
              url: model?.image ?? '',
              height: 30,
              width: 30,
              borderRadius: BorderRadius.circular(4),
            ),
            MyText(
              title: model?.name ?? '',
              size: 11,
            ),
            MyText(
              title: "${model?.price ?? ''} ر.س",
              size: 11,
            ),
            BlocBuilder<GenericCubit<int>, GenericState<int>>(
              bloc: counterCubit,
              builder: (context, state) {
                return Row(
                  children: [
                    InkWell(
                      onTap: () {
                        cartLogic.updateCart(cartId: cartId, serviceId: model?.id ?? 0, quantity: state.data + 1, index: index);
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          gradient: LinearGradient(
                            begin: Alignment(1, 0),
                            end: Alignment(-1.00, -0.00),
                            colors: [
                              ColorManager.primary,
                              ColorManager.secondary,
                            ],
                          ),
                        ),
                        child: Center(
                          child: MyText(
                            title: "+",
                            color: ColorManager.white,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: MyText(
                        title: "${state.data}",
                        size: 12,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (state.data > 1)
                          cartLogic.updateCart(cartId: cartId, serviceId: model?.id ?? 0, quantity: state.data - 1, index: index);
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                              color: ColorManager.grey2.withOpacity(0.7)),
                        ),
                        child: Center(
                          child: MyText(
                            title: "-",
                            color: ColorManager.grey2,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

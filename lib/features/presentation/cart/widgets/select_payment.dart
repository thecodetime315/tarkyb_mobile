import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/core/generic_cubit/generic_cubit.dart';
import 'package:base_flutter/features/presentation/cart/cart_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resource/color_manager.dart';

class SelectPayment extends StatelessWidget {
  final CartLogic cartLogic;

  const SelectPayment({Key? key, required this.cartLogic}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<int>, GenericState<int>>(
      bloc: cartLogic.selectPaymentCubit,
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: context.width * 0.45,
              margin: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                border: Border.all(color: ColorManager.grey2),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Radio<int>(
                    value: 1,
                    groupValue: state.data,
                    onChanged: (v) {
                      cartLogic.selectPaymentCubit.onUpdateData(v!);
                    },
                    activeColor: ColorManager.primary,
                  ),
                  MyText(
                    title: "كاش",
                  ),
                ],
              ),
            ),
            Container(
              width: context.width * 0.45,
              decoration: BoxDecoration(
                border: Border.all(color: ColorManager.grey2),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Radio<int>(
                    value: 2,
                    groupValue: state.data,
                    onChanged: (v) {
                      cartLogic.selectPaymentCubit.onUpdateData(v!);
                    },
                    activeColor: ColorManager.primary,
                  ),
                  MyText(
                    title: "اونلاين",
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

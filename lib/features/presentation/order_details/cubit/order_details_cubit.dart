import 'package:base_flutter/core/base_widgets/custom_button.dart';
import 'package:base_flutter/core/base_widgets/custom_text_field.dart';
import 'package:base_flutter/core/base_widgets/my_text.dart';
import 'package:base_flutter/core/extensions/media_query.dart';
import 'package:base_flutter/core/helpers/ui_helper.dart';
import 'package:base_flutter/core/helpers/validator.dart';
import 'package:base_flutter/core/resource/color_manager.dart';
import 'package:base_flutter/core/resource/navigation_service.dart';
import 'package:base_flutter/core/utils/enums.dart';
import 'package:base_flutter/features/custom_widgets/custom_gradient_button.dart';
import 'package:base_flutter/features/models/order_details_model.dart';
import 'package:base_flutter/features/presentation/orders/resources/order_base_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:base_flutter/core/injection/get_injection.dart' as di;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../chat_room/chat_room_imports.dart';
import '../../orders/cubits/orders_cubit.dart';

part 'order_details_state.dart';

class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  OrderDetailsCubit() : super(OrderDetailsState());

  @override
  Future<void> close() {
    reason.dispose();
    comment.dispose();
    return super.close();
  }

  TextEditingController reason = TextEditingController();
  TextEditingController comment = TextEditingController();
  num? ratingValue;
  getOrderDetails(int id) async {
    emit(state.copyWith(getOrderDetailsState: RequestState.loading));
    var result = await di.getIt<OrderBaseRepo>().orderDetails(id);
    if (result != null) {
      emit(state.copyWith(
          getOrderDetailsState: RequestState.loaded,
          orderDetailsModel: result));
    } else {
      emit(state.copyWith(getOrderDetailsState: RequestState.error));
    }
  }

  cancelOrder(
      BuildContext context, int orderId, AnimationController controller) async {
    UIHelper.showBottomSheet(
        context: context,
        controller: controller,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: MyText(
                    title: "هل تريد الغاء طلبك ؟",
                    color: ColorManager.black,
                    size: 16,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: MyText(
                    title: "سبب الغاء الطلب",
                    color: ColorManager.grey2,
                    size: 13,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  validator: (value) => value?.validateEmpty(context),
                  fieldTypes: FieldTypes.rich,
                  type: TextInputType.text,
                  controller: reason,
                  maxLines: 5,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: CustomGradientButton(
                        title: "الغاء الطلب",
                        onTap: () async {
                          if (reason.text.isNotEmpty) {
                            emit(state.copyWith(buttonState: RequestState.loading));
                            var result = await di
                                .getIt<OrderBaseRepo>()
                                .cancelOrder(reason.text, orderId);
                            if (result) {
                              NavigationService.back();
                              NavigationService.back();
                              context.read<OrdersCubit>().getCurrentOrders();
                              reason.clear();
                            }
                          }
                        },
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: CustomButton(
                          onTap: () {
                            NavigationService.back();
                          },
                          title: "الرجوع",
                          color: ColorManager.white,
                          borderColor: ColorManager.primary,
                          textColor: ColorManager.primary,
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),height: context.height * 0.5  );
  }


  ratingTechnician(
      BuildContext context, int technicianId,AnimationController controller) async {
    UIHelper.showBottomSheet(
        context: context,
        controller: controller,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: MyText(
                    title: "تقييم الفني",
                    color: ColorManager.black,
                    size: 16,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                RatingBar.builder(
                  initialRating: 0,
                  minRating: 1,
                  itemSize: 18,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  // ignoreGestures: true,
                  itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    ratingValue = rating;
                    print(ratingValue);
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                CustomTextField(
                  validator: (value) => value?.validateEmpty(context),
                  fieldTypes: FieldTypes.rich,
                  type: TextInputType.text,
                  controller: comment,
                  maxLines: 5,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: CustomGradientButton(
                        title: "قيم",
                        onTap: () async {
                          if (comment.text.isNotEmpty) {
                            emit(state.copyWith(buttonState: RequestState.loading));
                            var result = await di
                                .getIt<OrderBaseRepo>()
                                .userReview(comment.text, technicianId,ratingValue?? 1);
                            if (result) {
                              NavigationService.back();
                              comment.clear();
                            }
                          }
                        },
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: CustomButton(
                          onTap: () {
                            NavigationService.back();
                          },
                          title: "الرجوع",
                          color: ColorManager.white,
                          borderColor: ColorManager.primary,
                          textColor: ColorManager.primary,
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),height: context.height * 0.5  );
  }



  goToChat() async{
    NavigationService.navigateTo(ChatRoom(orderId: state.orderDetailsModel?.id ?? 0, name: state.orderDetailsModel?.technician?.name ?? '',));
  }
}

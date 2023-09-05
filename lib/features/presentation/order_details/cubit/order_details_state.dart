part of 'order_details_cubit.dart';

class OrderDetailsState extends Equatable {
  final RequestState getOrderDetailsState;
  final RequestState buttonState;
  final OrderDetailsModel? orderDetailsModel;
  const OrderDetailsState(
      {this.getOrderDetailsState = RequestState.loading,
      this.buttonState = RequestState.init,
      this.orderDetailsModel});

  OrderDetailsState copyWith(
      {RequestState? getOrderDetailsState,
      RequestState? buttonState,
      OrderDetailsModel? orderDetailsModel}) {
    return OrderDetailsState(
      getOrderDetailsState: getOrderDetailsState ?? this.getOrderDetailsState,
      buttonState: buttonState ?? this.buttonState,
      orderDetailsModel: orderDetailsModel ?? this.orderDetailsModel,
    );
  }

  List<Object> get props => [
        getOrderDetailsState,
      ];
}

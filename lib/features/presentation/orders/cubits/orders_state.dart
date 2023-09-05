part of 'orders_cubit.dart';

abstract class OrdersState extends Equatable {
  const OrdersState();
}

class OrdersInitial extends OrdersState {
  @override
  List<Object> get props => [];
}

class OrdersLoading extends OrdersState {
  @override
  List<Object?> get props => [];
}

class OrdersSuccess extends OrdersState {
  final List<OrdersModel> ordersList;

  OrdersSuccess(this.ordersList);
  @override
  List<Object> get props => [ordersList];
}

class OrdersFailed extends OrdersState {
  @override
  List<Object?> get props => [];
}

import 'package:base_flutter/features/models/orders_model.dart';
import 'package:base_flutter/features/presentation/orders/resources/order_base_repo.dart';
import 'package:base_flutter/features/presentation/orders/resources/order_repo_impl.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:base_flutter/core/injection/get_injection.dart' as di;

part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit() : super(OrdersInitial());

  OrderBaseRepo orderRepo = OrderRepoImpl();

  getCurrentOrders() async {
    emit(OrdersLoading());
    var data = await di.getIt<OrderBaseRepo>().currentOrders();
    if (data.length != 0) {
      emit(OrdersSuccess(data));
    } else {
      emit(OrdersFailed());
    }
  }

  getFinishedOrders() async {
    emit(OrdersLoading());
    var data = await di.getIt<OrderBaseRepo>().finishedOrders();
    if (data.length != 0) {
      emit(OrdersSuccess(data));
    } else {
      emit(OrdersFailed());
    }
  }
}


import '../../../models/order_details_model.dart';

import '../../../models/orders_model.dart';

abstract class OrderBaseRepo{
  Future<List<OrdersModel>> currentOrders();
  Future<List<OrdersModel>> finishedOrders();
  Future<OrderDetailsModel?> orderDetails(int id);
  Future<bool> cancelOrder(String reason, int orderId);
  Future<bool> userReview(String comment, int technicianId,num rating);
}
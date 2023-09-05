

import '../../../models/cart_model.dart';
import '../../../models/create_order_model.dart';
import '../../../models/working_time_model.dart';

abstract class CartBaseRepo {

  Future<CartModel?> getCart();
  Future<bool> deleteAllCart();
  Future<bool> deleteService(int id,{int serviceId = 0});
  Future<bool> updateServiceCount(int id,{int serviceId = 0,int quantity = 0});
  Future<List<WorkingTimeModel>> getWorkingTime(String date ,int technicianId);
  Future<bool> createOrder(CreateOrderModel model);
}
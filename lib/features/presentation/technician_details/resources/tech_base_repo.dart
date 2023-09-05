

import '../../../models/add_to_cart_model.dart';
import '../../../models/technician_details_model.dart';

abstract class TechBaseRepo{
  Future<TechnicianDetailsModel?> techDetails(int id,int vip);
  Future<bool> addToCart(AddToCartModel addToCartModel);
}
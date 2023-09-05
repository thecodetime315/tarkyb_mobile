

import 'package:base_flutter/features/presentation/technician_details/resources/tech_base_repo.dart';import '../../../../core/api_service/DioImports.dart';
import '../../../../core/resource/app_strings_manager.dart';
import '../../../models/add_to_cart_model.dart';
import '../../../models/technician_details_model.dart';

class TechRepoImpl extends TechBaseRepo{

  Future<TechnicianDetailsModel?> techDetails(int id,int vip) async{
    String param = '?vip=$vip';
    var data = await DioHelper().get(
      url: AppStringsManager.getTechnicianDetails + "$id"+ param,
    );
    if (data != null) {
      return TechnicianDetailsModel.fromJson(data["data"]);
    } else {
      return null;
    }
  }
  Future<bool> addToCart(AddToCartModel addToCartModel) async {
    var data = await DioHelper()
        .post(url: AppStringsManager.addToCart, body: addToCartModel.toJson());
    if (data != null) {
      // SnackBarHelper.showBasicSnack(msg: "");
      return true;
    } else {
      // SnackBarHelper.showBasicSnack(msg: data["message"]);
      return false;
    }
  }

}
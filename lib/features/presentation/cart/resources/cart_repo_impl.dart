import 'dart:developer';

import 'package:base_flutter/core/helpers/snack_helper.dart';
import 'package:base_flutter/features/presentation/cart/resources/cart_base_repo.dart';

import '../../../../core/api_service/DioImports.dart';
import '../../../../core/resource/app_strings_manager.dart';
import '../../../models/cart_model.dart';
import '../../../models/create_order_model.dart';
import '../../../models/working_time_model.dart';

class CartRepoImpl extends CartBaseRepo {
  // getCart

  Future<CartModel?> getCart() async {
    var data = await DioHelper().get(
      url: AppStringsManager.getCartItems,
    );
    if (data['data'] is String) {
      log("message test from api ");
      return null;
    } else {
      return CartModel.fromJson(data["data"] ?? {});
    }
  }

  Future<bool> deleteAllCart() async {
    var data =
        await DioHelper().post(url: AppStringsManager.deleteAllCart, body: {});
    if (data != null) {
      SnackBarHelper.showBasicSnack(msg: data['data']);
      return true;
    }
    return false;
  }

  Future<bool> deleteService(int id, {int serviceId = 0}) async {
    Map<String, dynamic> body = {"service_id": serviceId};
    var data = await DioHelper()
        .post(url: AppStringsManager.deleteService + "$id", body: body);
    if (data != null) {
      SnackBarHelper.showBasicSnack(msg: data['data']);
      return true;
    }
    return false;
  }

  Future<bool> updateServiceCount(int id,
      {int serviceId = 0, int quantity = 0}) async {
    Map<String, dynamic> body = {"service_id": serviceId, "quantity": quantity};
    var data = await DioHelper()
        .post(url: AppStringsManager.updateServiceCount + "$id", body: body);
    if (data != null) {
      SnackBarHelper.showBasicSnack(msg: data['data']);
      return true;
    }
    return false;
  }

  Future<List<WorkingTimeModel>> getWorkingTime(
      String date, int technicianId) async {
    Map<String, dynamic> body = {
      "date": date,
    };
    var data = await DioHelper().post(
        url: AppStringsManager.workingTimes + "$technicianId", body: body);
    if (data != null) {
      return List<WorkingTimeModel>.from(
          data["data"].map((e) => WorkingTimeModel.fromJson(e)));
    } else {
      return [];
    }
  }

  Future<bool> createOrder(CreateOrderModel model) async {
    var data = await DioHelper()
        .post(url: AppStringsManager.createOrder, body: model.toJson());
    if (data != null) {
      return true;
    } else {
      SnackBarHelper.showBasicSnack(msg: data["data"]);
      return false;
    }
  }
}

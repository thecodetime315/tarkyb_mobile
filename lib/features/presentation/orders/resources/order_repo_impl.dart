import 'package:base_flutter/core/helpers/snack_helper.dart';
import 'package:base_flutter/features/models/orders_model.dart';
import 'package:base_flutter/features/presentation/orders/resources/order_base_repo.dart';

import '../../../../core/api_service/DioImports.dart';
import '../../../../core/resource/app_strings_manager.dart';
import '../../../models/order_details_model.dart';

class OrderRepoImpl extends OrderBaseRepo {
  Future<List<OrdersModel>> currentOrders() async {
    var data = await DioHelper().get(
      url: AppStringsManager.currentOrder,
    );
    if (data != null) {
      return List<OrdersModel>.from(data["data"].map(
        (e) => OrdersModel.fromJson(e),
      ));
    } else {
      return [];
    }
  }

  Future<List<OrdersModel>> finishedOrders() async {
    var data = await DioHelper().get(
      url: AppStringsManager.completeOrder,
    );
    if (data != null) {
      return List<OrdersModel>.from(data["data"].map(
        (e) => OrdersModel.fromJson(e),
      ));
    } else {
      return [];
    }
  }

  Future<OrderDetailsModel?> orderDetails(int id) async {
    var data =
        await DioHelper().get(url: AppStringsManager.orderDetails + "$id");
    if (data != null) {
      return OrderDetailsModel.fromJson(data["data"]);
    } else {
      return null;
    }
  }

  Future<bool> cancelOrder(String reason, int orderId) async {
    Map<String, dynamic> body = {
      "user_order_id": orderId,
      "reason": reason,
    };

    var data =
        await DioHelper().post(url: AppStringsManager.cancelOrder, body: body);
    if (data != null) {
      SnackBarHelper.showBasicSnack(msg: data["data"]);
      return true;
    } else {
      SnackBarHelper.showBasicSnack(msg: data['data']["error"]["reason"]);
      return false;
    }
  }

  Future<bool> userReview(String comment, int technicianId, num rating) async {
    Map<String, dynamic> body = {
      "reviewed_id": technicianId,
      "rating": rating,
      "comment": comment,
    };

    var data =
        await DioHelper().post(url: AppStringsManager.userReview, body: body);
    if (data != null) {
      SnackBarHelper.showBasicSnack(msg: "تم تقييم الفني بنجاح");
      return true;
    } else {
      SnackBarHelper.showBasicSnack(msg: data['data']["error"]["reason"]);
      return false;
    }
  }
}

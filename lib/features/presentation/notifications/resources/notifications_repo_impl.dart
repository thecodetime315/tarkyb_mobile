
import 'package:base_flutter/core/helpers/snack_helper.dart';


import '../../../../core/api_service/DioImports.dart';
import '../models/notifications_model.dart';

class NotificationsRepoImpl{
  // Future<NotificationsModel?> notifications(int page) async{
  //   String param = '?paginate=20&page=$page';
  //   var data = await DioHelper().get(url: ApiNames.notifications + param);
  //   if (data != null) {
  //     return NotificationsModel.fromJson(data['data']);
  //   } else {
  //     return null;
  //   }
  // }
  // Future<bool> deleteNotification(String id) async {
  //   var data = await DioHelper().delete(url: ApiNames.deleteNotifications + id);
  //   if(data["status"] == true){
  //     SnackBarHelper.showBasicSnack(msg: data["message"]);
  //     return true;
  //   }
  //   else{
  //     SnackBarHelper.showBasicSnack(msg: data["message"]);
  //     return false;
  //   }
  // }
  // Future<bool> deleteAllNotifications() async {
  //   var data = await DioHelper().delete(url: ApiNames.deleteAllNotifications);
  //   if(data["status"] == true){
  //     SnackBarHelper.showBasicSnack(msg: data["message"]);
  //     return true;
  //   }
  //   else{
  //     SnackBarHelper.showBasicSnack(msg: data["message"]);
  //     return false;
  //   }
  // }
}
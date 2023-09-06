import 'package:base_flutter/core/resource/app_strings_manager.dart';

import '../../../../core/api_service/DioImports.dart';
import '../models/notifications_model.dart';
import 'notifications_repo.dart';

class NotificationsRepoImpl extends NotificationsBaseRepo {
  Future<List<NotificationsModel>> notifications() async {
    var data =
        await DioHelper().get(url: AppStringsManager.getAllNotifications);
    if (data != null) {
      return List<NotificationsModel>.from(
          data["data"].map((e) => NotificationsModel.fromJson(e)));
    } else {
      return [];
    }
  }
}

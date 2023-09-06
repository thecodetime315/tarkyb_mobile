import '../models/notifications_model.dart';

abstract class NotificationsBaseRepo {
  Future<List<NotificationsModel>> notifications();
}

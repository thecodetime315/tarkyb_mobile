import '../models/notifications_model.dart';
import 'notifications_repo_impl.dart';

class NotificationsRepo {
  late NotificationsRepoImpl _notificationsRepoImpl;

  NotificationsRepo() {
    _notificationsRepoImpl = NotificationsRepoImpl();
  }
  // Future<NotificationsModel?> notifications(int page)=>_notificationsRepoImpl.notifications(page);
  // Future<bool> deleteNotification(String id)=>_notificationsRepoImpl.deleteNotification(id);
  // Future<bool> deleteAllNotifications()=>_notificationsRepoImpl.deleteAllNotifications();
}

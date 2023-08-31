
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/notifications_model.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit() : super(NotificationsInitial());
  List<NotificationsBody> oldNotifications = [];
  List<NotificationsBody> notifications = [];
  int page = 1;

  // Future<void> loadedNotifications() async {
  //   final allNotificationData = await NotificationsRepo().notifications(page);
  //   oldNotifications
  //       .addAll(allNotificationData?.notifications?.notificationsBody ?? []);
  //   notifications.addAll(oldNotifications);
  //   emit(NotificationsLoaded(notifications));
  //   page++;
  // }
  //
  // deleteOneNotification(String id) async {
  //   bool result = await NotificationsRepo().deleteNotification(id);
  //   if(result){
  //   notifications.removeWhere((element) => element.id == id);
  //   log("updated Notify :$notifications");
  //   emit(NotificationsInitial());
  //   emit(NotificationsLoaded(notifications));
  //   }
  // }
  // deleteAllNotifications() async {
  //   bool result = await NotificationsRepo().deleteAllNotifications();
  //   if(result){
  //   notifications = [];
  //   emit(NotificationsInitial());
  //   emit(NotificationsLoaded(notifications));
  //   }
  // }
}

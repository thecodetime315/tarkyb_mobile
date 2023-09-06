import 'package:base_flutter/features/presentation/notifications/resources/notifications_repo.dart';
import 'package:base_flutter/features/presentation/notifications/resources/notifications_repo_impl.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/notifications_model.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit() : super(NotificationsInitial());
  List<NotificationsModel> notifications = [];
  NotificationsBaseRepo notificationRepo = NotificationsRepoImpl();
  Future<void> loadedNotifications() async {
    emit(NotificationsLoading());

    final allNotificationData = await notificationRepo.notifications();
    emit(NotificationsLoaded(allNotificationData));
  }
}

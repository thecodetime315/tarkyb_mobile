part of 'notifications_cubit.dart';

abstract class NotificationsState extends Equatable {
  const NotificationsState();
  @override
  List<Object> get props => [];
}

class NotificationsInitial extends NotificationsState {}
class NotificationsLoaded extends NotificationsState {
  final List<NotificationsBody> notifications;

  NotificationsLoaded(this.notifications);
}

class NotificationsLoading extends NotificationsState {
  final List<NotificationsBody> oldNotifications;
  final bool isFirstFetch;

  NotificationsLoading(this.oldNotifications, {this.isFirstFetch=false});
}
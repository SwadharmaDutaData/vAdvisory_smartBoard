part of 'notification_cubit.dart';

abstract class NotificationState extends Equatable {
  const NotificationState();

  @override
  List<Object> get props => [];
}

class NotificationInitial extends NotificationState {}

class NotificationLoaded extends NotificationState {
  final String message;

  NotificationLoaded(this.message);

  @override
  List<Object> get props => [message];
}

class NotificationLoadingFailed extends NotificationState {
  final String message;

  NotificationLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}
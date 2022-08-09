import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/models.dart';
import '../../services/services.dart';

part 'notification_state.dart';


class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());

  Future<void> pushNotification(String body, String name, String token) async {
    ApiReturnValue<String> result = await NotificationService.pushNotification(body, name, token);

    if (result.value != null) {
      emit(NotificationLoaded(result.value!));
    } else {
      emit(NotificationLoadingFailed(result.message!));
    }
  }
}

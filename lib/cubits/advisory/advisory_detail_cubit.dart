import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/models.dart';
import '../../services/services.dart';

part 'advisory_detail_state.dart';

class AdvisoryDetailCubit extends Cubit<AdvisoryDetailState> {
  AdvisoryDetailCubit() : super(AdvisoryDetailInitial());

  Future<void> getBoardNotification(String deviceid) async {
    ApiReturnValue<AdvisoryDetailModel> result = await RegistrationService.getBoardNotification(deviceid);

    if (result.value != null) {
      emit(AdvisoryDetailLoaded(result.value!));
    } else {
      emit(AdvisoryDetailLoadingFailed(result.message!));
    }
  }
}
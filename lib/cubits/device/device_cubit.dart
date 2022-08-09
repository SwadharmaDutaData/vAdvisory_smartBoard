import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vadvisory_smartboard/models/models.dart';
import 'package:vadvisory_smartboard/services/services.dart';

part 'device_state.dart';

class DeviceCubit extends Cubit<DeviceState> {
  DeviceCubit() : super(DeviceInitial());

  Future<void> registrationDevice(BranchModel mbranch, String deviceid) async {
    ApiReturnValue<DeviceModel> result = await RegistrationService.registrationDevice(mbranch, deviceid);

    if (result.value != null) {
      emit(DeviceLoaded(result.value!));
    } else {
      emit(DeviceLoadingFailed(result.message!));
    }
  }
}
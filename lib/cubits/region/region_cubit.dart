import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/models.dart';
import '../../services/services.dart';

part 'region_state.dart';

class RegionCubit extends Cubit<RegionState> {
  RegionCubit() : super(RegionInitial());
  Future<void> getRegion() async {
    ApiReturnValue<List<RegionModel>> listRegion = await BookingServices.getRegion();

    if (listRegion.value != null) {
      emit(RegionLoaded(listRegion.value!));
    } else {
      emit(RegionLoadingFailed(listRegion.message!));
    }
  }
}
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/models.dart';
import '../../services/services.dart';

part 'branch_state.dart';

class BranchCubit extends Cubit<BranchState> {
  BranchCubit() : super(BranchInitial());
  Future<void> getBranch(String branchid) async {
    ApiReturnValue<List<BranchModel>> result = await BookingServices.getBranch(branchid);

    if (result.value != null) {
      emit(BranchLoaded(result.value!));
    } else {
      emit(BranchLoadingFailed(result.message!));
    }
  }
}
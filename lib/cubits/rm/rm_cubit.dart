import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/models.dart';
import '../../services/services.dart';

part 'rm_state.dart';

class RmCubit extends Cubit<RmState> {
  RmCubit() : super(RmInitial());
  Future<void> getRmById(int mproductpk) async {
    ApiReturnValue<List<RmModel>> result = await ProductServices.getRmByProduct(mproductpk);

    if (result.value != null) {
      emit(RmLoaded(result.value!));
    } else {
      emit(RmLoadingFailed(result.message!));
    }
  }
}
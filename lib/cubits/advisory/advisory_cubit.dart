import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/models.dart';
import '../../services/services.dart';

part 'advisory_state.dart';

class AdvisoryCubit extends Cubit<AdvisoryState> {
  AdvisoryCubit() : super(AdvisoryInitial());

  Future<void> postAdvisory(String bookid, RmModel mrm, CustomerModel mcust, ProductModel mproduct,) async {
    ApiReturnValue<AdvisoryModel> result = await BookingServices.postAdvisory(bookid, mrm, mcust, mproduct,);

    if (result.value != null) {
      emit(AdvisoryLoaded(result.value!));
    } else {
      emit(AdvisoryLoadingFailed(result.message!));
    }
  }
}
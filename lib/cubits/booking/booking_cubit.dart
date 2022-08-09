import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/models.dart';
import '../../services/services.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit() : super(BookingInitial());

  Future<void> findrm(String bookid) async {
    AdvisoryReturnValue<dynamic> result = await BookingServices.findRm(bookid);

    if (result.valueA != null && result.valueA != null) {
      emit(BookingLoaded(result.valueA!, result.valueB!));
    } else {
      emit(BookingLoadingFailed(result.message!));
    }
  }
}
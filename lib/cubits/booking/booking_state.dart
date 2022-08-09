part of 'booking_cubit.dart';

abstract class BookingState extends Equatable {
  const BookingState();

  @override
  List<Object> get props => [];
}

class BookingInitial extends BookingState {}

class BookingLoaded extends BookingState {
  final List<RmModel> rm;
  final CustomerModel customer;

  const BookingLoaded(this.rm, this.customer);

  @override
  List<Object> get props => [rm];
}

class BookingLoadingFailed extends BookingState {
  final String message;

  BookingLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}
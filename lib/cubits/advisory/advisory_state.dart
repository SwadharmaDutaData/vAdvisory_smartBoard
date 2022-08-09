part of 'advisory_cubit.dart';

abstract class AdvisoryState extends Equatable {
  const AdvisoryState();

  @override
  List<Object> get props => [];
}

class AdvisoryInitial extends AdvisoryState {}

class AdvisoryLoaded extends AdvisoryState {
  final AdvisoryModel advisory;

  const AdvisoryLoaded(this.advisory);

  @override
  List<Object> get props => [advisory];
}

class AdvisoryLoadingFailed extends AdvisoryState {
  final String message;

  AdvisoryLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}
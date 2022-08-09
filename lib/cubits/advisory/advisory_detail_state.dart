part of 'advisory_detail_cubit.dart';

abstract class AdvisoryDetailState extends Equatable {
  const AdvisoryDetailState();

  @override
  List<Object> get props => [];
}

class AdvisoryDetailInitial extends AdvisoryDetailState {}

class AdvisoryDetailLoaded extends AdvisoryDetailState {
  final AdvisoryDetailModel advisoryDetail;

  const AdvisoryDetailLoaded(this.advisoryDetail);

  @override
  List<Object> get props => [advisoryDetail];
}

class AdvisoryDetailLoadingFailed extends AdvisoryDetailState {
  final String message;

  AdvisoryDetailLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}
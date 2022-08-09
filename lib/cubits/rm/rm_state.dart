part of 'rm_cubit.dart';

abstract class RmState extends Equatable {
  const RmState();

  @override
  List<Object> get props => [];
}

class RmInitial extends RmState {}

class RmLoaded extends RmState {
  final List<RmModel> rmList;

  RmLoaded(this.rmList);

  @override
  List<Object> get props => [rmList];
}

class RmLoadingFailed extends RmState {
  final String message;

  RmLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}
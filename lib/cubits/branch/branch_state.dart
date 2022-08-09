part of 'branch_cubit.dart';

abstract class BranchState extends Equatable {
  const BranchState();

  @override
  List<Object> get props => [];
}

class BranchInitial extends BranchState {}

class BranchLoaded extends BranchState {
  final List<BranchModel> branch;

  BranchLoaded(this.branch);

  @override
  List<Object> get props => [branch];
}

class BranchLoadingFailed extends BranchState {
  final String message;

  BranchLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}
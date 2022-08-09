part of 'region_cubit.dart';

abstract class RegionState extends Equatable {
  const RegionState();

  @override
  List<Object> get props => [];
}

class RegionInitial extends RegionState {}

class RegionLoaded extends RegionState {
  final List<RegionModel> region;

  RegionLoaded(this.region);

  @override
  List<Object> get props => [region];
}

class RegionLoadingFailed extends RegionState {
  final String message;

  RegionLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}
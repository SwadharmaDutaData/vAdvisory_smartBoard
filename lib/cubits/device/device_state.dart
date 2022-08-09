part of 'device_cubit.dart';

abstract class DeviceState extends Equatable {
  const DeviceState();

  @override
  List<Object> get props => [];
}

class DeviceInitial extends DeviceState {}

class DeviceLoaded extends DeviceState {
  final DeviceModel device;

  DeviceLoaded(this.device);

  @override
  List<Object> get props => [device];
}

class DeviceLoadingFailed extends DeviceState {
  final String message;

  DeviceLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}
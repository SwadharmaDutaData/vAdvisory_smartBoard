part of 'models.dart';

class DeviceModel extends Equatable {
  const DeviceModel(
      {this.mdevicepk, this.mbranch, this.deviceid, this.createdtime});

  final int? mdevicepk;
  final BranchModel? mbranch;
  final String? deviceid;
  final String? createdtime;

  DeviceModel copyWith({
    int? mdevicepk,
    BranchModel? mbranch,
    String? deviceid,
    String? createdtime,
  }) =>
      DeviceModel(
        mdevicepk: mdevicepk ?? this.mdevicepk,
        mbranch: mbranch ?? this.mbranch,
        deviceid: deviceid ?? this.deviceid,
        createdtime: createdtime ?? this.createdtime,
      );

  factory DeviceModel.fromJson(Map<String, dynamic> json) => DeviceModel(
    mdevicepk: json['mdevicepk'] ?? 0,
    mbranch: json["mbranch"] != null
        ? BranchModel.fromJson(json["mbranch"])
        : null,
    deviceid: json['deviceid']?.trim() ?? '',
    createdtime: json['createdtime']?.trim() ?? '',
  );

  Map<String, dynamic> toJson() => {
    "mdevicepk": mdevicepk,
    "mbranch": mbranch,
    "deviceid": deviceid,
    "createdtime": createdtime,
  };

  @override
  // TODO: implement props
  List<Object?> get props => [
    mdevicepk,
    mbranch,
    deviceid,
    createdtime,
  ];
}

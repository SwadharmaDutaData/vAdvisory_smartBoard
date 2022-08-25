part of 'models.dart';

class RegionModel extends Equatable {
  const RegionModel({
    this.mregionpk,
    this.regioncode,
    this.regionid,
    this.regionname,
    this.updatedby,
    this.lastupdated,
    this.mprovince
  });
  final int? mregionpk;
  final String? regioncode;
  final String? regionid;
  final String? regionname;
  final String? updatedby;
  final String? lastupdated;
  final ProvinceModel? mprovince;

  RegionModel copyWith({
    int? mregionpk,
    String? regioncode,
    String? regionid,
    String? regionname,
    String? updatedby,
    String? lastupdated,
    ProvinceModel? mprovince,
  }) =>
      RegionModel(
        mregionpk: mregionpk ?? this.mregionpk,
        regioncode: regioncode ?? this.regioncode,
        regionid: regionid ?? this.regionid,
        regionname: regionname ?? this.regionname,
        updatedby: updatedby ?? this.updatedby,
        lastupdated: lastupdated ?? this.lastupdated,
        mprovince: mprovince ?? this.mprovince,

      );

  factory RegionModel.fromJson(Map<String, dynamic> json) => RegionModel(
    mregionpk: json['mregionpk'] ?? 0,
    mprovince: json["mprovince"] != null
        ? ProvinceModel.fromJson(json["mprovince"])
        : null,
    regioncode: json['regioncode']?.trim() ?? '',
    regionid: json['regionid']?.trim() ?? '',
    regionname: json['regionname']?.trim() ?? '',
    updatedby: json['updatedby']?.trim() ?? '',
    lastupdated: json['lastupdated']?.trim() ?? '',
  );

  Map<String, dynamic> toJson() => {
    "mregionpk": mregionpk,
    "mprovince": mprovince,
    "regioncode": regioncode,
    "regionid": regionid,
    "regionname": regionname,
    "lastupdated": lastupdated,
    "updatedby": updatedby,
  };

  @override
  // TODO: implement props
  List<Object?> get props => [
    mregionpk!,
    mprovince!,
    regioncode!,
    regionid!,
    regionname!,
    updatedby!,
    lastupdated!,
  ];
}
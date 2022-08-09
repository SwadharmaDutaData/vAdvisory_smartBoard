part of 'models.dart';

class RegionModel extends Equatable {
  const RegionModel({
    this.mregionpk,
    this.regioncode,
    this.regionid,
    this.regionname,
    this.updatedby,
    this.lastupdated,
    this.mprovincefk
  });
  final int? mregionpk;
  final String? regioncode;
  final String? regionid;
  final String? regionname;
  final String? updatedby;
  final String? lastupdated;
  final int? mprovincefk;

  RegionModel copyWith({
    int? mregionpk,
    int? mprovincefk,
    String? regioncode,
    String? regionid,
    String? regionname,
    String? updatedby,
    String? lastupdated,
  }) =>
      RegionModel(
        mregionpk: mregionpk ?? this.mregionpk,
        mprovincefk: mprovincefk ?? this.mprovincefk,
        regioncode: regioncode ?? this.regioncode,
        regionid: regionid ?? this.regionid,
        regionname: regionname ?? this.regionname,
        updatedby: updatedby ?? this.updatedby,
        lastupdated: lastupdated ?? this.lastupdated,
      );

  factory RegionModel.fromJson(Map<String, dynamic> json) => RegionModel(
    mregionpk: json['mregionpk'] ?? 0,
    mprovincefk: json['mprovincefk'] ?? 0,
    regioncode: json['regioncode']?.trim() ?? '',
    regionid: json['regionid']?.trim() ?? '',
    regionname: json['regionname']?.trim() ?? '',
    updatedby: json['updatedby']?.trim() ?? '',
    lastupdated: json['lastupdated']?.trim() ?? '',
  );

  @override
  // TODO: implement props
  List<Object?> get props => [
    mregionpk!,
    mprovincefk!,
    regioncode!,
    regionid!,
    regionname!,
    updatedby!,
    lastupdated!,
  ];
}
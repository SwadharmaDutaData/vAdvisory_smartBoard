part of 'models.dart';

class BranchModel extends Equatable {
  const BranchModel({
    this.mbranchpk,
    this.branchaddress,
    this.branchcode,
    this.branchid,
    this.branchname,
    this.lastupdated,
    this.updatedby,
  });

  final int? mbranchpk;
  final String? branchaddress;
  final String? branchcode;
  final String? branchid;
  final String? branchname;
  final String? lastupdated;
  final String? updatedby;

  BranchModel copyWith({
    int? mbranchpk,
    String? branchaddress,
    String? branchcode,
    String? branchid,
    String? branchname,
    String? lastupdated,
    String? updatedby,
  }) =>
      BranchModel(
        mbranchpk: mbranchpk ?? this.mbranchpk,
        branchaddress: branchaddress ?? this.branchaddress,
        branchcode: branchcode ?? this.branchcode,
        branchid: branchid ?? this.branchid,
        branchname: branchname ?? this.branchname,
        lastupdated: lastupdated ?? this.lastupdated,
        updatedby: updatedby ?? this.updatedby,
      );

  factory BranchModel.fromJson(Map<String, dynamic> json) => BranchModel(
    mbranchpk: json['mbranchpk'] ?? 0,
    branchaddress: json['branchaddress']?.trim() ?? '',
    branchcode: json['branchcode']?.trim() ?? '',
    branchid: json['branchid']?.trim() ?? '',
    branchname: json['branchname']?.trim() ?? '',
    lastupdated: json['lastupdated']?.trim() ?? '',
    updatedby: json['updatedby']?.trim() ?? '',
  );

  Map<String, dynamic> toJson() => {
    "mbranchpk": mbranchpk,
    "branchaddress": branchaddress,
    "branchcode": branchcode,
    "branchid": branchid,
    "branchname": branchname,
    "lastupdated": lastupdated,
    "updatedby": updatedby,
  };

  @override
  // TODO: implement props
  List<Object?> get props => [
    mbranchpk!,
    branchaddress!,
    branchcode!,
    branchid!,
    branchname!,
    lastupdated!,
    updatedby!,
  ];
}

part of 'models.dart';

class RmModel extends Equatable {
  const RmModel({
    this.mrmpk,
    this.mbranch,
    this.mproduct,
    this.mlevel,
    this.npp,
    this.rmname,
    this.nohp,
    this.email,
    this.updatedby,
    this.lastupdated,
    this.createdtime,
    this.rmstatus,
    this.imagedata,
    this.token,
    this.deviceid,
  });

  final int? mrmpk;
  final BranchModel? mbranch;
  final ProductModel? mproduct;
  final LevelModel? mlevel;
  final String? npp;
  final String? rmname;
  final String? nohp;
  final String? email;
  final String? updatedby;
  final String? lastupdated;
  final String? createdtime;
  final int? rmstatus;
  final String? imagedata;
  final String? token;
  final String? deviceid;

  RmModel copyWith({
    int? mrmpk,
    BranchModel? mbranch,
    ProductModel? mproduct,
    LevelModel? mlevel,
    String? npp,
    String? rmname,
    String? nohp,
    String? email,
    String? updatedby,
    String? lastupdated,
    String? createdtime,
    int? rmstatus,
    String? imagedata,
    String? token,
    String? deviceid,
  }) =>
      RmModel(
        mrmpk: mrmpk ?? this.mrmpk,
        mbranch: mbranch ?? this.mbranch,
        mproduct: mproduct ?? this.mproduct,
        mlevel: mlevel ?? this.mlevel,
        npp: npp ?? this.npp,
        rmname: rmname ?? this.rmname,
        nohp: nohp ?? this.nohp,
        email: email ?? this.email,
        updatedby: updatedby ?? this.updatedby,
        lastupdated: lastupdated ?? this.lastupdated,
        createdtime: createdtime ?? this.createdtime,
        rmstatus: rmstatus ?? this.rmstatus,
        imagedata: imagedata ?? this.imagedata,
        token: token ?? this.token,
        deviceid: deviceid ?? this.deviceid,
      );

  factory RmModel.fromJson(Map<String, dynamic> json) =>
      RmModel(
        mrmpk: json['mrmpk'] ?? 0,
        mbranch: json["mbranch"] != null
            ? BranchModel.fromJson(json["mbranch"])
            : null,
        mproduct: json['mproduct'] != null ? ProductModel.fromJson(
            json["mproduct"]) : null,
        mlevel: json['mlevel'] != null
            ? LevelModel.fromJson(json["mlevel"])
            : null,
        npp: json['npp']?.trim() ?? '',
        rmname: json['rmname']?.trim() ?? '',
        nohp: json['nohp']?.trim() ?? '',
        email: json['email']?.trim() ?? '',
        updatedby: json['updatedby']?.trim() ?? '',
        lastupdated: json['lastupdated']?.trim() ?? '',
        createdtime: json['createdtime']?.trim() ?? '',
        rmstatus: json['rmstatus'] ?? 0,
        imagedata: json['imagedata']?.trim() ?? '',
        token: json['token']?.trim() ?? '',
        deviceid: json['deviceid']?.trim() ?? '',
      );

  Map<String, dynamic> toJson() => {
    "mrmpk": mrmpk,
    "mbranch": mbranch,
    "mproduct": mproduct,
    "mlevel": mlevel,
    "npp": npp,
    "rmname": rmname,
    "nohp": nohp,
    "email": email,
    "mbranch": mbranch,
    "updatedby": updatedby,
    "lastupdated": lastupdated,
    "createdtime": createdtime,
    "rmstatus": rmstatus,
    "imagedata": imagedata,
    "token": token,
    "deviceid": deviceid,
  };

  @override
  // TODO: implement props
  List<Object?> get props =>
      [
        mrmpk!,
        mbranch!,
        mproduct!,
        mlevel!,
        npp!,
        rmname!,
        nohp!,
        email!,
        updatedby!,
        lastupdated!,
        createdtime!,
        rmstatus!,
        imagedata,
        token,
        deviceid,
      ];
}

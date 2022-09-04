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
    this.imageurl,
    this.token,
    this.deviceid,
    this.rating,
    this.totalservice,
    this.advisor,
    this.rmtype
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
  final String? imageurl;
  final String? token;
  final String? deviceid;
  final double? rating;
  final int? totalservice;
  final String? rmtype;
  final String? advisor;

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
    String? imageurl,
    String? token,
    String? deviceid,
    double? rating,
    int? totalservice,
    String? rmtype,
    String? advisor,
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
        imageurl: imageurl ?? this.imageurl,
        token: token ?? this.token,
        deviceid: deviceid ?? this.deviceid,
        rating: rating ?? this.rating,
        totalservice: totalservice ?? this.totalservice,
        rmtype: rmtype ?? this.rmtype,
        advisor: advisor ?? this.advisor,
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
        imageurl: json['imageurl']?.trim() ?? '',
        token: json['token']?.trim() ?? '',
        deviceid: json['deviceid']?.trim() ?? '',
        rmtype: json['rmtype']?.trim() ?? '',
        advisor: json['advisor']?.trim() ?? '',
        rating: json['rating'] ?? 0.0,
        totalservice: json['totalservice'] ?? 0,
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
    "updatedby": updatedby,
    "lastupdated": lastupdated,
    "createdtime": createdtime,
    "rmstatus": rmstatus,
    "imagedata": imagedata,
    "imageurl": imageurl,
    "token": token,
    "deviceid": deviceid,
    "rating": rating,
    "totalservice": totalservice,
    "rmtype": rmtype,
    "advisor": advisor,
  };

  @override
  // TODO: implement props
  List<Object?> get props =>
      [
        mrmpk,
        mbranch,
        mproduct,
        mlevel,
        npp,
        rmname,
        nohp,
        email,
        updatedby,
        lastupdated,
        createdtime,
        rmstatus,
        imagedata,
        imageurl,
        token,
        deviceid,
        rating,
        totalservice,
        rmtype,
        advisor,
      ];
}

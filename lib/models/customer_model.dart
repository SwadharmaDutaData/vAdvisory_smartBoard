part of 'models.dart';

class CustomerModel extends Equatable {
  const CustomerModel(
      {this.mcustpk,
        this.nohp,
        this.custname,
        this.nik,
        this.email,
        this.createdtime,
        this.updatedby,
        this.lastupdated,
        this.totalloan,
        this.remainloan,
        this.iscollectibility,
        this.havecreditcard,
        this.imagedata,
        this.totalsaldo,
        this.token,
        this.deviceid});

  final int? mcustpk;
  final String? nohp;
  final String? custname;
  final String? nik;
  final String? email;
  final String? createdtime;
  final String? updatedby;
  final String? lastupdated;
  final int? totalloan;
  final int? remainloan;
  final int? iscollectibility;
  final bool? havecreditcard;
  final String? imagedata;
  final int? totalsaldo;
  final String? token;
  final String? deviceid;

  CustomerModel copyWith({
    int? mcustpk,
    String? nohp,
    String? custname,
    String? nik,
    String? email,
    String? createdtime,
    String? updatedby,
    String? lastupdated,
    int? totalloan,
    int? remainloan,
    int? iscollectibility,
    bool? havecreditcard,
    String? imagedata,
    int? totalsaldo,
    String? token,
    String? deviceid,
  }) =>
      CustomerModel(
        mcustpk: mcustpk ?? this.mcustpk,
        nohp: nohp ?? this.nohp,
        custname: custname ?? this.custname,
        nik: nik ?? this.nik,
        email: email ?? this.email,
        createdtime: createdtime ?? this.createdtime,
        lastupdated: lastupdated ?? this.lastupdated,
        updatedby: updatedby ?? this.updatedby,
        totalloan: totalloan ?? this.totalloan,
        remainloan: remainloan ?? this.remainloan,
        iscollectibility: iscollectibility ?? this.iscollectibility,
        havecreditcard: havecreditcard ?? this.havecreditcard,
        imagedata: imagedata ?? this.imagedata,
        totalsaldo: totalsaldo ?? this.totalsaldo,
        token: token ?? this.token,
        deviceid: deviceid ?? this.deviceid,
      );

  factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
    mcustpk: json['mcustpk'] ?? 0,
    nohp: json['nohp']?.trim() ?? '',
    custname: json['custname']?.trim() ?? '',
    nik: json['nik']?.trim() ?? '',
    email: json['email']?.trim() ?? '',
    createdtime: json['createdtime']?.trim() ?? '',
    updatedby: json['updatedby']?.trim() ?? '',
    lastupdated: json['lastupdated']?.trim() ?? '',
    totalloan: json['totalloan'] ?? 0,
    remainloan: json['remainloan'] ?? 0,
    iscollectibility: json['iscollectibility'] ?? 0,
    havecreditcard: json['havecreditcard'] ?? true,
    imagedata: json['imagedata']?.trim() ?? '',
    totalsaldo: json['totalsaldo'] ?? 0,
    token: json['token']?.trim() ?? '',
    deviceid: json['deviceid']?.trim() ?? '',
  );

  Map<String, dynamic> toJson() => {
    "mcustpk": mcustpk,
    "nohp": nohp,
    "custname": custname,
    "email": email,
    "nik": nik,
    "createdtime": createdtime,
    "updatedby": updatedby,
    "lastupdated": lastupdated,
    "totalloan": totalloan,
    "remainloan": remainloan,
    "iscollectibility": iscollectibility,
    "havecreditcard": havecreditcard,
    "imagedata": imagedata,
    "totalsaldo": totalsaldo,
    "token": token,
    "deviceid": deviceid,
  };

  @override
  // TODO: implement props
  List<Object?> get props => [
    mcustpk,
    nohp,
    custname,
    nik,
    email,
    createdtime,
    updatedby,
    lastupdated,
    totalloan,
    remainloan,
    iscollectibility,
    havecreditcard,
    imagedata,
    totalsaldo,
    token,
    deviceid,
  ];
}

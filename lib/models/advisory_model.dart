part of 'models.dart';

class AdvisoryModel extends Equatable {
  const AdvisoryModel(
      {this.tadvisorypk,
        this.mrm,
        this.mcust,
        this.mproduct,
        this.meetstart,
        this.meetend,
        this.meetdate,
        this.bookid,
        this.meetstatus,
        this.rate
      });

  final int? tadvisorypk;
  final RmModel? mrm;
  final CustomerModel? mcust;
  final ProductModel? mproduct;
  final String? meetstart;
  final String? meetend;
  final String? meetdate;
  final String? bookid;
  final int? meetstatus;
  final int? rate;

  AdvisoryModel copyWith({
    int? tadvisorypk,
    RmModel? mrm,
    CustomerModel? mcust,
    ProductModel? mproduct,
    String? meetstart,
    String? meetend,
    String? meetdate,
    String? bookid,
    int? meetstatus,
    int? rate,
  }) =>
      AdvisoryModel(
          tadvisorypk: tadvisorypk ?? this.tadvisorypk,
          mrm: mrm ?? this.mrm,
          mcust: mcust ?? this.mcust,
          meetstart: meetstart ?? this.meetstart,
          bookid: bookid ?? this.bookid,
          meetend: meetend ?? this.meetend,
          meetdate: meetdate ?? this.meetdate,
          mproduct: mproduct ?? this.mproduct,
          meetstatus: meetstatus ?? this.meetstatus,
        rate: rate ?? this.rate,
      );

  factory AdvisoryModel.fromJson(Map<String, dynamic> json) => AdvisoryModel(
    tadvisorypk: json['tadvisorypk'] ?? 0,
    bookid: json['bookid']?.trim() ?? '',
    meetend: json['meetend']?.trim() ?? '',
    meetdate: json['meetdate']?.trim() ?? '',
    meetstart: json['meetstart']?.trim() ?? '',
    mrm: json["mrm"] != null
        ? RmModel.fromJson(json["mrm"])
        : null,
    mcust: json["mcust"] != null
        ? CustomerModel.fromJson(json["mcust"])
        : null,
    mproduct: json["mproduct"] != null
        ? ProductModel.fromJson(json["mproduct"])
        : null,
    meetstatus: json['meetstatus'] ?? 0,
    rate: json['rate'] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "tadvisorypk": tadvisorypk,
    "bookid": bookid,
    "meetend": meetend,
    "meetstart": meetstart,
    "bookid": bookid,
    "meetdate": meetdate,
    "mrm": mrm,
    "mproduct": mproduct,
    "meetstatus": meetstatus,
    "rate": rate,
  };

  @override
  // TODO: implement props
  List<Object?> get props => [
    tadvisorypk,
    bookid,
    meetend,
    meetstart,
    meetdate,
    mrm,
    mcust,
    mproduct,
    meetstatus,
    rate,
  ];
}

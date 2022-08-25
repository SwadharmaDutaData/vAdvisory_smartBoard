part of 'models.dart';

class AdvisoryModel extends Equatable {
  const AdvisoryModel(
      {this.tadvisorypk,
        this.mrm,
        this.mcust,
        this.mproduct,
        this.mbranch,
        this.meetstart,
        this.meetend,
        this.meetdate,
        this.bookid,
        this.meetstatus,
      });

  final int? tadvisorypk;
  final RmModel? mrm;
  final CustomerModel? mcust;
  final ProductModel? mproduct;
  final BranchModel? mbranch;
  final String? meetstart;
  final String? meetend;
  final String? meetdate;
  final String? bookid;
  final int? meetstatus;

  AdvisoryModel copyWith({
    int? tadvisorypk,
    RmModel? mrm,
    CustomerModel? mcust,
    ProductModel? mproduct,
    BranchModel? mbranch,
    String? meetstart,
    String? meetend,
    String? meetdate,
    String? bookid,
    int? meetstatus,
  }) =>
      AdvisoryModel(
        tadvisorypk: tadvisorypk ?? this.tadvisorypk,
        mrm: mrm ?? this.mrm,
        mcust: mcust ?? this.mcust,
        mbranch: mbranch ?? this.mbranch,
        meetstart: meetstart ?? this.meetstart,
        bookid: bookid ?? this.bookid,
        meetend: meetend ?? this.meetend,
        meetdate: meetdate ?? this.meetdate,
        mproduct: mproduct ?? this.mproduct,
        meetstatus: meetstatus ?? this.meetstatus,
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
    mbranch: json["mbranch"] != null
        ? BranchModel.fromJson(json["mbranch"])
        : null,
    mproduct: json["mproduct"] != null
        ? ProductModel.fromJson(json["mproduct"])
        : null,
    meetstatus: json['meetstatus'] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "tadvisorypk": tadvisorypk,
    "bookid": bookid,
    "meetend": meetend,
    "meetstart": meetstart,
    "bookid": bookid,
    "meetdate": meetdate,
    "mrm": mrm,
    "mbranch": mbranch,
    "mproduct": mproduct,
    "meetstatus": meetstatus,
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
    mbranch,
    mcust,
    mproduct,
    meetstatus,
  ];
}

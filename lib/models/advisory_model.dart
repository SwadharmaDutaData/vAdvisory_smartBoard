part of 'models.dart';

class AdvisoryModel extends Equatable {
  const AdvisoryModel(
      {
        this.tadvisorypk,
        this.mcust,
        this.mbranch,
        this.meetdate,
        this.bookid,
        this.meetstatus,
        this.rating
      });

  final int? tadvisorypk;
  final CustomerModel? mcust;
  final BranchModel? mbranch;
  final String? meetdate;
  final String? bookid;
  final int? meetstatus;
  final double? rating;

  AdvisoryModel copyWith({
    int? tadvisorypk,
    CustomerModel? mcust,
    BranchModel? mbranch,
    String? meetdate,
    String? bookid,
    int? meetstatus,
    double? rating
  }) =>
      AdvisoryModel(
        tadvisorypk: tadvisorypk ?? this.tadvisorypk,
        mcust: mcust ?? this.mcust,
        mbranch: mbranch ?? this.mbranch,
        bookid: bookid ?? this.bookid,
        meetdate: meetdate ?? this.meetdate,
        meetstatus: meetstatus ?? this.meetstatus,
        rating: rating ?? this.rating,
      );

  factory AdvisoryModel.fromJson(Map<String, dynamic> json) => AdvisoryModel(
    tadvisorypk: json['tadvisorypk'] ?? 0,
    bookid: json['bookid']?.trim() ?? '',
    meetdate: json['meetdate']?.trim() ?? '',
    mcust: json["mcust"] != null
        ? CustomerModel.fromJson(json["mcust"])
        : null,
    mbranch: json["mbranch"] != null
        ? BranchModel.fromJson(json["mbranch"])
        : null,
    meetstatus: json['meetstatus'] ?? 0,
    rating: json['rating'] ?? 0.0,
  );

  Map<String, dynamic> toJson() => {
    "bookid": bookid,
    "tadvisorypk": tadvisorypk,
    "rating": rating,
    "bookid": bookid,
    "meetdate": meetdate,
    "mbranch": mbranch,
    "meetstatus": meetstatus,
  };

  @override
  // TODO: implement props
  List<Object?> get props => [
    bookid,
    meetdate,
    tadvisorypk,
    mbranch,
    mcust,
    rating,
    meetstatus,
  ];
}

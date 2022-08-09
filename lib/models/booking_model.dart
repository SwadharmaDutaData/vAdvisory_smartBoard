part of 'models.dart';

class BookingModel extends Equatable {
  const BookingModel(
      {this.channelcode,
        this.tbookingpk,
        this.status,
        this.bookid,
        this.bookingdate,
        this.createddate,
        this.checkindate,
        this.counterno,
        this.mbranch,
        this.mcust,
        this.mproduct});

  final String? channelcode;
  final int? tbookingpk;
  final CustomerModel? mcust;
  final BranchModel? mbranch;
  final ProductModel? mproduct;
  final String? bookid;
  final String? counterno;
  final int? status;
  final DateTime? bookingdate;
  final String? checkindate;
  final String? createddate;

  BookingModel copyWith({
    String? channelcode,
    int? tbookingpk,
    CustomerModel? mcust,
    BranchModel? mbranch,
    ProductModel? mproduct,
    String? bookid,
    String? counterno,
    int? status,
    DateTime? bookingdate,
    String? checkindate,
    String? createddate,
  }) =>
      BookingModel(
          channelcode: channelcode ?? this.channelcode,
          tbookingpk: tbookingpk ?? this.tbookingpk,
          status: status ?? this.status,
          bookid: bookid ?? this.bookid,
          bookingdate: bookingdate ?? this.bookingdate,
          checkindate: checkindate ?? this.checkindate,
          createddate: createddate ?? this.createddate,
          counterno: counterno ?? this.counterno,
          mbranch: mbranch ?? this.mbranch,
          mcust: mcust ?? this.mcust,
          mproduct: mproduct ?? this.mproduct);

  factory BookingModel.fromJson(Map<String, dynamic> json) => BookingModel(
    channelcode: json['channelcode']?.trim() ?? '',
    tbookingpk: json['tbookingpk'] ?? 0,
    status: json['status'] ?? 0,
    bookid: json['bookid']?.trim() ?? '',
    bookingdate: (json['bookingdate'] != null)
        ? DateTime.parse(json["bookingdate"])
        : null,
    checkindate: json['checkindate']?.trim() ?? '',
    createddate: json['createddate']?.trim() ?? '',
    counterno: json['counterno']?.trim() ?? '',
    mbranch: json["mbranch"] != null
        ? BranchModel.fromJson(json["mbranch"])
        : null,
    mcust: json["mcust"] != null
        ? CustomerModel.fromJson(json["mcust"])
        : null,
    mproduct: json["mproduct"] != null
        ? ProductModel.fromJson(json["mproduct"])
        : null,
  );

  Map<String, dynamic> toJson() => {
    "channelcode": channelcode,
    "tbookingpk": tbookingpk,
    "status": status,
    "bookid": bookid,
    "bookingdate": bookingdate,
    "checkindate": checkindate,
    "createddate": createddate,
    "counterno": counterno,
    "mbranch": mbranch,
    "mcust": mcust,
    "mproduct": mproduct,
  };

  @override
  // TODO: implement props
  List<Object?> get props => [
    channelcode,
    tbookingpk,
    status,
    bookid,
    bookingdate,
    checkindate,
    createddate,
    counterno,
    mbranch,
    mcust,
    mproduct
  ];
}

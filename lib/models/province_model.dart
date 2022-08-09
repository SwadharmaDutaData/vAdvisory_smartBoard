part of 'models.dart';

class ProvinceModel extends Equatable {
  const ProvinceModel({this.mprovincepk, this.provname, this.provcode});

  final int? mprovincepk;
  final String? provname;
  final String? provcode;

  ProvinceModel copyWith({
    int? mprovincepk,
    String? provname,
    String? provcode,
  }) =>
      ProvinceModel(
        mprovincepk: mprovincepk ?? this.mprovincepk,
        provname: provname ?? this.provname,
        provcode: provcode ?? this.provcode,
      );

  factory ProvinceModel.fromJson(Map<String, dynamic> json) => ProvinceModel(
    mprovincepk: json["mprovincepk"] ?? 0,
    provname: json["provname"]?.trim() ?? '',
    provcode: json["provcode"]?.trim() ?? '',
  );

  Map<String, dynamic> toJson() => {
    "mprovincepk": mprovincepk,
    "provname": provname,
    "provcode": provcode,
  };

  @override
  // TODO: implement props
  List<Object?> get props => [
    mprovincepk,
    provname,
    provcode,
  ];
}
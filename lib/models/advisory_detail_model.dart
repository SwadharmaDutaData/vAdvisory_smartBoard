part of 'models.dart';

class AdvisoryDetailModel extends Equatable {
  const AdvisoryDetailModel({
    this.mrmList,
    this.mcust,
    this.mproduct,
    this.mproductList,
    this.link,
    this.mbranch,
  });

  final CustomerModel? mcust;
  final List<RmModel>? mrmList;
  final ProductModel? mproduct;
  final List<ProductModel>? mproductList;
  final String? link;
  final BranchModel? mbranch;

  AdvisoryDetailModel copyWith({
    CustomerModel? mcust,
    List<RmModel>? mrmList,
    ProductModel? mproduct,
    List<ProductModel>? mproductList,
    String? link,
    BranchModel? mbranch,
  }) =>
      AdvisoryDetailModel(
          mcust: mcust ?? this.mcust,
          mrmList: mrmList ?? this.mrmList,
          mproductList: mproductList ?? this.mproductList,
          mproduct: mproduct ?? this.mproduct,
          link: link ?? this.link,
        mbranch: mbranch ?? this.mbranch,
      );

  factory AdvisoryDetailModel.fromJson(Map<String, dynamic> json) =>
      AdvisoryDetailModel(
        mcust: json["mcust"] != null
            ? CustomerModel.fromJson(json["mcust"])
            : null,
        mrmList: List<RmModel>.from(
            json['mrmList'].map((model) => RmModel.fromJson(model))),
        mproduct: json["mproduct"] != null
            ? ProductModel.fromJson(json["mproduct"])
            : null,
        mproductList: List<ProductModel>.from(
            json['mproductList'].map((model) => ProductModel.fromJson(model))),
        link: json['link']?.trim() ?? '',
        mbranch: json["mbranch"] != null
            ? BranchModel.fromJson(json["mbranch"])
            : null,
      );

  Map<String, dynamic> toJson() => {
        "mproductList": mproductList,
        "mrmList": mrmList,
        "mcust": mcust,
        "mproduct": mproduct,
        "link": link,
        "mbranch": mbranch,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [
        mcust,
        mrmList,
        mproduct,
        mproductList,
        link,
    mbranch,
      ];
}

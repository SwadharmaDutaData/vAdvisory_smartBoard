part of 'models.dart';

class ProductModel extends Equatable {
  const ProductModel(
      {this.mproductpk,
        this.productcode,
        this.productname,
        this.productdesc,
        this.lastupdated,
        this.updatedby,
        this.link,
        this.icon});

  final int? mproductpk;
  final String? productcode;
  final String? productname;
  final String? productdesc;
  final String? lastupdated;
  final String? updatedby;
  final String? link;
  final String? icon;

  ProductModel copyWith({
    int? mproductpk,
    String? productcode,
    String? productname,
    String? productdesc,
    String? lastupdated,
    String? updatedby,
    String? link,
    String? icon,
  }) =>
      ProductModel(
        mproductpk: mproductpk ?? this.mproductpk,
        productcode: productcode ?? this.productcode,
        productname: productname ?? this.productname,
        productdesc: productdesc ?? this.productdesc,
        lastupdated: lastupdated ?? this.lastupdated,
        updatedby: updatedby ?? this.updatedby,
        link: link ?? this.link,
        icon: icon ?? this.icon,
      );

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    mproductpk: json['mproductpk'] ?? 0,
    productcode: json['productcode']?.trim() ?? '',
    productname: json['productname']?.trim() ?? '',
    productdesc: json['productdesc']?.trim() ?? '',
    lastupdated: json['lastupdated']?.trim() ?? '',
    updatedby: json['updatedby']?.trim() ?? '',
    link: json['link']?.trim() ?? '',
    icon: json['icon']?.trim() ?? '',
  );

  Map<String, dynamic> toJson() => {
    "mproductpk": mproductpk,
    "productcode": productcode,
    "productname": productname,
    "productdesc": productdesc,
    "lastupdated": lastupdated,
    "updatedby": updatedby,
    "link": link,
    "icon": icon,
  };

  @override
  // TODO: implement props
  List<Object?> get props => [
    mproductpk!,
    productcode!,
    productname!,
    productdesc!,
    lastupdated!,
    updatedby!,
    link!,
    icon!,
  ];
}

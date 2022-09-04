part of 'models.dart';

class ProductModel extends Equatable {
  const ProductModel({
    this.mproductpk,
    this.productcode,
    this.productname,
    this.productdesc,
    this.lastupdated,
    this.updatedby,
    this.link,
    this.icon,
    this.iconurl,
  });

  final int? mproductpk;
  final String? productcode;
  final String? productname;
  final String? productdesc;
  final String? lastupdated;
  final String? updatedby;
  final String? link;
  final String? icon;
  final String? iconurl;

  ProductModel copyWith({
    int? mproductpk,
    String? productcode,
    String? productname,
    String? productdesc,
    String? lastupdated,
    String? updatedby,
    String? link,
    String? icon,
    String? iconurl,
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
        iconurl: iconurl ?? this.iconurl,
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
    iconurl: json['iconurl']?.trim() ?? '',
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
    "iconurl": iconurl,
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
    iconurl!,
  ];
}

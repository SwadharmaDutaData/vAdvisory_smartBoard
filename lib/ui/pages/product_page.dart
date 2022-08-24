part of 'pages.dart';

class ProductPage extends StatefulWidget {
  final String? link;
  final CustomerModel? customer;
  final AdvisoryDetailModel? advisoryDetail;

  const ProductPage({Key? key, this.link, this.customer, this.advisoryDetail})
      : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    Uint8List imgByte = base64Decode(widget.customer!.imagedata!);
    Size size = MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
          padding: EdgeInsets.all(Sizes.dimen_24.w.toDouble()),
          width: double.infinity,
          height: size.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(SharedImage.background),
                  fit: BoxFit.cover)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/images/logo.png',
                            height: size.height.h.toDouble() * 0.1,
                          ),
                          SizedBox(
                            height: Sizes.dimen_16.h.toDouble(),
                          ),
                          Text(
                            'Daftar Produk Tersedia :',
                            style: primaryTextFont.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: Sizes.dimen_24.sp.toDouble()),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: Sizes.dimen_8.w.toDouble(),),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    AutoSizeText(
                                      widget.customer!.custname!.capitalize!,
                                      presetFontSizes: [Sizes.dimen_24.sp.toDouble(), Sizes.dimen_18.sp.toDouble(), Sizes.dimen_16.sp.toDouble()],
                                      maxLines: 2,
                                      textAlign: TextAlign.end,
                                      overflow: TextOverflow.ellipsis,
                                      style: primaryTextFont.copyWith(
                                          color: mainColor,
                                          fontWeight: FontWeight.w600,),
                                    ),
                                    Text(
                                      'Nasabah Prioritas',
                                      textAlign: TextAlign.end,
                                      style: primaryTextFont.copyWith(
                                          color: darkGrey,
                                          fontSize: Sizes.dimen_16.sp.toDouble()),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: Sizes.dimen_16.w.toDouble(),
                              ),
                              Expanded(
                                flex: 1,
                                child: CircleAvatar(
                                  backgroundColor: widget.customer!.imagedata != '' ? Colors.white : borderGrey,
                                  backgroundImage: widget.customer!.imagedata != ''
                                      ? MemoryImage(imgByte)
                                      : const AssetImage(SharedImage.avatar)
                                          as ImageProvider,
                                  radius: size.height.h.toDouble() * 0.04,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: Sizes.dimen_8.h.toDouble(),
                          ),
                          InkWell(
                            onTap: () {
                              showSearch(
                                  context: context,
                                  delegate: ItemSearchDelegate(
                                      customer: widget.advisoryDetail!.mcust!,
                                      item: widget.advisoryDetail,
                                      productList:
                                          widget.advisoryDetail!.mproductList));
                            },
                            child: Container(
                              width: size.width * 0.13,
                              padding: EdgeInsets.symmetric(
                                  horizontal: Sizes.dimen_24.w.toDouble(),
                                  vertical: Sizes.dimen_8.h.toDouble()),
                              decoration: const BoxDecoration(
                                  color: Colors.white60,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(Sizes.dimen_12),
                                    bottomLeft: Radius.circular(Sizes.dimen_12),
                                  )),
                              child: Row(
                                children: [
                                  Text(
                                    SharedString.searchProduct,
                                    style: primaryTextFont.copyWith(
                                        fontSize: Sizes.dimen_14.sp.toDouble(),
                                        color: secondaryColor,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(
                                    width: Sizes.dimen_8.w.toDouble(),
                                  ),
                                  Icon(
                                    Icons.search,
                                    size: MediaQuery.of(context)
                                            .size
                                            .height
                                            .h
                                            .toDouble() *
                                        0.03,
                                    color: secondaryColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: Sizes.dimen_16.h.toDouble(),
                ),
                Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: Sizes.dimen_8.w.toDouble()),
                    width: double.infinity,
                    height: size.height.h.toDouble() * 0.45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Sizes.dimen_8),
                      color: Colors.black45,
                    ),
                    child: Center(
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: List.generate(
                            widget.advisoryDetail!.mproductList!.length, (index) {
                          return widget.advisoryDetail!.mproductList!.isNotEmpty
                              ? ProductCardWidget(
                                  onClick: () async {
                                    try {
                                      await context.read<RmCubit>().getRmById(
                                          widget.advisoryDetail!
                                              .mproductList![index].mproductpk!);
                                      RmState state =
                                          context.read<RmCubit>().state;
                                      if (state is RmLoaded) {
                                        Get.to(ProductDetailPage(
                                          productName: widget.advisoryDetail!
                                              .mproductList![index].productname!,
                                          item: widget.advisoryDetail!,
                                          customer: widget.advisoryDetail!.mcust,
                                          productDesc: widget.advisoryDetail!
                                              .mproductList![index].productdesc!,
                                          rmList: state.rmList,
                                          productPk: widget.advisoryDetail!
                                              .mproductList![index].mproductpk,
                                        ));
                                      } else {
                                        print('rm failed');
                                      }
                                    } catch (e) {
                                      //connection
                                      print(e);
                                    }
                                  },
                                  item:
                                      widget.advisoryDetail!.mproductList![index])
                              : Center(
                                  child: Text(
                                    'No Data',
                                    style: primaryTextFont.copyWith(
                                        color: Colors.white),
                                  ),
                                );
                        }),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ItemSearchDelegate extends SearchDelegate {
  CustomerModel? customer;
  AdvisoryDetailModel? item;
  List<ProductModel>? productList;

  ItemSearchDelegate({this.item, this.customer, this.productList});

  @override
  String get searchFieldLabel => SharedString.searchProduct;

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
            onPressed: () {
              if (query.isEmpty) {
                close(context, null);
              } else {
                query = '';
              }
            },
            icon: Icon(Icons.clear))
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
      onPressed: () => close(context, null), icon: Icon(Icons.arrow_back));

  @override
  Widget buildResults(BuildContext context) => Center();

  @override
  Widget buildSuggestions(BuildContext context) {
    List<ProductModel> list;
    final matching = productList!.where((station) {
      return station.productname!.toLowerCase() == query.toLowerCase();
    }).toList();
    print('${matching.length}');
    if (matching.length > 0) {
      list = matching;
    } else {
      list = productList!.where((station) {
        return station.productname!
                .toLowerCase()
                .contains(query.toLowerCase()) ||
            station.productname!.toLowerCase().contains(query.toLowerCase());
      }).toList();
    }

    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          String productName = productList![index].productname!;
          String productDesc = productList![index].productdesc!;
          String productIcon = productList![index].icon!;
          Uint8List imgByte = base64Decode(productIcon);

          return ListTile(
            leading: productIcon != ''
                ? Image.memory(
                    imgByte,
                    height: Sizes.dimen_24.h.toDouble(),
                  )
                : Image.asset(
                    'assets/images/produk_bni.png',
                    height: Sizes.dimen_24.h.toDouble(),
                  ),
            title: Text(
              productName,
              style: primaryTextFont.copyWith(
                  fontSize: Sizes.dimen_14.sp.toDouble(), color: darkGrey),
            ),
            onTap: () async {
              await context
                  .read<RmCubit>()
                  .getRmById(productList![index].mproductpk!);
              List<RmModel> rmList =
                  (context.read<RmCubit>().state as RmLoaded).rmList;
              query = productName;
              Get.to(ProductDetailPage(
                productName: productName,
                item: item,
                customer: customer,
                productDesc: productDesc,
                rmList: rmList,
              ));
              showResults(context);
            },
          );
        });
  }
}

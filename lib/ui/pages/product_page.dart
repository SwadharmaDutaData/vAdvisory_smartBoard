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
          padding: EdgeInsets.all(Sizes.dimen_24),
          width: double.infinity,
          height: size.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(SharedImage.background),
                  fit: BoxFit.cover)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        height: size.height * 0.15,
                      ),
                      const SizedBox(
                        height: Sizes.dimen_16,
                      ),
                      Text(
                        'Virtual Advisory',
                        style: primaryTextFont.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: Sizes.dimen_24),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                widget.customer!.custname!.capitalize!,
                                textAlign: TextAlign.end,
                                style: primaryTextFont.copyWith(
                                    color: mainColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: Sizes.dimen_24),
                              ),
                              Text(
                                'Nasabah Prioritas',
                                textAlign: TextAlign.end,
                                style: primaryTextFont.copyWith(
                                    color: darkGrey, fontSize: Sizes.dimen_18),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: Sizes.dimen_8,
                          ),
                          CircleAvatar(
                            backgroundImage: widget.customer!.imagedata != ''
                                ? MemoryImage(imgByte)
                                : const AssetImage('assets/images/avatar.jpg')
                                    as ImageProvider,
                            radius: size.height * 0.05,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: Sizes.dimen_8,
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: Sizes.dimen_24,
                              vertical: Sizes.dimen_8),
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
                                  fontSize: Sizes.dimen_18,
                                    color: secondaryColor,
                                    fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(
                                width: Sizes.dimen_8,
                              ),
                              Icon(
                                Icons.search,
                                size: MediaQuery.of(context).size.height * 0.04,
                                color: secondaryColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: Sizes.dimen_16,
              ),
              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: Sizes.dimen_8),
                  width: double.infinity,
                  height: size.height * 0.55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Sizes.dimen_8),
                    color: Colors.black45,
                  ),
                  child:
                  Center(
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
                                    SharedDialog.errorSnackBar(
                                        SharedString.failed, e.toString());
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
                  )


                  // Padding(
                  //     padding: const EdgeInsets.all(Sizes.dimen_16),
                  //     child: widget.advisoryDetail!.mproductList!.isNotEmpty
                  //     ?
                  //     GridView.count(
                  //         mainAxisSpacing: Sizes.dimen_32,
                  //         crossAxisSpacing: Sizes.dimen_16,
                  //         scrollDirection: Axis.horizontal,
                  //         crossAxisCount: 2,
                  //         children: List.generate (
                  //             widget.advisoryDetail!.mproductList!.length, (index) {
                  //           return ProductCardWidget(
                  //               onClick: () async{
                  //                 try {
                  //                   await context.read<RmCubit>().getRmById(widget.advisoryDetail!.mproductList![index].mproductpk!);
                  //                   RmState state = context.read<RmCubit>().state;
                  //                   if (state is RmLoaded){
                  //                     Get.to(
                  //                         ProductDetailPage(
                  //                                 productName: widget.advisoryDetail!.mproductList![index]
                  //                                     .productname!,
                  //                                 item: widget.advisoryDetail!,
                  //                                 customer: widget.advisoryDetail!.mcust,
                  //                                 productDesc: widget.advisoryDetail!.mproductList![index]
                  //                                     .productdesc!,
                  //                                 rmList: state.rmList,
                  //                           productPk: widget.advisoryDetail!.mproductList![index].mproductpk,
                  //                               )
                  //                     );
                  //                   } else {
                  //                     print('rm failed');
                  //                   }
                  //                 } catch (e) {
                  //                   //connection
                  //                   SharedDialog.errorSnackBar(SharedString.failed, e.toString());
                  //                 }
                  //               },
                  //               item: widget.advisoryDetail!.mproductList![index]);
                  //         }),
                  //       )
                  //         : Center(
                  //       child: Text(
                  //         'No Data',
                  //         style: primaryTextFont.copyWith(
                  //             color: Colors.white),
                  //       ),
                  //     )
                  // ),
                  )
            ],
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
  Widget buildResults(BuildContext context) => Center(
        child: Text(
          query,
          style: primaryTextFont,
        ),
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    List<ProductModel> list = productList!.where((searchResult) {
      final result = searchResult.toString();
      final input = query.toLowerCase();

      return result.contains(input);
    }).toList();

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
                    height: Sizes.dimen_24,
                  )
                : Image.asset(
                    'assets/images/produk_bni.png',
                    height: Sizes.dimen_24,
                  ),
            title: Text(
              productName,
              style: primaryTextFont.copyWith(color: darkGrey),
            ),
            // shape: RoundedRectangleBorder(
            //   side: BorderSide(color: secondaryColor, width: 0.3),
            // ),
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

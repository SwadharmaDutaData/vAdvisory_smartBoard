part of 'pages.dart';

class ProductDetailPage extends StatefulWidget {
  final String? productName;
  final String? productDesc;
  final AdvisoryDetailModel? item;
  final CustomerModel? customer;
  List<RmModel>? rmList = [];
  final int? productPk;

  ProductDetailPage(
      {Key? key,
      this.productName,
      this.productDesc,
      this.customer,
      this.item,
      this.rmList,
      this.productPk})
      : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {

  Future<dynamic> _refreshStatus(BuildContext context) async {
    try {
      await context.read<RmCubit>().getRmById(widget.productPk!);
      List<RmModel> rmLists = (context.read<RmCubit>().state as RmLoaded).rmList;

      setState(() {
        widget.rmList = rmLists;
      });

    } catch (e) {
      print('booking with specific product');
    }
  }

  @override
  Widget build(BuildContext context) {
    Stream<dynamic> refreshStatus() => Stream.periodic(const Duration(seconds: 5))
        .asyncMap((_) => _refreshStatus(context));

    Size size = MediaQuery.of(context).size;
    Uint8List imgByte = base64Decode(widget.customer!.imagedata!);
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
                              SizedBox(height: Sizes.dimen_8.h.toDouble(),),
                              Text(
                                'PRODUK ${widget.productName!}',
                                style: primaryTextFont.copyWith(
                                    color: mainColor,
                                    fontWeight: FontWeight.w700,
                                    fontSize: Sizes.dimen_22.sp.toDouble()),
                              ),
                              SizedBox(height: Sizes.dimen_8.h.toDouble(),),
                              Text(
                                'Deskripsi produk : ${widget.productDesc!.capitalizeFirst}',
                                style: primaryTextFont.copyWith(fontSize: Sizes.dimen_16.sp.toDouble()),
                              )
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
                                              color: darkGrey, fontSize: Sizes.dimen_16.sp.toDouble()),
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
                                      delegate: _ItemSearchDelegate(
                                          customer: widget.customer,
                                          link: widget.item!.link,
                                      rmList: widget.rmList));
                                },
                                child: Container(
                                  width: size.width * 0.13,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: Sizes.dimen_16.w.toDouble(),
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
                                        SharedString.searchRm,
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
                                        size: MediaQuery.of(context).size.height.h.toDouble() *
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
                        padding:
                            EdgeInsets.symmetric(horizontal: Sizes.dimen_8.w.toDouble()),
                        width: double.infinity,
                        height: size.height.h.toDouble() * 0.43,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Sizes.dimen_8),
                          color: Colors.black45,
                        ),
                        child:
                        StreamBuilder(
                          initialData: widget.rmList,
                          stream: refreshStatus(),
                          builder: (context, snapshot){
                            if (snapshot.hasError) {
                              return const Center(child: Text('Some error occurred!'));
                            } else {
                              return
                                Center(
                                child: ListView(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  children: List.generate(widget.rmList!.length, (index) {
                                    return widget.rmList!.isNotEmpty
                                        ? InkWell(
                                            onTap: widget.rmList![index].rmstatus == 1
                                              ?  () {
                                              Get.to(DetailRmPage(
                                                  item: widget.rmList![index],
                                                  link: widget.item!.link.toString(),
                                                  customer: widget.customer));
                                            } : () {},
                                            child: RmCardWidget(
                                              item: widget.rmList![index],
                                            ),
                                          )
                                        : Center(
                                            child: Text(
                                              'No Data',
                                              style: primaryTextFont.copyWith(
                                                  color: Colors.white),
                                            ),
                                          );
                                  }),
                                ),
                              );
                            }
                          },
                        )

                        ),
                    SizedBox(height: Sizes.dimen_8.h.toDouble(),),
                    ElevatedButton(
                      onPressed: () => Get.back(),
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty
                            .resolveWith((states) {
                          return Colors.white70;
                        }),),
                      child: Padding(padding: EdgeInsets.symmetric(vertical: Sizes.dimen_12.h.toDouble(), horizontal: Sizes.dimen_12.w.toDouble()),child: Text('Back', style: primaryTextFont.copyWith(fontSize: Sizes.dimen_24.sp.toDouble(), color: mainColor, fontWeight: FontWeight.w600),)),
                    ),
                  ],
                ),
            ),
            ),
      ),
    );
  }
}

class _ItemSearchDelegate extends SearchDelegate {
  CustomerModel? customer;
  String? link;
  List<RmModel>? rmList;

  _ItemSearchDelegate({this.link, this.customer, this.rmList});

  @override
  String get searchFieldLabel => SharedString.searchRm;

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
      onPressed: () => close(context, null), icon: Icon(Icons.arrow_back, size: defaultMargin,));

  @override
  Widget buildResults(BuildContext context) => Center(
        child: Text(
          query,
          style: primaryTextFont,
        ),
      );

  @override
  Widget buildSuggestions(BuildContext context) {
    List<RmModel> list = rmList!.where((searchResult) {
      final result = searchResult.toString();
      final input = query.toLowerCase();

      return result.contains(input);
    }).toList();

    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          String rmName = rmList![index].rmname!;

          return ListTile(
            leading: Image.asset(
              'assets/images/rm_icon.png',
              height: Sizes.dimen_24.h.toDouble(),
              color: secondaryColor,
            ),
            title: Text(
              rmName,
              style: primaryTextFont.copyWith(color: darkGrey, fontSize: Sizes.dimen_14.sp.toDouble()),
            ),
            subtitle:
            Row(
              children: [
                Icon(Icons.circle, size: Sizes.dimen_6.sp.toDouble(), color: rmList![index].rmstatus! == 1
                    ? successColor
                    : rmList![index].rmstatus! == 2
                    ? Colors.amber
                    : errorColor,),
                SizedBox(width: Sizes.dimen_4.w.toDouble(),),
                AutoSizeText(
                    rmList![index].rmstatus! == 1
                        ? 'Available'
                        : rmList![index].rmstatus! == 2
                        ? 'Busy'
                        : 'Offline',
                    maxLines: 1,
                    style: primaryTextFont.copyWith(color: darkGrey, fontSize: Sizes.dimen_12.sp.toDouble())),
              ],
            ),
            // shape: RoundedRectangleBorder(
            //   side: BorderSide(color: borderGrey, width: 1),
            // ),
            onTap: rmList![index].rmstatus == 1 ? () {
              query = rmName;
              Get.to(DetailRmPage(
                  item: rmList![index], link: link, customer: customer));
              showResults(context);
            } : (){},
          );
        });
  }
}

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
                          SizedBox(height: Sizes.dimen_8,),
                          Text(
                            'PRODUK ${widget.productName!}',
                            style: primaryTextFont.copyWith(
                                color: mainColor,
                                fontWeight: FontWeight.w700,
                                fontSize: Sizes.dimen_18),
                          ),
                          SizedBox(height: Sizes.dimen_8,),
                          Text(
                            'Deskripsi produk : ${widget.productDesc!.capitalize}',
                            style: primaryTextFont.copyWith(fontSize: Sizes.dimen_16),
                          )
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
                                  delegate: _ItemSearchDelegate(
                                      customer: widget.customer,
                                      link: widget.item!.link,
                                  rmList: widget.rmList));
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: Sizes.dimen_16,
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
                                    SharedString.searchRm,
                                    style: primaryTextFont.copyWith(
                                        color: secondaryColor,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(
                                    width: Sizes.dimen_16,
                                  ),
                                  Icon(
                                    Icons.search,
                                    size: MediaQuery.of(context).size.height *
                                        0.05,
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
                  ElevatedButton(
                    onPressed: () => Get.back(),
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty
                          .resolveWith((states) {
                        return Colors.white70;
                      }),),
                    child: Text('Back', style: primaryTextFont.copyWith(fontSize: Sizes.dimen_18, color: mainColor, fontWeight: FontWeight.w600),),
                  ),
                ],
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
              height: Sizes.dimen_24,
              color: secondaryColor,
            ),
            title: Text(
              rmName,
              style: primaryTextFont.copyWith(color: darkGrey),
            ),
            subtitle:
            Row(
              children: [
                Icon(Icons.circle, size: 5, color: rmList![index].rmstatus! == 1
                    ? successColor
                    : rmList![index].rmstatus! == 2
                    ? Colors.amber
                    : errorColor,),
                const SizedBox(width: Sizes.dimen_4,),
                AutoSizeText(
                    rmList![index].rmstatus! == 1
                        ? 'Available'
                        : rmList![index].rmstatus! == 2
                        ? 'Busy'
                        : 'Offline',
                    maxLines: 1,
                    style: primaryTextFont.copyWith(color: darkGrey, fontSize: Sizes.dimen_12)),
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

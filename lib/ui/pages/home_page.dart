part of 'pages.dart';

class HomePage extends StatefulWidget {
  bool? isDone;
  BranchModel? branch;
  HomePage({Key? key, this.isDone=false, this.branch}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AdvisoryDetailModel? advisoryDetail;
  String? message;
  int value = 0;
  final _storage = LocalStorage();
  String deviceIds = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    reLogin();
    // Timer(Duration(seconds: 10), (){
    //   setState(() {
    //     widget.isDone = false;
    //     log('isDone updated ? => ${widget.isDone}');
    //   });
    // });
    // log('isDone ? => ${widget.isDone}');
  }

  void reLogin() async {
    String isRegistered = await _storage.readValue('isRegistered');
    String deviceId = await _storage.readValue('deviceid');
    setState(() {
      deviceIds = deviceId;
    });
    log('device: $deviceId isRegistered: $isRegistered');
  }

  Future<dynamic> _boardNotification(
      BuildContext context, String? deviceid) async {
    try {
      await context.read<AdvisoryDetailCubit>().getBoardNotification(deviceid!);
      AdvisoryDetailState state = context.read<AdvisoryDetailCubit>().state;

      if (state is AdvisoryDetailLoaded) {
        setState(() {
          advisoryDetail = state.advisoryDetail;
          print('datanyabro === $advisoryDetail');
        });
      } else {
        print('no check in');
      }
      return advisoryDetail;
    } catch (e) {
      debugPrint(e.toString());
      return e;
    }
  }

  @override
  Widget build(BuildContext context) {
    Stream<dynamic> getNotifBoard() =>
        Stream.periodic(const Duration(seconds: 5))
            .asyncMap((_) => _boardNotification(context, deviceIds));
    Size size = MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
            width: double.infinity,
            height: size.height,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(SharedImage.introBackground),
                    fit: BoxFit.cover)),
            child: StreamBuilder<dynamic>(
              initialData: advisoryDetail,
              stream: getNotifBoard(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(child: Text('Some error occurred!'));
                } else {
                  return widget.isDone == true ?
                  Padding(
                    padding: EdgeInsets.only(right: Sizes.dimen_100.w.toDouble()),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          SharedString.thanks,
                          style: primaryTextFont.copyWith(
                              color: mainColor,
                              fontWeight: FontWeight.w600,
                              fontSize: Sizes.dimen_64.sp.toDouble()),
                        ),
                      ],
                    ),
                  )
                    : advisoryDetail != null
                    ? Padding(
                    padding: EdgeInsets.only(right: Sizes.dimen_64.w.toDouble()),
                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                              'Selamat Datang Nasabah Prioritas\n${advisoryDetail!.mcust!.custname!.capitalize}',
                              style: primaryTextFont.copyWith(
                                  color: secondaryColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: Sizes.dimen_40.sp.toDouble()),
                            ),
                          ElevatedButton(
                            onPressed: () {
                              ProductModel? product = advisoryDetail!.mproduct;
                              CustomerModel? customer = advisoryDetail!.mcust!;
                              List<RmModel>? rmList = advisoryDetail!.mrmList!;
                              log('check branch ${widget.branch}');
                              product != null
                                  ? Get.offAll(ProductDetailPage(
                                productName: product.productname,
                                productDesc: product.productdesc,
                                customer: customer,
                                item: advisoryDetail,
                                rmList: rmList,
                                productPk: product.mproductpk,
                                branch: widget.branch,
                              ))
                                  : Get.offAll(ProductPage(
                                customer: customer,
                                advisoryDetail: advisoryDetail,
                                link: advisoryDetail!.link,
                                branch: widget.branch,
                              ));
                            },
                            style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty
                                  .resolveWith((states) {
                                return secondaryColor;
                              }),),
                            child: Padding(
                              padding: const EdgeInsets.all(Sizes.dimen_12),
                              child: Text('Continue', style: primaryTextFont.copyWith(fontSize: Sizes.dimen_20.sp.toDouble(), color: Colors.white, fontWeight: FontWeight.w600),),
                            ),
                          ),
                        ],
                      ),
                    )
                      : Container(
                    margin: EdgeInsets.only(right: Sizes.dimen_24.w.toDouble()),
                    alignment: Alignment.centerRight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Image.asset('assets/images/logo.png', height: size.height.h.toDouble() * 0.25,),
                        Text('Virtual Advisory', textAlign: TextAlign.end, style: primaryTextFont.copyWith(fontSize: Sizes.dimen_48.sp.toDouble(), color: mainColor, fontWeight: FontWeight.w700),)
                      ],
                    )
                  );
                }
              },
            )),
      ),
    );
  }
}

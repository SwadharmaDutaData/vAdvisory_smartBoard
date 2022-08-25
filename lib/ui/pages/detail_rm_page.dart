part of 'pages.dart';

class DetailRmPage extends StatefulWidget {
  final String? link;
  final BranchModel? branch;
  final RmModel? item;
  final CustomerModel? customer;
  const DetailRmPage({Key? key, this.branch, this.link, this.item, this.customer,}) : super(key: key);

  @override
  _DetailRmPageState createState() => _DetailRmPageState();
}

class _DetailRmPageState extends State<DetailRmPage> {
  double rating = 0;
  final serverText = TextEditingController();
  TextEditingController? roomText;
  TextEditingController? subjectText;
  TextEditingController? nameText;
  // MemoryImage? avatarUrl;
  TextEditingController? emailText;
  TextEditingController? iosAppBarRGBAColor; //transparent blue
  bool? isAudioOnly = false;
  bool? isAudioMuted = false;
  bool? isVideoMuted = false;

  bool? _isLoading;

  @override
  void initState() {
    roomText = TextEditingController(text: widget.link!.substring(20, 29));
    emailText = TextEditingController(text: widget.customer!.email);
    // avatarUrl = MemoryImage(imgByte);
    subjectText = TextEditingController(text: "${widget.link!.substring(20, 29)}/${widget.item!.mproduct!.productname}");
    nameText = TextEditingController(text: widget.customer!.custname);
    iosAppBarRGBAColor = TextEditingController(text: mainColor.toString());
    _isLoading = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Uint8List imgByte = base64Decode(widget.item!.imagedata!);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
          width: double.infinity,
          height: size.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(SharedImage.background),
                  fit: BoxFit.cover)),
          child: Padding(
            padding: const EdgeInsets.all(defaultMargin),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: size.height.h.toDouble() * 0.12,
                ),
                SizedBox(
                  height: Sizes.dimen_16.h.toDouble(),
                ),
                SingleChildScrollView(
                  child: Container(
                      padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_18.w.toDouble(), vertical: Sizes.dimen_18.h.toDouble()),
                      margin: EdgeInsets.symmetric(horizontal: defaultMargin.w.toDouble()),
                      width: double.infinity,
                      height: size.height.h.toDouble() * 0.5,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Sizes.dimen_8),
                        color: Colors.white70,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: widget.item!.imagedata != null
                                  ? Image.memory(imgByte)
                                  : Image.asset(SharedImage.avatar)),
                          SizedBox(width: Sizes.dimen_16.w.toDouble(),),
                          Expanded(
                              flex: 2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${widget.item!.rmname}', style: primaryTextFont.copyWith(color: mainColor, fontSize: Sizes.dimen_36.sp.toDouble(), fontWeight: FontWeight.w700),),
                                  SizedBox(height: Sizes.dimen_8.h.toDouble(),),
                                  Text('RM ${widget.item!.mproduct!.productname}', style: primaryTextFont.copyWith(color: secondaryColor, fontSize: Sizes.dimen_24.sp.toDouble(), fontWeight: FontWeight.w600),),
                                  SizedBox(height: Sizes.dimen_8.h.toDouble(),),
                                  Expanded(
                                    flex: 4,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('E-mail', style: primaryTextFont.copyWith(color: Colors.black, fontSize: Sizes.dimen_18.sp.toDouble(), fontWeight: FontWeight.w600),),
                                              SizedBox(height: Sizes.dimen_8.h.toDouble(),),
                                              Text('No.Hp', style: primaryTextFont.copyWith(color: Colors.black, fontSize: Sizes.dimen_18.sp.toDouble(), fontWeight: FontWeight.w600),),
                                              SizedBox(height: Sizes.dimen_8.h.toDouble(),),
                                              Text('Cabang', style: primaryTextFont.copyWith(color: Colors.black, fontSize: Sizes.dimen_18.sp.toDouble(), fontWeight: FontWeight.w600),),
                                              SizedBox(height: Sizes.dimen_8.h.toDouble(),),
                                              Text('Alamat', style: primaryTextFont.copyWith(color: Colors.black, fontSize: Sizes.dimen_18.sp.toDouble(), fontWeight: FontWeight.w600),),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 4,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(': ${widget.item!.email}', style: primaryTextFont.copyWith(color: darkGrey, fontSize: Sizes.dimen_18.sp.toDouble(), fontWeight: FontWeight.w600),),
                                              SizedBox(height: Sizes.dimen_8.h.toDouble(),),
                                              Text(': ${widget.item!.nohp}', style: primaryTextFont.copyWith(color: darkGrey, fontSize: Sizes.dimen_18.sp.toDouble(), fontWeight: FontWeight.w600),),
                                              SizedBox(height: Sizes.dimen_8.h.toDouble(),),
                                              Text(': ${widget.item!.mbranch!.branchname}', style: primaryTextFont.copyWith(color: darkGrey, fontSize: Sizes.dimen_18.sp.toDouble(), fontWeight: FontWeight.w600),),
                                              SizedBox(height: Sizes.dimen_8.h.toDouble(),),
                                              Text(': ${widget.item!.mbranch!.branchaddress}', maxLines: 2, style: primaryTextFont.copyWith(color: darkGrey, fontSize: Sizes.dimen_18.sp.toDouble(), fontWeight: FontWeight.w600),),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                      flex: 2,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () => Get.back(),
                                            style: ButtonStyle(
                                              backgroundColor:
                                              MaterialStateProperty
                                                  .resolveWith((states) {
                                                return Colors.white70;
                                              }),),
                                           child: Padding(
                                              padding: EdgeInsets.all(Sizes.dimen_12.w.toDouble()),
                                              child: Text('Back', style: primaryTextFont.copyWith(fontSize: Sizes.dimen_20.sp.toDouble(), color: mainColor, fontWeight: FontWeight.w600),),
                                            ),
                                          ),
                                          _isLoading! ? smallLoadingIndicator :
                                          ElevatedButton(
                                            onPressed: () => _requestMeet(context),
                                            style: ButtonStyle(
                                              backgroundColor:
                                              MaterialStateProperty
                                                  .resolveWith((states) {
                                                return secondaryColor;
                                              }),),
                                            child: Padding(
                                              padding: EdgeInsets.all(Sizes.dimen_12.w.toDouble()),
                                              child: Text('Meet', style: primaryTextFont.copyWith(fontSize: Sizes.dimen_20.sp.toDouble(), color: Colors.white, fontWeight: FontWeight.w600),),
                                            ),
                                          ),
                                        ],
                                      )),
                                ],
                              )),
                        ],
                      )),
                )
              ],
            ),
          )),
    );
  }

  _joinMeeting() async {
    String? serverUrl = serverText.text.trim().isEmpty ? null : serverText.text;

    // Enable or disable any feature flag here
    // If feature flag are not provided, default values will be used
    // Full list of feature flags (and defaults) available in the README
    Map<FeatureFlagEnum, bool> featureFlags = {
      FeatureFlagEnum.WELCOME_PAGE_ENABLED: false,
      FeatureFlagEnum.ADD_PEOPLE_ENABLED: false,
      FeatureFlagEnum.INVITE_ENABLED: false,
    };
    if (!kIsWeb) {
      // Here is an example, disabling features for each platform
      if (Platform.isAndroid) {
        // Disable ConnectionService usage on Android to avoid issues (see README)
        featureFlags[FeatureFlagEnum.CALL_INTEGRATION_ENABLED] = false;
      } else if (Platform.isIOS) {
        // Disable PIP on iOS as it looks weird
        featureFlags[FeatureFlagEnum.PIP_ENABLED] = false;
      }
    }
    // Define meetings options here
    var options = JitsiMeetingOptions(room: roomText!.text)
      ..serverURL = serverUrl
      ..subject = subjectText!.text
      ..userDisplayName = nameText!.text
      ..userEmail = emailText!.text
      ..iosAppBarRGBAColor = iosAppBarRGBAColor!.text
      ..audioOnly = isAudioOnly
      ..audioMuted = isAudioMuted
      ..videoMuted = isVideoMuted
      ..featureFlags.addAll(featureFlags)
      ..webOptions = {
        "roomName": roomText!.text,
        "width": "100%",
        "height": "100%",
        "enableWelcomePage": false,
        "chromeExtensionBanner": null,
        "userInfo": {"displayName": nameText!.text}
      };

    debugPrint("JitsiMeetingOptions: $options");
    await JitsiMeet.joinMeeting(
      options,
      listener: JitsiMeetingListener(
          onConferenceWillJoin: (message) {
            debugPrint("${options.room} will join with message: $message");
          },
          onConferenceJoined: (message) {
            debugPrint("${options.room} joined with message: $message");
          },
          onConferenceTerminated: (message) {
            _rateApp(context, roomText!.text);
            debugPrint("${options.room} terminated with message: $message");
          },
          genericListeners: [
            JitsiGenericListener(
                eventName: 'readyToClose',
                callback: (dynamic message) {
                  debugPrint("readyToClose callback");
                }),
          ]),
    );
  }

  Future<void> _requestMeet(BuildContext context) async {
    setState(() {
      _isLoading = true;
    });
    try {
      await context.read<AdvisoryCubit>().postAdvisory(widget.link!.substring(20, 29), widget.item!, widget.customer!, widget.item!.mproduct!, widget.branch!);
      await context.read<NotificationCubit>().pushNotification('Anda mendapatkan permintaan meet dari ${widget.customer!.custname!.capitalize}', widget.item!.rmname!.capitalize!, widget.item!.token!);
      AdvisoryState state = context.read<AdvisoryCubit>().state;
      NotificationState nstate = context.read<NotificationCubit>().state;
      if (state is AdvisoryLoaded && nstate is NotificationLoaded) {
        setState(() {
          _isLoading = false;
        });
        _joinMeeting();
      } else {
        setState(() {
          _isLoading = false;
        });
        SharedDialog.errorSnackBar(SharedString.failed,
            (state as AdvisoryLoadingFailed).message);
      }
    } catch (e) {
      //connection
      SharedDialog.errorSnackBar(SharedString.failed, e.toString());
    }
  }

  Future<void> _rateApp(BuildContext context, String bookId) async {
    Size size = MediaQuery.of(context).size;

    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Bagaimana pertemuannya?\nBeri Kami Rating!",
                  textAlign: TextAlign.center,
                  style: primaryTextFont.copyWith(
                      color: secondaryColor, fontWeight: FontWeight.w600, fontSize: Sizes.dimen_20.sp.toDouble()),
                ),
                SizedBox(height: Sizes.dimen_16.h.toDouble(),),
                Center(
                  child: RatingBar.builder(
                    itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber, size: Sizes.dimen_20.sp.toDouble(),),
                    onRatingUpdate: (rating) => setState(() {
                      this.rating = rating;
                    }),
                  ),
                ),
                BottomButton(
                    text: 'Selesai',
                    onClick: () async {
                      try {
                        await context.read<AdvisoryCubit>().rateApp(bookId, rating.toInt());
                        AdvisoryState state = context.read<AdvisoryCubit>().state;

                        if (state is AdvisoryLoaded) {
                          Get.offAll(HomePage(isDone: true, branch: widget.branch,));
                        } else {
                          Fluttertoast.showToast(
                              msg: "gagal rate",
                              backgroundColor: errorColor,
                              gravity: ToastGravity.TOP);
                          Get.offAll(HomePage(isDone: true, branch: widget.branch,));
                        }
                      } catch (e) {
                        debugPrint('error $e');
                      }
                    })
              ],
            ),
          );
        });
  }
}

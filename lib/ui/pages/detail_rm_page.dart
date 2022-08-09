part of 'pages.dart';

class DetailRmPage extends StatefulWidget {
  final String? link;
  final RmModel? item;
  final CustomerModel? customer;
  const DetailRmPage({Key? key, this.link, this.item, this.customer,}) : super(key: key);

  @override
  _DetailRmPageState createState() => _DetailRmPageState();
}

class _DetailRmPageState extends State<DetailRmPage> {
  final serverText = TextEditingController();
  TextEditingController? roomText;
  TextEditingController? subjectText;
  TextEditingController? nameText;
  MemoryImage? avatarUrl;
  TextEditingController? emailText;
  TextEditingController? iosAppBarRGBAColor; //transparent blue
  bool? isAudioOnly = true;
  bool? isAudioMuted = true;
  bool? isVideoMuted = true;

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
                  height: size.height * 0.15,
                ),
                const SizedBox(
                  height: Sizes.dimen_16,
                ),
                SingleChildScrollView(
                  child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: Sizes.dimen_18, vertical: Sizes.dimen_24),
                      margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
                      width: double.infinity,
                      height: size.height * 0.55,
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
                                  : Image.asset('assets/images/avatar.jpg')),
                          const SizedBox(width: Sizes.dimen_16,),
                          Expanded(
                              flex: 2,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${widget.item!.rmname}', style: primaryTextFont.copyWith(color: mainColor, fontSize: Sizes.dimen_24, fontWeight: FontWeight.w700),),
                                  const SizedBox(height: Sizes.dimen_8,),
                                  Text('RM ${widget.item!.mproduct!.productname}', style: primaryTextFont.copyWith(color: secondaryColor, fontSize: Sizes.dimen_18, fontWeight: FontWeight.w600),),
                                  const SizedBox(height: Sizes.dimen_16,),
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
                                              Text('E-mail', style: primaryTextFont.copyWith(color: Colors.black, fontSize: Sizes.dimen_16, fontWeight: FontWeight.w600),),
                                              const SizedBox(height: Sizes.dimen_8,),
                                              Text('No.Hp', style: primaryTextFont.copyWith(color: Colors.black, fontSize: Sizes.dimen_16, fontWeight: FontWeight.w600),),
                                              const SizedBox(height: Sizes.dimen_8,),
                                              Text('Cabang', style: primaryTextFont.copyWith(color: Colors.black, fontSize: Sizes.dimen_16, fontWeight: FontWeight.w600),),
                                              const SizedBox(height: Sizes.dimen_8,),
                                              Text('Alamat', style: primaryTextFont.copyWith(color: Colors.black, fontSize: Sizes.dimen_16, fontWeight: FontWeight.w600),),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 4,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(': ${widget.item!.email}', style: primaryTextFont.copyWith(color: darkGrey, fontSize: Sizes.dimen_16, fontWeight: FontWeight.w600),),
                                              const SizedBox(height: Sizes.dimen_8,),
                                              Text(': ${widget.item!.nohp}', style: primaryTextFont.copyWith(color: darkGrey, fontSize: Sizes.dimen_16, fontWeight: FontWeight.w600),),
                                              const SizedBox(height: Sizes.dimen_8,),
                                              Text(': ${widget.item!.mbranch!.branchname}', style: primaryTextFont.copyWith(color: darkGrey, fontSize: Sizes.dimen_16, fontWeight: FontWeight.w600),),
                                              const SizedBox(height: Sizes.dimen_8,),
                                              Text(': ${widget.item!.mbranch!.branchaddress}', maxLines: 2, style: primaryTextFont.copyWith(color: darkGrey, fontSize: Sizes.dimen_16, fontWeight: FontWeight.w600),),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                      flex: 2,
                                      child: Row(
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
                                            child: Text('Back', style: primaryTextFont.copyWith(fontSize: Sizes.dimen_18, color: mainColor, fontWeight: FontWeight.w600),),
                                          ),
                                          const SizedBox(width: Sizes.dimen_16,),
                                          _isLoading! ? smallLoadingIndicator :
                                          ElevatedButton(
                                            onPressed: () => _requestMeet(context),
                                            style: ButtonStyle(
                                              backgroundColor:
                                              MaterialStateProperty
                                                  .resolveWith((states) {
                                                return secondaryColor;
                                              }),),
                                            child: Text('Meet', style: primaryTextFont.copyWith(fontSize: Sizes.dimen_18, color: Colors.white, fontWeight: FontWeight.w600),),
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
            Get.offAll(HomePage());
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
      await context.read<AdvisoryCubit>().postAdvisory(widget.link!.substring(20, 29), widget.item!, widget.customer!, widget.item!.mproduct!);
      // await context.read<NotificationCubit>().pushNotification('Anda mendapatkan permintaan meet dari ${widget.customer!.custname!.capitalize}', widget.item!.rmname!.capitalize!, 'token');
      AdvisoryState state = context.read<AdvisoryCubit>().state;
      if (state is AdvisoryLoaded) {
        setState(() {
          _isLoading = false;
        });
        SharedDialog.successSnackBar(
          SharedString.success, SharedString.success,);
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
}

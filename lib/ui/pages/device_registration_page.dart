part of 'pages.dart';

class DeviceRegistrationPage extends StatefulWidget {
  const DeviceRegistrationPage({Key? key}) : super(key: key);

  @override
  _DeviceRegistrationPageState createState() => _DeviceRegistrationPageState();
}

class _DeviceRegistrationPageState extends State<DeviceRegistrationPage> {
  List<BranchModel> branchList = [];
  List<RegionModel> regionList = [];
  BranchModel? selectedBranch;
  RegionModel? selectedRegion;
  // String? selectedRegion;

  bool? _isLoading;
  bool? _enableLoad = false;

  final _storage = LocalStorage();

  @override
  void initState() {
    _isLoading = false;
    _getRegion();
    super.initState();
  }

  Future<void> _getRegion() async {
    try{
      await context.read<RegionCubit>().getRegion();
      RegionState state = context.read<RegionCubit>().state;
      if (state is RegionLoaded){
        setState(() {
          regionList = state.region;
        });
      } else {
        print('gagal regionnya');
      }
    }catch(e){
      print(e);
    }
  }

  Future<void> _getBranch(String selected) async {
    try{
      await context.read<BranchCubit>().getBranch(selected);
      BranchState state = context.read<BranchCubit>().state;
      if (state is BranchLoaded){
        setState(() {
          branchList = state.branch;
        });
      } else {
        print('gagal branchnya');
      }
    }catch(e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
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
                    image: AssetImage(SharedImage.background),
                    fit: BoxFit.cover)),
            child: Padding(
              padding: const EdgeInsets.all(defaultMargin),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: Sizes.dimen_16),
                      margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
                      width: double.infinity,
                      height: size.height * 0.75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Sizes.dimen_8),
                        color: Colors.black54,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Registrasi'.toUpperCase(), style: primaryTextFont.copyWith(color: Colors.white, fontSize: Sizes.dimen_20, fontWeight: FontWeight.w600),),
                          SizedBox(height: Sizes.dimen_8,),
                          ///Lokasi
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  SharedString.region,
                                  style: primaryTextFont.copyWith(color: thirdColor,
                                      fontSize: Sizes.dimen_12, fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  height: Sizes.dimen_8,
                                ),
                                Container(
                                  width: size.width * 0.7,
                                  padding: const EdgeInsets.all(Sizes.dimen_16),
                                  height: Sizes.dimen_56,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(Sizes.dimen_8),
                                    border: Border.all(color: thirdColor),
                                  ),
                                  child: DropdownButton(
                                    value: selectedRegion,
                                    isExpanded: true,
                                    underline: const SizedBox(),
                                    hint: Text(
                                      'Pilih ${SharedString.region} ...',
                                      style: primaryTextFont.copyWith(
                                          color: thirdColor,
                                          fontSize: Sizes.dimen_14,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    items: regionList.map((map) {
                                      return DropdownMenuItem<RegionModel>( //
                                        value: map,
                                        child: Text(map.regionname!, style: primaryTextFont), //
                                      );
                                    }).toList(),
                                    onChanged: (dynamic value) {
                                      setState(() {
                                        selectedRegion = value;
                                        log('logregion di page $selectedRegion = $value');
                                        branchList = [];
                                        selectedBranch = null;
                                        _getBranch(selectedRegion!.regioncode!);
                                      });
                                    },
                                    onTap: (){
                                      log('log region di tap page $selectedRegion');
                                    },
                                  ),
                                )
                              ],
                            ),
                          const SizedBox(height: Sizes.dimen_8,),
                          ///Cabang
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                SharedString.branch,
                                style: primaryTextFont.copyWith(color: thirdColor,
                                    fontSize: Sizes.dimen_12, fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                height: Sizes.dimen_8,
                              ),
                              Container(
                                width: size.width * 0.7,
                                padding: const EdgeInsets.all(Sizes.dimen_16),
                                height: Sizes.dimen_56,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(Sizes.dimen_8),
                                  border: Border.all(color: thirdColor),
                                ),
                                child: DropdownButton(
                                  value: selectedBranch,
                                  isExpanded: true,
                                  underline: const SizedBox(),
                                  hint: Text(
                                    selectedRegion == null && branchList.isEmpty ? '----------' :
                                    branchList.isEmpty? SharedString.nobranch : 'Pilih ${SharedString.branch} ...',
                                    style: primaryTextFont.copyWith(
                                        color: branchList.isEmpty? deepGrey : thirdColor,
                                        fontSize: Sizes.dimen_14,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  items: branchList.map((map) {
                                    return DropdownMenuItem<BranchModel>(
                                      value: map,
                                      child: Text(map.branchname!, style: primaryTextFont),
                                    );
                                  }).toList(),
                                  onChanged: (dynamic value) {
                                    setState(() {
                                      selectedBranch = value;
                                      log('log branch page $selectedBranch = $value');
                                    });
                                  },
                                ),
                              )
                            ],
                          ),
                          const Spacer(),
                          SizedBox(
                            width: double.infinity,
                            height: Sizes.dimen_48,
                            child: ElevatedButton(
                              onPressed: () => _registerDevice(context),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.resolveWith((states) {
                                  return secondaryColor;
                                }),
                              ),
                              child: _isLoading! ? loadingIndicator : Text(
                                'Register',
                                style: primaryTextFont.copyWith(color: Colors.white, fontSize: Sizes.dimen_14),
                              ),
                            ),
                          ),
                        ],
                      )

                  )
                ],
              ),
            )),
      ),
    );
  }

  Future<String?> _getId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) { // import 'dart:io'
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else if(Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.id; // unique ID on Android
    }
  }

  Future<void> _registerDevice(BuildContext context) async {
    String? deviceId = await _getId();
    setState(() {
      _isLoading = true;
    });

    try {
      await context.read<DeviceCubit>().registrationDevice(
          selectedBranch!,
        deviceId!
      );
      DeviceState state = context.read<DeviceCubit>().state;
      if (state is DeviceLoaded) {
        _storage.writeValue("branch", selectedBranch!.toJson());
        _storage.writeValue("deviceid", deviceId);
        _storage.writeValue("isRegistered", _isLoading.toString());
        setState(() {
          _isLoading = false;
        });
        log('check branchx $selectedBranch');
        Fluttertoast.showToast(
            msg: 'Perangkat berhasil didaftarkan',
            backgroundColor: statusOkColor,
            gravity: ToastGravity.BOTTOM);
        Get.offAll(HomePage(branch: selectedBranch));
      } else {
        setState(() {
          _isLoading = false;
        });
        SharedDialog.errorSnackBar(
            SharedString.failed,
            (state as DeviceLoadingFailed).message);
      }
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      //connection
      print(e);
    }
  }
}

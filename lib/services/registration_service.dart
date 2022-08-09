part of 'services.dart';

class RegistrationService {
  static Future<ApiReturnValue<DeviceModel>> registrationDevice(BranchModel mbranch, String deviceid,
      {http.Client? client}) async {
    String url = baseURL + "registdevice";
    client ??= http.Client();

    Map<String, String> _mapHeader = Map<String, String>();

    _mapHeader['Content-Type'] = "application/json";
    _mapHeader['accept'] = "application/json";

    http.Response? response;

    try {
      response = await client
          .post(Uri.parse(url),
          body: jsonEncode(<String, dynamic>{
            'data': <String, dynamic>{
              'mdevicepk': null,
              'mbranch': mbranch,
              'deviceid': deviceid,
              'createdtime': null,
            },
          }
          ),
          headers: _mapHeader)
          .timeout(Duration(seconds: 10));
    } on TimeoutException catch (e) {
      print('Timeout Error: $e');
    } on SocketException catch (e) {
      print('Socket Error: $e');
    } on Error catch (e) {
      print('General Error: $e');
    }
    log('body regist ${jsonEncode(<String, dynamic>{
      'data': <String, dynamic>{
        'mdevicepk': null,
        'mbranch': mbranch,
        'deviceid': deviceid,
        'createdtime': null,
      },
    })}');

    log('registnya ${response!.body}');
    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);

    DeviceModel value = DeviceModel.fromJson(data);

    return ApiReturnValue(value: value);
  }

  static Future<ApiReturnValue<AdvisoryDetailModel>> getBoardNotification(String deviceid,
      {http.Client? client}) async {
    String? url = baseURL + "tadvisory/getsmartboardnotif/$deviceid";
    client ??= http.Client();

    Map<String, String> _mapHeader = Map<String, String>();

    _mapHeader['accept'] = "application/json";

    http.Response? response;

    try {
      response = await client
          .get(Uri.parse(url), headers: _mapHeader)
          .timeout(Duration(seconds: 10));
    } on TimeoutException catch (e) {
      print('Timeout Error: $e');
    } on SocketException catch (e) {
      print('Socket Error: $e');
    } on Error catch (e) {
      print('General Error: $e');
    }

    log('response getBoardNotif ${response!.body}');
    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);

    if (data['data'] == null){
      return ApiReturnValue(message: data['message']);
    }

    AdvisoryDetailModel value = AdvisoryDetailModel.fromJson(data['data']);

    return ApiReturnValue(value: value);
  }
}
part of 'services.dart';

class BookingServices {
  static Future<ApiReturnValue<List<RegionModel>>> getRegion(
      {http.Client? client}) async {
    String url = baseURL + "mregion";
    client ??= http.Client();

    Map<String, String> _mapHeader = Map<String, String>();

    // _mapHeader['Content-Type'] = "application/json";
    _mapHeader['accept'] = "application/json";

    http.Response? response;

    try {
      response = await client
          .get(Uri.parse(url), headers: _mapHeader)
          .timeout(Duration(seconds: 60));
    } on TimeoutException catch (e) {
      print('Timeout Error: $e');
    } on SocketException catch (e) {
      print('Socket Error: $e');
    } on Error catch (e) {
      print('General Error: $e');
    }

    if (response!.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);

    List<RegionModel> regionModel = (data['data']['Data'] as Iterable)
        .map((e) => RegionModel.fromJson(e))
        .toList();
    log("log regionnya ${jsonDecode(response.body)}");
    return ApiReturnValue(value: regionModel);
  }

  static Future<ApiReturnValue<List<BranchModel>>> getBranch(String branchid,
      {http.Client? client}) async {
    String url = baseURL + "mbranch/getbybranchid/$branchid";
    client ??= http.Client();

    Map<String, String> _mapHeader = Map<String, String>();

    // _mapHeader['Content-Type'] = "application/json";
    _mapHeader['accept'] = "application/json";

    http.Response? response;

    try {
      response = await client
          .get(Uri.parse(url), headers: _mapHeader)
          .timeout(Duration(seconds: 60));
    } on TimeoutException catch (e) {
      print('Timeout Error: $e');
    } on SocketException catch (e) {
      print('Socket Error: $e');
    } on Error catch (e) {
      print('General Error: $e');
    }

    log('responbodynya ${jsonDecode(response!.body)}');
    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);

    List<BranchModel> branchModel = (data['data']['Data'] as Iterable)
        .map((e) => BranchModel.fromJson(e))
        .toList();
    return ApiReturnValue(value: branchModel);
  }

  static Future<AdvisoryReturnValue<dynamic>> findRm(String bookid,
      {http.Client? client}) async {
    String? url = baseURL + "tbooking/findrm/$bookid";
    client ??= http.Client();

    Map<String, String> _mapHeader = Map<String, String>();

    _mapHeader['accept'] = "application/json";

    http.Response? response;

    try {
      response = await client
          .get(Uri.parse(url), headers: _mapHeader)
          .timeout(Duration(seconds: 60));
    } on TimeoutException catch (e) {
      print('Timeout Error: $e');
    } on SocketException catch (e) {
      print('Socket Error: $e');
    } on Error catch (e) {
      print('General Error: $e');
    }

    log(response!.statusCode.toString());
    if (response.statusCode != 200) {
      return AdvisoryReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);

    //biar ga perlu get data lagi
    List<RmModel> valueA = (data['data']['Data'] as Iterable)
        .map((e) => RmModel.fromJson(e))
        .toList();
    CustomerModel valueB = CustomerModel.fromJson(data['mcust']);
    log("logs ${jsonDecode(response.body)}");
    return AdvisoryReturnValue(valueA: valueA, valueB: valueB);
  }

  static Future<ApiReturnValue<AdvisoryModel>> postAdvisory(String bookid, RmModel mrm, CustomerModel mcust, ProductModel mproduct, BranchModel mbranch,
      {http.Client? client}) async {
    String? url = baseURL + "tadvisory";
    client ??= http.Client();

    Map<String, String> _mapHeader = Map<String, String>();

    _mapHeader['Content-Type'] = "application/json";
    _mapHeader['accept'] = "application/json";

    http.Response? response;

    log('jsonEncodenya 1 ${jsonEncode(<String, dynamic>{
      'data': <String, dynamic>{
        'mrm': mrm.toJson(),
        'mbranch': mbranch.toJson(),
        'mcust': mcust.toJson(),
        'mproduct': mproduct.toJson(),
        'meetstart': null,
        'meetend': null,
        'meetdate': null,
        'bookid': bookid,
        'meetstatus': null
      },
    })}');

    try {
      response = await client
          .post(Uri.parse(url),
          body: jsonEncode(<String, dynamic>{
            'data': <String, dynamic>{
              'mrm': mrm.toJson(),
              'mbranch': mbranch.toJson(),
              'mcust': mcust.toJson(),
              'mproduct': mproduct.toJson(),
              'meetstart': null,
              'meetend': null,
              'meetdate': null,
              'bookid': bookid,
              'meetstatus': null
            },
          }),
          headers: _mapHeader)
          .timeout(const Duration(seconds: 120));
    } on TimeoutException catch (e) {
      print('Timeout Error: $e');
    } on SocketException catch (e) {
      print('Socket Error: $e');
    } on Error catch (e) {
      print('General Error: $e');
    }
    log('jsonEncodenya ${jsonEncode(<String, dynamic>{
      'data': <String, dynamic>{
        'mrm': mrm.toJson(),
        'mbranch': mbranch.toJson(),
        'mcust': mcust.toJson(),
        'mproduct': mproduct.toJson(),
        'meetstart': null,
        'meetend': null,
        'meetdate': null,
        'bookid': bookid,
        'meetstatus': null
      },
    })}');
    log(response!.body);
    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);

    //biar ga perlu get data lagi
    AdvisoryModel value = AdvisoryModel.fromJson(data['data']);

    return ApiReturnValue(value: value);
  }
}
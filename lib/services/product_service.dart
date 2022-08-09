part of 'services.dart';

class ProductServices {
  static Future<ApiReturnValue<List<ProductModel>>> getProduct(
      {http.Client? client}) async {
    String url = baseURL + "mproduct";
    client ??= http.Client();

    Map<String, String> _mapHeader = Map<String, String>();

    // _mapHeader['Content-Type'] = "application/json";
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

    if (response!.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);

    List<ProductModel> productModel = (data['data']['Data'] as Iterable)
        .map((e) => ProductModel.fromJson(e))
        .toList();
    log("logs  ${jsonDecode(response.body)}");
    return ApiReturnValue(value: productModel);
  }

  static Future<ApiReturnValue<List<RmModel>>> getRmByProduct(int mproductpk,
      {http.Client? client}) async {
    String url = baseURL + "mrm/rmbyproduct/$mproductpk";
    client ??= http.Client();

    Map<String, String> _mapHeader = Map<String, String>();

    // _mapHeader['Content-Type'] = "application/json";
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
    log("logsnyaaa  ${jsonDecode(response!.body)}");
    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    var data = jsonDecode(response.body);

    List<RmModel> rmModel = (data['data']['Data'] as Iterable)
        .map((e) => RmModel.fromJson(e))
        .toList();
    log("logs  ${jsonDecode(response.body)}");
    return ApiReturnValue(value: rmModel);
  }
}
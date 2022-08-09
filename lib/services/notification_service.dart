part of 'services.dart';

class NotificationService {
  static Future<ApiReturnValue<String>> pushNotification(String body, String name, String token,
      {http.Client? client}) async {
    String url = "https://fcm.googleapis.com/fcm/send";
    client ??= http.Client();

    Map<String, String> _mapHeader = Map<String, String>();

    _mapHeader['Content-Type'] = 'application/json';
    _mapHeader['Authorization'] = 'key=AAAA98ikwiA:APA91bEdO4GJA1KuzdpgJKAgJEtDQLDrUK1ZUvZJ13cEef3l54thI1LnN7ICcKz72clVsyPtb-VPRaYYtglFG0XDHYftNdNj_lZMrqVSMlzkI96bvSPR5IK3-B8ixi6Nek9E8uSnsXT1'; //

    http.Response? response;

    log(jsonEncode(<String, dynamic>{
      'notification': <String, dynamic>{
        'body': body,
        'title': 'Hi RM $name',
      },
      'priority': 'high',
      'data': <String, dynamic>{
        'click_action': 'FLUTTER_NOTIFICATION_CLICK',
        'id': '1',
        'status': 'done'
      },
      'to': token,//'fNUWsapfT2WKyD0g0Vb-CE:APA91bGbNYGDstkUFiNhrAtFNYSaIL7zm-uLR58jZYy2oj9H2eeW3JL2pyPVaAN4Br6qrrBwPnvcZPfK5jXLfis_WmuyENNKKeeZaOfNO0J3r4mu-WbYgtwEQ0FpCOvBOdGkG4JuG2Cf',
    }));

    try {
      response = await client
          .post(Uri.parse(url),
              body: jsonEncode(<String, dynamic>{
                'notification': <String, dynamic>{
                  'body': body,
                  'title': 'Hi RM $name',
                },
                'priority': 'high',
                'data': <String, dynamic>{
                  'click_action': 'FLUTTER_NOTIFICATION_CLICK',
                  'id': '1',
                  'status': 'done'
                },
                'to': token,
              }),
              headers: _mapHeader)
          .timeout(Duration(seconds: 10));
    } on TimeoutException catch (e) {
      print('Timeout Error: FCM $e');
    } on SocketException catch (e) {
      print('Socket Error: $e');
    } on Error catch (e) {
      print('General Error: $e');
    }

    log(response!.body);
    if (response.statusCode != 200) {
      return ApiReturnValue(message: 'Please try again');
    }

    String message = "Success push notification";

    return ApiReturnValue(value: message);
  }
}

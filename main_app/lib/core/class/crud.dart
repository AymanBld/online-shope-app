import 'dart:convert';
import 'package:online_shope_app/core/functions/check_internet.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Map> post({
    required String url,
    Object? body,
    String queryPar = '',
  }) async {
    return await sendRequest(
      () => http.post(Uri.parse(url + queryPar), body: body),
    );
  }

  sendRequest(Future<http.Response> Function() request) async {
    try {
      if (await checkInternet()) {
        http.Response response = await request();

        if (response.statusCode < 300) {
          Map responsebody = jsonDecode(response.body);
          return responsebody;
        } else {
          return {"status": StatusRequest.serverFailed};
        }
      } else {
        return {"status": StatusRequest.internetFailed};
      }
    } catch (e) {
      print('-----------------------$e-----------');
      return {"status": StatusRequest.exceptionFailed};
    }
  }
}

enum StatusRequest {
  loading,
  success,
  failed,
  internetFailed,
  serverFailed,
  exceptionFailed,
}

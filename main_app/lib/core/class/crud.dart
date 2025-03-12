import 'dart:convert';
import 'package:online_shope_app/core/functions/check_internet.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Map> get({required String url, String queryPar = ''}) async {
    return await sendRequest(() => http.get(Uri.parse(url + queryPar)), isGet: true);
  }

  Future<Map> post({required String url, Object? body, String queryPar = ''}) async {
    return await sendRequest(() => http.post(Uri.parse(url + queryPar), body: body));
  }

  Future<Map> patch({required String url, Object? body, String queryPar = ''}) async {
    return await sendRequest(() => http.patch(Uri.parse(url + queryPar), body: body));
  }

  Future<Map> delete({required String url, Object? body, String queryPar = ''}) async {
    return await sendRequest(() => http.delete(Uri.parse(url + queryPar), body: body));
  }

  Future<Map> sendRequest(Future<http.Response> Function() request, {bool isGet = false}) async {
    try {
      if (await checkInternet()) {
        http.Response response = await request();
        print('=======respons============${response.body}======');

        if (response.statusCode < 300) {
          // if (isGet) {
          if (response.request!.method == 'GET') {
            List responsebody = jsonDecode(response.body);
            return {'data': responsebody};
          }
          Map responsebody = jsonDecode(response.body);
          return responsebody;
        } else {
          return {"status": StatusRequest.serverFailed};
        }
      } else {
        return {"status": StatusRequest.internetFailed};
      }
    } catch (e) {
      print('------------request error-----------$e-----------');
      return {"status": StatusRequest.exceptionFailed};
    }
  }
}

enum StatusRequest { loading, success, failed, internetFailed, serverFailed, exceptionFailed }

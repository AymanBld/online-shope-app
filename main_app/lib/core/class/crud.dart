import 'dart:convert';
import 'package:get/get.dart';
import 'package:online_shope_app/core/functions/check_internet.dart';
import 'package:http/http.dart' as http;
import 'package:online_shope_app/core/services/services.dart';

class Crud {
  Myservices myservices = Get.find<Myservices>();

  Future<Map> get({required String url, String queryPar = ''}) async {
    return await sendRequest(
      () => http.get(Uri.parse(url + queryPar), headers: {'user': myservices.sharedpref.getString('id') ?? '0'}),
    );
  }

  Future<Map> post({required String url, Object? body, String queryPar = ''}) async {
    return await sendRequest(
      () => http.post(
        Uri.parse(url + queryPar),
        body: body,
        headers: {'user': myservices.sharedpref.getString('id') ?? '0'},
      ),
    );
  }

  Future<Map> patch({required String url, Object? body, String queryPar = ''}) async {
    return await sendRequest(
      () => http.patch(
        Uri.parse(url + queryPar),
        body: body,
        headers: {'user': myservices.sharedpref.getString('id') ?? '0'},
      ),
    );
  }

  Future<Map> delete({required String url, Object? body, String queryPar = ''}) async {
    return await sendRequest(
      () => http.delete(
        Uri.parse(url + queryPar),
        body: body,
        headers: {'user': myservices.sharedpref.getString('id') ?? '0'},
      ),
    );
  }

  Future<Map> sendRequest(Future<http.Response> Function() request) async {
    try {
      if (await checkInternet()) {
        http.Response response = await request();
        print('=======respons============${response.body}======');

        if (response.statusCode < 300) {
          if (response.request!.method == 'GET') {
            List responsebody = jsonDecode(response.body);
            return {'data': responsebody};
          }
          Map responsebody = jsonDecode(response.body);
          return responsebody;
        } else {
          return {"status": StatusRequest.serverFailed, 'error': jsonDecode(response.body)['error']};
        }
      } else {
        return {"status": StatusRequest.internetFailed, 'error': 'no internet connection'};
      }
    } catch (e) {
      return {"status": StatusRequest.exceptionFailed, 'error': e};
    }
  }
}

enum StatusRequest { loading, success, failed, internetFailed, serverFailed, exceptionFailed }

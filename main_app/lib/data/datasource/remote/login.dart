import 'package:online_shope_app/core/class/crud.dart';
import 'package:online_shope_app/core/constant/links.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);

  Future<Map> postRequest(String email, String pass) async {
    Map response = await crud.postData(AppLinks.login, {
      'user_email': email,
      'user_pass': pass,
    });
    return response;
  }
}

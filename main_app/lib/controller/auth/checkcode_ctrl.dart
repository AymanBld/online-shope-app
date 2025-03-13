import 'package:online_shope_app/core/class/crud.dart';
import 'package:online_shope_app/core/constant/links.dart';
import 'package:online_shope_app/core/constant/routes.dart';
import 'package:online_shope_app/core/functions/handle_statuss.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CheckCodeCtrl extends GetxController {
  StatusRequest? statusrequest;
  Crud crud = Get.find<Crud>();

  late String username;
  late String where;

  checkCode(String code) async {
    statusrequest = StatusRequest.loading;
    update();

    Map response = await crud.post(
      url: AppLinks.checkCode,
      body: {if (username.isEmail) 'email': username, if (!username.isEmail) 'username': username, 'otp': code},
    );
    statusrequest = handlingStatus(response);
    update();

    if (statusrequest == StatusRequest.success) {
      where == 'signup'
          ? Get.offAllNamed(AppRoutes.success)
          : Get.offAllNamed(AppRoutes.resetPassword, arguments: {'username': username});
    } else {
      Get.defaultDialog(title: 'Eroor', content: Text(response['error']));
    }
  }

  resendCode() {
    crud.post(url: AppLinks.resendCode, body: {'user_email': username});
  }

  @override
  void onInit() {
    username = Get.arguments['username'];
    where = Get.arguments['where'];
    super.onInit();
  }
}

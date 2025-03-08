import 'package:online_shope_app/core/class/crud.dart';
import 'package:online_shope_app/core/constant/links.dart';
import 'package:online_shope_app/core/constant/routes.dart';
import 'package:online_shope_app/core/functions/handle_statuss.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CheckCodeCtrl extends GetxController {
  StatusRequest? statusrequest;
  Crud crud = Crud();

  late String email;
  late String where;

  checkCode(String code) async {
    statusrequest = StatusRequest.loading;
    update();

    Map response = where == 'signup'
        ? await crud.post(url: '')
        : await crud.post(url: '');

    statusrequest = handlingStatus(response);
    update();

    if (statusrequest == StatusRequest.success) {
      where == 'signup'
          ? Get.offAllNamed(AppRoutes.success)
          : Get.offAllNamed(AppRoutes.resetPassword, arguments: {'email': email});
    } else if (statusrequest == StatusRequest.failed) {
      Get.defaultDialog(
        title: 'warning',
        content: const Text('Incorrect code !'),
      );
    }
  }

  resendCode() {
    crud.post(url:AppLinks.resendCode,body:  {'user_email': email});
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    where = Get.arguments['where'];
    super.onInit();
  }
}

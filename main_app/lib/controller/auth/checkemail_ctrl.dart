import 'package:online_shope_app/core/class/crud.dart';
import 'package:online_shope_app/core/constant/links.dart';
import 'package:online_shope_app/core/constant/routes.dart';
import 'package:online_shope_app/core/functions/handle_statuss.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckEmailCtrl extends GetxController {
  late TextEditingController username;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Crud crud = Get.find<Crud>();

  StatusRequest? statusrequest;

  checkEmail() async {
    if (formKey.currentState!.validate()) {
      statusrequest = StatusRequest.loading;
      update();

      Map response = await crud.post(
        url: AppLinks.checkEmail,
        body: {
          if (username.text.isEmail) 'email': username.text,
          if (!username.text.isEmail) 'username': username.text,
        },
      );
      statusrequest = handlingStatus(response);
      update();

      if (statusrequest == StatusRequest.success) {
        Get.offAllNamed(AppRoutes.checkCode, arguments: {'username': username.text, 'where': 'reset'});
      } else{
        Get.defaultDialog(title: 'Error', content: Text(response['error']));
      }
    }
  }

  @override
  void onInit() {
    username = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    username.dispose();
    super.onClose();
  }
}

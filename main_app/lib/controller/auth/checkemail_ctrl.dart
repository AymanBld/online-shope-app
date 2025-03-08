import 'package:online_shope_app/core/class/crud.dart';
import 'package:online_shope_app/core/constant/routes.dart';
import 'package:online_shope_app/core/functions/handle_statuss.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckEmailCtrl extends GetxController {
  late TextEditingController email;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Crud crud = Crud();

  StatusRequest? statusrequest;

  checkEmail() async {
    if (formKey.currentState!.validate()) {
      statusrequest = StatusRequest.loading;
      update();

      Map response = await crud.post(url: '');
      statusrequest = handlingStatus(response);
      update();

      if (statusrequest == StatusRequest.success) {
        Get.offAllNamed(
          AppRoutes.checkCode,
          arguments: {'email': email.text, 'where': 'reset'},
        );
      } else if (statusrequest == StatusRequest.failed) {
        Get.defaultDialog(
          title: 'warning',
          content: const Text('Email not existe!'),
        );
      }
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    email.dispose();
    super.onClose();
  }
}

import 'package:online_shope_app/core/class/crud.dart';
import 'package:online_shope_app/core/constant/links.dart';
import 'package:online_shope_app/core/constant/routes.dart';
import 'package:online_shope_app/core/functions/handle_statuss.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordCtrl extends GetxController {
  late TextEditingController password1;
  late TextEditingController password2;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  StatusRequest? statusrequest;
  Crud crud = Get.find<Crud>();

  late String username;

  resetPass() async {
    if (formKey.currentState!.validate()) {
      if (password1.text == password2.text) {
        statusrequest = StatusRequest.loading;
        update();

        Map response = await crud.post(
          url: AppLinks.resetPassword,
          body: {
            if (username.isEmail) 'email': username,
            if (!username.isEmail) 'username': username,
            'password': password2.text,
          },
        );
        statusrequest = handlingStatus(response);
        update();

        if (statusrequest == StatusRequest.success) {
          Get.offAllNamed(AppRoutes.success);
        } else {
          Get.defaultDialog(title: 'error', content: Text(response['error']));
        }
      } else {
        Get.defaultDialog(title: 'warning', content: const Text('Verify your new password'));
      }
    }
  }

  @override
  void onInit() {
    password1 = TextEditingController();
    password2 = TextEditingController();
    username = Get.arguments['username'];
    super.onInit();
  }

  @override
  void onClose() {
    password1.dispose();
    password2.dispose();
    super.onClose();
  }
}

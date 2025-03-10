import 'package:online_shope_app/core/class/crud.dart';
import 'package:online_shope_app/core/constant/links.dart';
import 'package:online_shope_app/core/constant/routes.dart';
import 'package:online_shope_app/core/functions/handle_statuss.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SignUpControllerAll extends GetxController {
  signup();
  goToLogin();
  onPasswordTap();
}

class SignUpController extends SignUpControllerAll {
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController password1;
  late TextEditingController password2;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool? sucureText = true;

  StatusRequest? statusrequest;
  Crud crud = Get.find<Crud>();

  @override
  signup() async {
    if (formKey.currentState!.validate()) {
      statusrequest = StatusRequest.loading;
      update();

      Map response = await crud.post(
        url: AppLinks.signup,
        body: {
          'username': username.text,
          'email': email.text,
          'password1': password1.text,
          'password2': password2.text,
        },
      );

      statusrequest = handlingStatus(response);
      update();

      if (statusrequest == StatusRequest.success) {
        Get.offNamed(AppRoutes.checkCode, arguments: {'email': email.text, 'where': 'signup'});
      } else if (statusrequest == StatusRequest.failed) {
        Get.defaultDialog(title: 'warning', content: const Text('Email or Phone allredy existe!'));
      }
    }
  }

  @override
  goToLogin() {
    Get.offNamed(AppRoutes.login);
  }

  @override
  onPasswordTap() {
    sucureText = !sucureText!;
    update();
  }

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    password1 = TextEditingController();
    password2 = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    username.dispose();
    email.dispose();
    password1.dispose();
    password2.dispose();
    super.onClose();
  }
}

import 'package:online_shope_app/core/class/crud.dart';
import 'package:online_shope_app/core/constant/links.dart';
import 'package:online_shope_app/core/constant/routes.dart';
import 'package:online_shope_app/core/functions/handle_statuss.dart';
import 'package:online_shope_app/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  late TextEditingController username;
  late TextEditingController password;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Crud crud = Get.find<Crud>();

  bool? sucureText = true;
  StatusRequest? statusrequest;
  Myservices myservices = Get.find();

  login() async {
    if (formKey.currentState!.validate()) {
      statusrequest = StatusRequest.loading;
      update();

      Map response = await crud.post(
        url: AppLinks.login,
        body: {
          if (username.text.isEmail) 'email': username.text,
          if (!username.text.isEmail) 'username': username.text,
          'password': password.text,
        },
      );
      statusrequest = handlingStatus(response);
      update();

      if (statusrequest == StatusRequest.success) {
        await myservices.sharedpref.setInt('step', 2);
        await myservices.sharedpref.setString('id', response['user']['id'].toString());
        await myservices.sharedpref.setString('username', response['user']['username']);
        await myservices.sharedpref.setString('email', response['user']['email']);
        await myservices.sharedpref.setString('phone', response['user']['phone']);
        if (response['user']['is_active']) {
          Get.offAllNamed(AppRoutes.navBar);
        } else {
          Get.offNamed(AppRoutes.checkCode);
        }
      } else {
        Get.defaultDialog(title: 'Ooops', content: Text(response['error']));
      }
    }
  }

  forgetPass() {
    Get.toNamed(AppRoutes.checkEmeil);
  }

  goToSignup() {
    Get.offNamed(AppRoutes.signUp);
  }

  onPasswordTap() {
    sucureText = !sucureText!;
    update();
  }

  @override
  void onInit() {
    username = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    username.dispose();
    password.dispose();
    super.onClose();
  }
}

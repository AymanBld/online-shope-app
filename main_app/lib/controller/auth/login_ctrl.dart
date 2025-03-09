import 'package:online_shope_app/core/class/crud.dart';
import 'package:online_shope_app/core/constant/links.dart';
import 'package:online_shope_app/core/constant/routes.dart';
import 'package:online_shope_app/core/functions/handle_statuss.dart';
import 'package:online_shope_app/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class LoginControllerAll extends GetxController {
  login();
  goToSignup();
  forgetPass();
  onPasswordTap();
}

class LoginController extends LoginControllerAll {
  late TextEditingController email;
  late TextEditingController password;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Crud crud = Crud();

  bool? sucureText = true;
  StatusRequest? statusrequest;
  Myservices myservices = Get.find();

  @override
  login() async {
    if (formKey.currentState!.validate()) {
      statusrequest = StatusRequest.loading;
      update();

      Map response = await crud.post(
        url: AppLinks.login,
        body: {'username': email.text, 'password': password.text},
      );
      statusrequest = handlingStatus(response);
      update();

      if (statusrequest == StatusRequest.success) {
        Get.toNamed(AppRoutes.signUp);
        // if (response['data'][0]['user_verifyed'] == 1) {
        //   myservices.sharedpref.setInt('step', 2);
        //   myservices.sharedpref.setString(
        //     'id',
        //     response['data'][0]['user_id'].toString(),
        //   );
        //   myservices.sharedpref.setString(
        //     'username',
        //     response['data'][0]['user_name'],
        //   );
        //   myservices.sharedpref.setString(
        //     'email',
        //     response['data'][0]['user_email'],
        //   );
        //   myservices.sharedpref.setString(
        //     'phone',
        //     response['data'][0]['user_phone'],
        //   );
        //   Get.offAllNamed(AppRoutes.navBar);
        // } else {
        //   Get.offNamed(AppRoutes.checkCode);
        // }
      } else if (statusrequest == StatusRequest.failed) {
        Get.defaultDialog(
          title: 'warning',
          content: const Text('Email or password not correct'),
        );
      }
    }
  }

  @override
  forgetPass() {
    Get.toNamed(AppRoutes.checkEmeil);
  }

  @override
  goToSignup() {
    Get.offNamed(AppRoutes.signUp);
  }

  @override
  onPasswordTap() {
    sucureText = !sucureText!;
    update();
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    email.dispose();
    password.dispose();
    super.onClose();
  }
}

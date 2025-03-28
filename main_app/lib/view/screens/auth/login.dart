import 'package:online_shope_app/controller/auth/login_ctrl.dart';
import 'package:online_shope_app/core/constant/colors.dart';
import 'package:online_shope_app/core/functions/validatore.dart';
import 'package:online_shope_app/view/widgets/onboarding/app_bar.dart';
import 'package:online_shope_app/view/widgets/auth/custum_field.dart';
import 'package:online_shope_app/view/widgets/auth/haveaccount.dart';
import 'package:online_shope_app/view/widgets/auth/header.dart';
import 'package:online_shope_app/view/widgets/auth/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: const CustumAppBar(title: 'login'),
      body: GetBuilder<LoginController>(
        builder: (controller) => Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: controller.formKey,
            child: ListView(
              children: [
                Header(title: 'login t'.tr, subtitle: 'login s'.tr),
                const SizedBox(height: 30),
                CustumTextField(
                  control: controller.username,
                  type: TextInputType.emailAddress,
                  hint: 'Enter your Email or Username',
                  label: 'Username',
                  icon: Icons.person_outline,
                  valid: (val) {
                    return validate(val!, 'username');
                  },
                ),
                const SizedBox(height: 30),
                GetBuilder<LoginController>(
                  builder: (controller) => CustumTextField(
                    control: controller.password,
                    type: TextInputType.text,
                    ispassword: controller.sucureText,
                    hint: 'pass h'.tr,
                    label: 'pass lb'.tr,
                    icon: Icons.lock_outline,
                    valid: (val) {
                      return validate(val!, 'password', min: 8);
                    },
                    onPasswordTap: () {
                      controller.onPasswordTap();
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      controller.forgetPass();
                    },
                    child: Text(
                      'forget'.tr,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                CustumButton(
                  text: 'login',
                  ontap: () {
                    controller.login();
                  },
                ),
                const SizedBox(height: 30),
                CustumHaveAccount(
                  pageToGo: 'signup'.tr,
                  textBefor: 'goto l'.tr,
                  onTap: () {
                    controller.goToSignup();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

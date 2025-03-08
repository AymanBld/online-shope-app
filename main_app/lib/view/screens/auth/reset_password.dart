import 'package:online_shope_app/controller/auth/resetpassword_ctrl.dart';
import 'package:online_shope_app/core/class/handling_states.dart';
import 'package:online_shope_app/core/constant/colors.dart';
import 'package:online_shope_app/core/functions/validatore.dart';
import 'package:online_shope_app/view/widgets/onboarding/app_bar.dart';
import 'package:online_shope_app/view/widgets/auth/custum_field.dart';
import 'package:online_shope_app/view/widgets/auth/header.dart';
import 'package:online_shope_app/view/widgets/auth/button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordCtrl());

    return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        appBar: CustumAppBar(title: 'reset t'.tr),
        body: GetBuilder<ResetPasswordCtrl>(
          builder: (controller) => HandlingStates(
            status: controller.statusrequest,
            widget: Padding(
              padding: const EdgeInsets.all(30),
              child: Form(
                key: controller.formKey,
                child: ListView(
                  children: [
                    Header(
                      title: 'reset t'.tr,
                      subtitle: 'reset s'.tr,
                    ),
                    const SizedBox(height: 60),
                    CustumTextField(
                      control: controller.password,
                      type: TextInputType.name,
                      valid: (val) {
                        return validate(val!, 'password', min: 8);
                      },
                      hint: 'pass h'.tr,
                      label: 'pass lb'.tr,
                      icon: Icons.lock_open_outlined,
                    ),
                    CustumTextField(
                      control: controller.resetpassword,
                      type: TextInputType.name,
                      valid: (val) {
                        return validate(val!, 'password', min: 8);
                      },
                      hint: 'pass h'.tr,
                      label: 'pass lb'.tr,
                      icon: Icons.lock_outline,
                    ),
                    CustumButton(
                      text: 'save'.tr,
                      ontap: () {
                        controller.resetPass();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

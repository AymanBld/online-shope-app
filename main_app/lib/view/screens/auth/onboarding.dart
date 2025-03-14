import 'package:online_shope_app/controller/onboarding_ctrl.dart';
import 'package:online_shope_app/core/constant/colors.dart';
import 'package:online_shope_app/view/widgets/auth/button.dart';
import 'package:online_shope_app/view/widgets/onboarding/dotcontroller.dart';
import 'package:online_shope_app/view/widgets/onboarding/pageview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    OnboardingController controller = Get.put(OnboardingController());
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              const Expanded(
                flex: 7,
                child: CustumPageView(),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    const CustomDotController(),
                    const Spacer(),
                    CustumButton(
                      text: '1'.tr,
                      ontap: () {
                        controller.next();
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

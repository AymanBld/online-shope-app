import 'package:online_shope_app/core/constant/routes.dart';
import 'package:online_shope_app/core/services/services.dart';
import 'package:online_shope_app/core/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class OnboardingController extends GetxController {
  int currentPage = 0;
  PageController pageCtrl = PageController();
  Myservices myservices = Get.find();

  next() {
    if (currentPage == onboardingList.length - 1) {
      myservices.sharedpref.setInt('step', 1);
      Get.offAllNamed(AppRoutes.login);
    } else {
      pageCtrl.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  onPageChanged(index) {
    currentPage = index;
    update();
  }
}

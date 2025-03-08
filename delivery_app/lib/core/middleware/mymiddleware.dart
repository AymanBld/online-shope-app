import 'package:deleviry_app/core/constant/routes.dart';
import 'package:deleviry_app/core/services/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Mymiddleware extends GetMiddleware {
  Myservices myservices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    if (myservices.sharedpref.getInt('step') == 1) {
      if (route == AppRoutes.navBar) {
        return const RouteSettings(name: AppRoutes.navBar);
      }
    }
    return null;
  }
}

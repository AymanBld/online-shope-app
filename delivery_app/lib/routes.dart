import 'package:deleviry_app/core/constant/routes.dart';
import 'package:deleviry_app/core/middleware/mymiddleware.dart';
import 'package:deleviry_app/view/screen/auth/check_code.dart';
import 'package:deleviry_app/view/screen/auth/chek_email.dart';
import 'package:deleviry_app/view/screen/auth/login.dart';
import 'package:deleviry_app/view/screen/auth/reset_password.dart';
import 'package:deleviry_app/view/screen/auth/success.dart';
import 'package:deleviry_app/view/screen/home/home.dart';
import 'package:deleviry_app/view/screen/home/order_details.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>> routes = [
  GetPage(name: '/', page: () => const NavBar()),
  GetPage(name: '/', page: () => const Login(), middlewares: [Mymiddleware()]),

  //auth
  GetPage(name: AppRoutes.login, page: () => const Login()),
  GetPage(name: AppRoutes.checkCode, page: () => const CheckCode()),
  GetPage(name: AppRoutes.checkEmeil, page: () => const CheckEmail()),
  GetPage(name: AppRoutes.resetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRoutes.success, page: () => const Success()),

  GetPage(name: AppRoutes.orderDetails, page: () => const OrderDetails()),
];

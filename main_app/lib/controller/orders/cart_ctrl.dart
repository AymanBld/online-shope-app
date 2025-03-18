import 'package:online_shope_app/core/class/crud.dart';
import 'package:online_shope_app/core/constant/links.dart';
import 'package:online_shope_app/core/constant/routes.dart';
import 'package:online_shope_app/core/functions/handle_statuss.dart';
import 'package:online_shope_app/core/services/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CartCtrl extends GetxController {
  Crud crud = Get.find<Crud>();
  Myservices myservices = Get.find();
  StatusRequest statusrequest = StatusRequest.loading;
  StatusRequest statusRqCoupon = StatusRequest.failed;
  late TextEditingController couponCtrl;

  // in the cart screen
  List cartProducts = [];
  int totalCount = 0;
  double subTotal = 0;
  double totalPrice = 0;
  int couponDiscount = 0;
  int couponId = 0;

  // in the check out  screen
  List addressList = [];
  int? address;
  int? payment;

  @override
  void onInit() {
    couponCtrl = TextEditingController();
    fetchCart();
    getAddress();
    super.onInit();
  }

  @override
  void onClose() {
    couponCtrl.dispose();
    super.onClose();
  }

  Future<void> fetchCart() async {
    Map response = await crud.get(url: AppLinks.getCart);
    statusrequest = handlingStatus(response);

    if (statusrequest == StatusRequest.success) {
      cartProducts = response['data'];
      setFinalValues();
    } else {
      Get.defaultDialog(title: 'Ooops', middleText: response['error']);
    }
    update();
  }

  Future<void> modifyQuantity(int id, int val) async {
    if (val != 0) {
      crud.patch(url: AppLinks.updateRemoveCart, queryPar: '$id/', body: {'quantity': val.toString()});
      cartProducts.firstWhere((cartpr) => cartpr['id'] == id)['quantity'] = val;
    } else {
      crud.delete(url: AppLinks.updateRemoveCart, queryPar: '$id/');
      cartProducts.removeWhere((cartpr) => cartpr['id'] == id);
    }
    setFinalValues();
    update();
  }

  Future<void> checkCoupon() async {
    statusRqCoupon = StatusRequest.loading;
    update();

    Map response = await crud.post(url: AppLinks.checkCoupon, body: {'coupon': couponCtrl.text});
    statusRqCoupon = handlingStatus(response);

    if (statusRqCoupon == StatusRequest.success) {
      couponDiscount = response['discount'];
      couponId = response['id'];
    } else {
      couponDiscount = 0;
    }
    setFinalValues();
    update();
  }

  void setFinalValues() {
    totalCount = 0;
    subTotal = 0;
    for (Map pr in cartProducts) {
      totalCount += pr['quantity'] as int;
      subTotal += pr['product']['discountedPrice'] * pr['quantity'];
    }
    double x = subTotal * (1 - couponDiscount / 100);
    subTotal = double.parse((x.toStringAsFixed(2)));
    totalPrice = double.parse((x.toStringAsFixed(2)));
  }

  // In the check out screen ----------------------------------------------------

  checkOut() {
    if (cartProducts.isNotEmpty) {
      Get.toNamed(AppRoutes.checkOut);
    }
  }

  Future<void> getAddress() async {
    Map response = await crud.get(url: AppLinks.address);

    if (handlingStatus(response) == StatusRequest.success) {
      addressList = response['data'];
    }
    update();
  }

  changePayment(int val) {
    payment = val;
    update();
  }

  changeAdr(int value) {
    address = value;
    update();
  }

  Future<void> buyNow() async {
    if (payment != null && address != null) {
      Map response = await crud.post(
        url: AppLinks.checkOut,
        body: {
          "total_price": totalPrice.toString(),
          "quantity": totalCount.toString(),
          "payment_method": payment.toString(),
          "user": myservices.sharedpref.getString('id'),
          "address": address.toString(),
          if (couponId != 0) "coupon": couponId.toString(),
        },
      );
      if (handlingStatus(response) == StatusRequest.success) {
        Get.offNamedUntil(AppRoutes.cart, ModalRoute.withName(AppRoutes.navBar));
      }
    }
  }
}

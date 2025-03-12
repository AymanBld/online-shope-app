import 'package:online_shope_app/controller/orders/cart_ctrl.dart';
import 'package:online_shope_app/model/products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProductCtrl extends GetxController {
  late ProductModel pr;
  CartCtrl cartCtrl = CartCtrl();
  int contityToAdd = 0;

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  initData() {
    pr = Get.arguments['product'];
  }

  addToCart() async {
    Map response = await cartCtrl.updat(pr.id.toString(), contityToAdd);
    if (response['status'] == 'success') {
      Get.snackbar(
        'succes',
        'product added to your cart',
        duration: const Duration(seconds: 2),
        snackPosition: SnackPosition.BOTTOM,
        barBlur: 80,
        margin: const EdgeInsets.only(bottom: 50),
        maxWidth: 300,
      );
    }
  }
}

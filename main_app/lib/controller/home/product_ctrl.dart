import 'package:online_shope_app/controller/orders/cart_ctrl.dart';
import 'package:online_shope_app/core/class/crud.dart';
import 'package:online_shope_app/core/constant/links.dart';
import 'package:online_shope_app/core/functions/handle_statuss.dart';
import 'package:online_shope_app/model/products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ProductCtrl extends GetxController {
  Crud crud = Get.find<Crud>();
  late ProductModel pr;
  CartCtrl cartCtrl = CartCtrl();
  int quantityToAdd = 0;

  @override
  void onInit() {
    pr = Get.arguments['product'];
    super.onInit();
  }

  Future<void> addToCart() async {
    if (quantityToAdd == 0) return;
    Map response = await crud.post(
      url: AppLinks.addCart,
      body: {'product': pr.id.toString(), 'quantity': quantityToAdd.toString()},
    );

    if (handlingStatus(response) == StatusRequest.success) {
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

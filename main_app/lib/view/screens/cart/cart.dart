import 'package:online_shope_app/controller/orders/cart_ctrl.dart';
import 'package:online_shope_app/core/class/handling_states.dart';
import 'package:online_shope_app/core/constant/colors.dart';
import 'package:online_shope_app/view/widgets/cart/bottom_bar_cart.dart';
import 'package:online_shope_app/view/widgets/cart/product_card.dart';
import 'package:online_shope_app/view/widgets/onboarding/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: const CustumAppBar(title: 'Cart'),
      body: GetBuilder<CartCtrl>(
        init: CartCtrl(),
        builder: (controller) {
          return HandlingStates(
            status: controller.statusrequest,
            widget: const CartProduct(),
          );
        },
      ),
      bottomNavigationBar: const BottomBarCart(),
    );
  }
}

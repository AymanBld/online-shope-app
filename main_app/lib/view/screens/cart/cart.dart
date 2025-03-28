import 'package:online_shope_app/controller/orders/cart_ctrl.dart';
import 'package:online_shope_app/core/constant/colors.dart';
import 'package:online_shope_app/view/widgets/cart/bottom_bar_titles_.dart';
import 'package:online_shope_app/view/widgets/cart/bottom_price_button.dart';
import 'package:online_shope_app/view/widgets/cart/coupon_field.dart';
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
      body: CartProducts(),
      bottomNavigationBar: GetBuilder<CartCtrl>(
        builder:
            (controller) => Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(color: Colors.grey[300]!, blurRadius: 20, offset: const Offset(0, -10))],
              ),
              height: 300,
              width: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CouponField(),
                  BottomTitles(firstTitle: 'You have', secondTitle: '${controller.totalCount} products'),
                  BottomTitles(firstTitle: 'Sub total', secondTitle: '${controller.subTotal}'),
                  BottomTitles(firstTitle: 'Discount', secondTitle: '${controller.couponDiscount}%'),
                  const BottomPriceButton(),
                ],
              ),
            ),
      ),
    );
  }
}

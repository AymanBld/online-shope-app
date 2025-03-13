import 'package:online_shope_app/controller/orders/cart_ctrl.dart';
import 'package:online_shope_app/core/constant/colors.dart';
import 'package:online_shope_app/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartProduct extends StatelessWidget {
  const CartProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartCtrl>(
      builder:
          (controller) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ListView.separated(
              itemCount: controller.cartProducts.length,
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                CartModel cartpr = CartModel.fromJson(controller.cartProducts[index]);
                return Card(
                  elevation: 3,
                  color: AppColor.primryColorLight,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 110,
                        child: Image.asset(
                          // pr.productImage!,
                          'assets/pngs/iphone.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text(cartpr.product.name),
                          subtitle: Text(cartpr.product.discount.toString()),
                        ),
                      ),
                      SizedBox(
                        height: 130,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () async {
                                await controller.updat(cartpr.id.toString(), 1);
                                await controller.get();
                              },
                              icon: const Icon(Icons.add),
                            ),
                            Text(
                              '${cartpr.quantity}',
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                              onPressed: () async {
                                if (cartpr.quantity == 1) {
                                  await controller.remove(cartpr.id.toString());
                                } else {
                                  await controller.updat(cartpr.id.toString(), -1);
                                }
                                await controller.get();
                              },
                              icon: const Icon(Icons.minimize),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
                );
              },
            ),
          ),
    );
  }
}

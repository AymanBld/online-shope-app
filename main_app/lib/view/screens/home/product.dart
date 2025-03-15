import 'package:online_shope_app/controller/home/product_ctrl.dart';
import 'package:online_shope_app/core/constant/colors.dart';
import 'package:online_shope_app/view/widgets/auth/button.dart';
import 'package:online_shope_app/view/widgets/home/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Product extends StatelessWidget {
  const Product({super.key});

  @override
  Widget build(BuildContext context) {
    ProductCtrl controller = Get.put(ProductCtrl());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const HomeAppBar(),
      bottomNavigationBar: Container(
        alignment: Alignment.center,
        color: AppColor.primryColorLight,
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GetBuilder<ProductCtrl>(
              builder:
                  (controller) =>
                      Text('${controller.pr.discountedPrice}\$', style: Theme.of(context).textTheme.titleMedium),
            ),
            SizedBox(
              width: Get.width * 0.4,
              child: CustumButton(text: 'Add To Cart', ontap: () => controller.addToCart()),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: Get.height * 0.4,
            padding: const EdgeInsets.all(50),
            child: Image.asset('assets/pngs/iphone.png'),
          ),
          Container(
            width: double.infinity,
            height: Get.height * 0.4,
            decoration: const BoxDecoration(
              color: AppColor.primryColorLight,
              borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Text(controller.pr.name, style: Theme.of(context).textTheme.titleMedium),
                  Text(controller.pr.description),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          controller.quantityToAdd++;
                          controller.update();
                        },
                        icon: const Icon(Icons.add),
                      ),
                      GetBuilder<ProductCtrl>(builder: (controller) => Text('${controller.quantityToAdd}')),
                      IconButton(
                        onPressed: () {
                          if (controller.quantityToAdd != 0) {
                            controller.quantityToAdd--;
                            controller.update();
                          }
                        },
                        icon: const Icon(Icons.remove),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

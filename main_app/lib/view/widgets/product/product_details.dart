import 'package:online_shope_app/controller/home/product_ctrl.dart';
import 'package:online_shope_app/core/constant/colors.dart';
import 'package:online_shope_app/view/widgets/product/counter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends GetView<ProductCtrl> {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            Text(controller.pr.discount * 10),
            const SizedBox(height: 10),
            const Counter(),
          ],
        ),
      ),
    );
  }
}

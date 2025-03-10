import 'package:online_shope_app/controller/home/product_ctrl.dart';
import 'package:online_shope_app/view/widgets/home/appbar.dart';
import 'package:online_shope_app/view/widgets/product/bottom_botton.dart';
import 'package:online_shope_app/view/widgets/product/product_details.dart';
import 'package:online_shope_app/view/widgets/product/product_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Product extends StatelessWidget {
  const Product({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductCtrl());
    return Scaffold(
      appBar: const HomeAppBar(),
      backgroundColor: Colors.white,
      body: ListView(
        children: const [
          ProductImage(),
          ProductDetails(),
        ],
      ),
      bottomNavigationBar: const BottomProductPrice(),
    );
  }
}

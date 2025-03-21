import 'package:online_shope_app/controller/orders/cart_ctrl.dart';
import 'package:online_shope_app/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LableChoic extends GetView<CartCtrl> {
  final String text;
  final bool isSelected;
  final void Function()? onPress;
  const LableChoic({
    super.key,
    required this.text,
    required this.isSelected,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        width: Get.width * 0.4,
        height: 70,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? AppColor.primryColorDark : AppColor.primryColorLight,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            color: isSelected ? Colors.white : Colors.grey[600],
          ),
        ),
      ),
    );
  }
}

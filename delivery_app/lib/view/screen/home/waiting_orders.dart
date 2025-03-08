import 'package:deleviry_app/controller/home/waiting_orders_ctrl.dart';
import 'package:deleviry_app/core/class/handling_states.dart';
import 'package:deleviry_app/core/constant/colors.dart';
import 'package:deleviry_app/view/widget/auth/app_bar.dart';
import 'package:deleviry_app/view/widget/home/wating_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Waiting extends StatelessWidget {
  const Waiting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: const CustumAppBar(title: 'Pending Orders'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: GetBuilder<WaitingOrdersCtrl>(
          init: WaitingOrdersCtrl(),
          builder:
              (controller) => HandlingStates(
                status: controller.statusrequest,
                widget: ListView.separated(
                  itemCount: controller.orders.length,
                  separatorBuilder:
                      (context, index) => const SizedBox(height: 10),
                  itemBuilder:
                      (context, index) =>
                          WatingCard(rdr: controller.orders[index]),
                ),
              ),
        ),
      ),
    );
  }
}

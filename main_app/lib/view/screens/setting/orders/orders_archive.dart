import 'package:online_shope_app/controller/orders/orders_archive_ctrl.dart';
import 'package:online_shope_app/core/constant/colors.dart';
import 'package:online_shope_app/model/order_model.dart';
import 'package:online_shope_app/view/widgets/orders/archive_card.dart';
import 'package:online_shope_app/view/widgets/onboarding/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersArchive extends StatelessWidget {
  const OrdersArchive({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: const CustumAppBar(title: 'Orders'),
      body: GetBuilder<OrdersArchiveCtrl>(
        init: OrdersArchiveCtrl(),
        builder: (controller) => ListView.separated(
          itemCount: controller.ordersList.length,
          separatorBuilder: (context, index) => const SizedBox(height: 10),
          itemBuilder: (context, index) {
            OrderModel ordr = OrderModel.fromJson(controller.ordersList[index]);
            return ArchiveCard(rdr: ordr);
          },
        ),
      ),
    );
  }
}

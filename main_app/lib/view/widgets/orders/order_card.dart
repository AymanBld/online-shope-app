import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:online_shope_app/controller/orders/order_ctrl.dart';
import 'package:online_shope_app/core/constant/colors.dart';
import 'package:online_shope_app/model/order_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class OrderCard extends GetView<OrderCtrl> {
  final OrderModel rdr;
  const OrderCard({required this.rdr, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: AppColor.primryColorLight,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Order code:', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Total price:', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Number of products:', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Order address:', style: TextStyle(fontWeight: FontWeight.bold)),
                    Text('Order status:', style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('${rdr.id}'),
                    Text('${rdr.totalPrice}'),
                    Text('${rdr.quantity}'),
                    Text('${rdr.address}'),
                    Text(controller.decodeStatus(rdr.status)),
                  ],
                ),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                rdr.status == 1
                    ? IconButton(
                      onPressed: () {
                        Get.defaultDialog(
                          title: 'warning',
                          middleText: 'Do you rely want to delet this order',
                          onConfirm: () {
                            controller.deleteOrder(rdr.id);
                          },
                          onCancel: () {},
                        );
                      },
                      iconSize: 28,
                      color: AppColor.primryColorDark,
                      icon: const Icon(Icons.delete),
                    )
                    : const SizedBox(),
                FilledButton(
                  style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(AppColor.primryColorDark)),
                  onPressed: () {
                    controller.onOrderDetailsTap(rdr.id);
                  },
                  child: const Text('Detailes'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

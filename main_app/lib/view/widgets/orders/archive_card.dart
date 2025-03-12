import 'package:online_shope_app/controller/orders/orders_archive_ctrl.dart';
import 'package:online_shope_app/core/constant/colors.dart';
import 'package:online_shope_app/model/order_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class ArchiveCard extends GetView<OrdersArchiveCtrl> {
  final OrderModel rdr;
  const ArchiveCard({required this.rdr, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: AppColor.primryColorLight,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Order code:'),
                    Text('Total price:'),
                    Text('Number of products:'),
                    Text('Order address:'),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('${rdr.id}'),
                    Text('${rdr.totalPrice}'),
                    Text('${rdr.quantity}'),
                    Text('${rdr.address}'),
                  ],
                ),
              ],
            ),
            const Divider(),
            Row(
              children: [
                const Spacer(),
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

import 'package:online_shope_app/controller/orders/cart_ctrl.dart';
import 'package:online_shope_app/core/constant/colors.dart';
import 'package:online_shope_app/model/address_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class AddressChose extends StatelessWidget {
  const AddressChose({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartCtrl>(
      builder:
          (controller) => DropdownButton<int>(
            value: controller.address,
            itemHeight: 90,
            isExpanded: true,
            elevation: 0,
            dropdownColor: Colors.transparent,
            icon: const Icon(Icons.keyboard_arrow_down, color: AppColor.primryColorDark, size: 30),
            hint: const Text('Chose Address'),
            items: List.generate(controller.addressList.length, (index) {
              AddressModel adr = AddressModel.fromJson(controller.addressList[index]);
              return DropdownMenuItem(
                value: adr.id,
                child: Container(
                  decoration: BoxDecoration(color: AppColor.primryColorDark, borderRadius: BorderRadius.circular(20)),
                  child: ListTile(
                    titleTextStyle: const TextStyle(color: Colors.white, fontSize: 18),
                    subtitleTextStyle: const TextStyle(color: Colors.white, fontSize: 13),
                    title: Text(adr.name),
                    subtitle: Text('${adr.city}, ${adr.street}'),
                  ),
                ),
              );
            }),
            onChanged: (value) {
              controller.changeAdr(value!);
            },
          ),
    );
  }
}

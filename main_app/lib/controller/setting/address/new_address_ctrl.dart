import 'package:online_shope_app/controller/setting/address/address_ctrl.dart';
import 'package:online_shope_app/core/class/crud.dart';
import 'package:online_shope_app/core/constant/links.dart';
import 'package:online_shope_app/core/constant/routes.dart';
import 'package:online_shope_app/core/functions/handle_statuss.dart';
import 'package:online_shope_app/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewAddressCtrl extends GetxController {
  late TextEditingController name;
  late TextEditingController city;
  late TextEditingController street;

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  Myservices myservices = Get.find();
  Crud crud = Get.find<Crud>();

  @override
  void onInit() {
    name = TextEditingController();
    city = TextEditingController();
    street = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    name.dispose();
    city.dispose();
    street.dispose();
    super.onClose();
  }

  void onSave() {
    if (formkey.currentState!.validate()) {
      Get.toNamed(AppRoutes.addressPosition);
    }
  }

  Future<void> addAddress() async {
    await crud.post(
      url: AppLinks.address,
      body: {
        'name': name.text,
        'city': city.text,
        'street': street.text,
        'lat': ' 22.2',
        'lang': '22.0909',
        'user': myservices.sharedpref.getString('id'),
      },
    );
    Get.offNamedUntil(AppRoutes.address, ModalRoute.withName(AppRoutes.navBar));
  }
}

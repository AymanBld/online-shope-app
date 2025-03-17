import 'package:online_shope_app/core/class/crud.dart';
import 'package:online_shope_app/core/constant/colors.dart';
import 'package:online_shope_app/core/constant/links.dart';
import 'package:online_shope_app/core/functions/handle_statuss.dart';
import 'package:online_shope_app/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressCtrl extends GetxController {
  Myservices myservices = Get.find();
  StatusRequest statusRequest = StatusRequest.failed;
  Crud crud = Get.find<Crud>();

  List addressList = [];

  @override
  void onInit() {
    getAddress();
    super.onInit();
  }

  getAddress() async {
    statusRequest = StatusRequest.loading;
    update();

    Map response = await crud.get(url: AppLinks.address);
    statusRequest = handlingStatus(response);
    if (statusRequest == StatusRequest.success) {
      addressList = response['data'];
    }
    update();
  }

  removeAddress(int id, String name) {
    Get.defaultDialog(
      title: 'Attention',
      middleText: 'Do you want to delete your address: \'$name\'',
      contentPadding: const EdgeInsets.all(20),
      buttonColor: AppColor.primryColor,
      onCancel: () {},
      onConfirm: () {
        crud.delete(url: AppLinks.address, queryPar: '$id/');
        addressList.removeWhere((e) => e['id'] == id);
        update();
        Get.back();
      },
    );
  }
}

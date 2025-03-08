import 'package:online_shope_app/core/class/crud.dart';
import 'package:online_shope_app/core/constant/links.dart';
import 'package:online_shope_app/core/constant/routes.dart';
import 'package:online_shope_app/core/functions/handle_statuss.dart';
import 'package:online_shope_app/core/services/services.dart';
import 'package:online_shope_app/data/model/products_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SearchCtrlAll extends GetxController {
  getproducts();
  onTapCard(ProductModel pr);
  onSearch() {}
}

class SearchCtrl extends SearchCtrlAll {
  Myservices myservices = Get.find();
  StatusRequest statusrequest = StatusRequest.failed;
  Crud crud = Crud();

  late TextEditingController searchCtrl;
  List productsFound = [];
  late String nameSearched;

  @override
  void onInit() {
    searchCtrl = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    searchCtrl.dispose();
    super.onClose();
  }

  @override
  getproducts() async {
    statusrequest = StatusRequest.loading;
    update();

    Map response = await crud.postData(
      AppLinks.search,
      {
        'name_search': nameSearched,
        'user_id': myservices.sharedpref.getString('id'),
      },
    );
    statusrequest = handlingStatus(response);

    if (statusrequest == StatusRequest.success) {
      productsFound = response['data'];
    }

    update();
  }

  @override
  onTapCard(pr) {
    Get.toNamed(
      AppRoutes.product,
      arguments: {'product': pr},
    );
  }

  @override
  onSearch() {
    if (searchCtrl.text.isNotEmpty) {
      nameSearched = searchCtrl.text;
      Get.toNamed(AppRoutes.search);
      getproducts();
    }
    FocusScope.of(Get.context!).unfocus();
  }
}

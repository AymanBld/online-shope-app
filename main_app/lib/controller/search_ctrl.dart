import 'package:online_shope_app/core/class/crud.dart';
import 'package:online_shope_app/core/constant/links.dart';
import 'package:online_shope_app/core/constant/routes.dart';
import 'package:online_shope_app/core/functions/handle_statuss.dart';
import 'package:online_shope_app/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:online_shope_app/model/products_model.dart';

class SearchCtrl extends GetxController {
  Myservices myservices = Get.find();
  StatusRequest statusrequest = StatusRequest.failed;
  Crud crud = Get.find<Crud>();

  late TextEditingController searchField;
  List productsFound = [];

  @override
  void onInit() {
    searchField = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    searchField.dispose();
    super.onClose();
  }

  Future<void> searchProducts() async {
    statusrequest = StatusRequest.loading;
    update();

    Map response = await crud.get(url: AppLinks.search, queryPar: '?product-name=${searchField.text}');
    statusrequest = handlingStatus(response);

    if (statusrequest == StatusRequest.success) {
      productsFound = response['data'];
    }
    update();
  }

  Future<void> goSearch() async {
    if (searchField.text.isNotEmpty) {
      Get.toNamed(AppRoutes.search);
      await searchProducts();
    }
  }

  void addFav(ProductModel pr) {
    crud.post(url: AppLinks.favorite, queryPar: '${pr.id.toString()}/');
    productsFound.firstWhere((e) => e['id'] == pr.id)['is_favorite'] = true;
    update();
  }

  void removeFav(ProductModel pr) {
    crud.delete(url: AppLinks.favorite, queryPar: '${pr.id.toString()}/');
    productsFound.firstWhere((e) => e['id'] == pr.id)['is_favorite'] = false;
    update();
  }

  onTapCard(pr) {
    Get.toNamed(AppRoutes.product, arguments: {'product': pr});
  }
}

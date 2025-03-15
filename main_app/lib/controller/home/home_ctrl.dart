import 'package:online_shope_app/core/class/crud.dart';
import 'package:online_shope_app/core/constant/links.dart';
import 'package:online_shope_app/core/constant/routes.dart';
import 'package:get/get.dart';
import 'package:online_shope_app/core/functions/handle_statuss.dart';

class HomeCtrl extends GetxController {
  StatusRequest statusrequest = StatusRequest.loading;
  Crud crud = Get.find<Crud>();

  List categories = [];
  List products = [];

  @override
  Future<void> onInit() async {
    await fetchCategories();
    await fetchDeals();
    super.onInit();
  }

  Future<void> fetchDeals() async {
    Map responseDeal = await crud.get(url: AppLinks.dealProducts);
    statusrequest = handlingStatus(responseDeal);
    update();

    if (statusrequest == StatusRequest.success) {
      products.addAll(responseDeal['data']);
    } else {}
    update();
  }

  Future<void> fetchCategories() async {
    Map responseCategory = await crud.get(url: AppLinks.category);
    statusrequest = handlingStatus(responseCategory);
    update();

    if (statusrequest == StatusRequest.success) {
      categories.addAll(responseCategory['data']);
    } else {}
    update();
  }

  onTapCat(id) {
    Get.toNamed(AppRoutes.categories, arguments: {'categories': categories, 'selected_cat': id});
  }
}

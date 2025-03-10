import 'package:online_shope_app/core/class/crud.dart';
import 'package:online_shope_app/core/constant/links.dart';
import 'package:online_shope_app/core/constant/routes.dart';
import 'package:online_shope_app/core/functions/handle_statuss.dart';
import 'package:get/get.dart';

abstract class HomeCtrlAll extends GetxController {
  initData();
  onTapCat(int id);
}

class HomeCtrl extends HomeCtrlAll {
  StatusRequest statusrequest = StatusRequest.loading;
  Crud crud = Get.find<Crud>();

  List categories = [];
  List products = [];

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  @override
  initData() async {
    Map response = await crud.post(url: AppLinks.home, body: {});
    statusrequest = handlingStatus(response);
    update();

    if (statusrequest == StatusRequest.success) {
      categories.addAll(response['categories']);
      products.addAll(response['products']);
      update();
    } else {}
  }

  @override
  onTapCat(id) {
    Get.toNamed(AppRoutes.categories, arguments: {'categories': categories, 'selected_cat': id});
  }
}

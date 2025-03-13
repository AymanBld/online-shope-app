import 'package:online_shope_app/core/class/crud.dart';
import 'package:online_shope_app/core/constant/links.dart';
import 'package:online_shope_app/core/constant/routes.dart';
import 'package:online_shope_app/core/functions/handle_statuss.dart';
import 'package:online_shope_app/core/services/services.dart';
import 'package:get/get.dart';
import 'package:online_shope_app/model/products_model.dart';

class MyFavoriteCtrl extends GetxController {
  Crud crud = Get.find<Crud>();
  Myservices myservices = Get.find();
  StatusRequest statusrequest = StatusRequest.loading;

  List favProducts = [];

  @override
  void onInit() {
    getFavorites();
    super.onInit();
  }

  Future<void> getFavorites() async {
    Map response = await crud.get(url: AppLinks.manageFav);
    statusrequest = handlingStatus(response);

    if (statusrequest == StatusRequest.success) {
      favProducts.addAll(response['data']);
    }
    update();
  }

  void removeFav(ProductModel pr) {
    crud.delete(url: AppLinks.manageFav, queryPar: '${pr.id.toString()}/');
    favProducts.removeWhere((product) => product['id'] == pr.id);
    update();
  }

  void onTapCard(pr) {
    Get.toNamed(AppRoutes.product, arguments: {'product': pr});
  }
}

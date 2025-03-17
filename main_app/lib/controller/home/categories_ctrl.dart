import 'package:online_shope_app/core/class/crud.dart';
import 'package:online_shope_app/core/constant/links.dart';
import 'package:online_shope_app/core/constant/routes.dart';
import 'package:online_shope_app/core/functions/handle_statuss.dart';
import 'package:online_shope_app/core/services/services.dart';
import 'package:get/get.dart';
import 'package:online_shope_app/model/products_model.dart';

class CategoriesCtrl extends GetxController {
  Myservices myservices = Get.find();
  StatusRequest statusrequest = StatusRequest.loading;
  Crud crud = Get.find<Crud>();

  List categories = [];
  List productsOfCat = [];
  late int selectedcat;

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  void initData() {
    categories = Get.arguments['categories'];
    selectedcat = Get.arguments['selected_cat'];
    getproducts();
  }

  Future<void> getproducts() async {
    Map response = await crud.get(url: AppLinks.productsByCategory, queryPar: '$selectedcat/');
    statusrequest = handlingStatus(response);
    update();

    if (statusrequest == StatusRequest.success) {
      productsOfCat = response['data'];
      update();
    }
  }

  void changeCat(id) {
    selectedcat = id;
    getproducts();
    update();
  }

  void addFav(ProductModel pr) {
    crud.post(url: AppLinks.favorite, queryPar: '${pr.id.toString()}/');
    productsOfCat.firstWhere((e) => e['id'] == pr.id)['is_favorite'] = true;
    update();
  }

  void removeFav(ProductModel pr) {
    crud.delete(url: AppLinks.favorite, queryPar: '${pr.id.toString()}/');
    productsOfCat.firstWhere((e) => e['id'] == pr.id)['is_favorite'] = false;
    update();
  }

  void onTapCard(pr) {
    Get.toNamed(AppRoutes.product, arguments: {'product': pr});
  }
}

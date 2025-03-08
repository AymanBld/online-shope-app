import 'package:online_shope_app/core/class/crud.dart';
import 'package:online_shope_app/core/constant/links.dart';
import 'package:online_shope_app/core/functions/handle_statuss.dart';
import 'package:online_shope_app/core/services/services.dart';
import 'package:get/get.dart';

class MyFavoriteCtrl extends GetxController {
  Crud crud = Crud();
  Myservices myservices = Get.find();
  StatusRequest statusrequest = StatusRequest.loading;

  List favProducts = [];

  @override
  void onInit() {
    getFavorites();
    super.onInit();
  }

  getFavorites() async {
    Map response = await crud.post(
      url:AppLinks.getFavs,
      body: {'user_id': myservices.sharedpref.getString('id')},
    );
    statusrequest = handlingStatus(response);

    if (statusrequest == StatusRequest.success) {
      favProducts.addAll(response['data']);
    }
    update();
  }

  removeFav(int id) {
    crud.post(
     url: AppLinks.manageFav,
      body: {
        'user_id': myservices.sharedpref.getString('id'),
        'product_id': id.toString(),
      },
    );

    favProducts.removeWhere((pr) => pr['product_id'] == id);

    update();
  }
}

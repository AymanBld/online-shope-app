import 'package:online_shope_app/core/class/crud.dart';
import 'package:online_shope_app/core/constant/links.dart';
import 'package:online_shope_app/core/services/services.dart';
import 'package:get/get.dart';

class FavoriteCtrl extends GetxController {
  Crud crud = Crud();
  Myservices myservices = Get.find();
  Map productsfav = {};

  changFav(id, val) {
    productsfav[id] = val;
    update();
  }

  removeFav(String id) {
    crud.post(url:AppLinks.manageFav,body:  {
      'user_id': myservices.sharedpref.getString('id'),
      'product_id': id,
    });
  }

  addFav(String id) {
    crud.post(url:AppLinks.manageFav,body:  {
      'user_id': myservices.sharedpref.getString('id'),
      'product_id': id,
    });
  }
}

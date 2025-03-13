import 'package:online_shope_app/core/class/crud.dart';
import 'package:online_shope_app/core/services/services.dart';
import 'package:get/get.dart';

class FavoriteCtrl extends GetxController {
  Crud crud = Get.find<Crud>();
  Myservices myservices = Get.find();
  Map productsfav = {};

  changFav(id, val) {
    productsfav[id] = val;
    update();
  }

  
}

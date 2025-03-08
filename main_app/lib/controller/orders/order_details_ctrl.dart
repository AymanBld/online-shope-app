import 'package:online_shope_app/core/class/crud.dart';
import 'package:online_shope_app/core/constant/links.dart';
import 'package:online_shope_app/core/functions/handle_statuss.dart';
import 'package:online_shope_app/core/services/services.dart';
import 'package:get/get.dart';

class OrderDetailsCtrl extends GetxController {
  Crud crud = Crud();
  Myservices myservices = Get.find();
  StatusRequest statusrequest = StatusRequest.loading;

  List orderProducts = [];
  double orderPrice = 0;

  @override
  void onInit() {
    getDetails();
    super.onInit();
  }

  getDetails() async {
    Map response = await crud.postData(
      AppLinks.getOrderDetails,
      {'order_id': Get.arguments['order_id'].toString()},
    );

    statusrequest = handlingStatus(response);
    if (statusrequest == StatusRequest.success) {
      orderProducts = response['data'];
      orderPrice = double.parse(response['data'][0]['order_price']);
    }
    update();
  }
}

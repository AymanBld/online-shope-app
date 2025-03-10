import 'package:online_shope_app/core/class/crud.dart';
import 'package:online_shope_app/core/constant/links.dart';
import 'package:online_shope_app/core/constant/routes.dart';
import 'package:online_shope_app/core/functions/handle_statuss.dart';
import 'package:online_shope_app/core/services/services.dart';
import 'package:get/get.dart';

class OrdersArchiveCtrl extends GetxController {
  Crud crud = Get.find<Crud>();
  Myservices myservices = Get.find();
  StatusRequest statusrequest = StatusRequest.loading;

  List ordersList = [];

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }

  getOrders() async {
    Map response = await crud.post(
      url: AppLinks.getArchiveOrders,
      body: {'user_id': myservices.sharedpref.getString('id')},
    );

    statusrequest = handlingStatus(response);
    if (statusrequest == StatusRequest.success) {
      ordersList = response['data'];
    }
    update();
  }

  onOrderDetailsTap(int id) {
    Get.toNamed(AppRoutes.orderDetails, arguments: {'order_id': id});
  }
}

import 'package:online_shope_app/core/class/crud.dart';
import 'package:online_shope_app/core/constant/links.dart';
import 'package:online_shope_app/core/constant/routes.dart';
import 'package:online_shope_app/core/functions/handle_statuss.dart';
import 'package:online_shope_app/core/services/services.dart';
import 'package:get/get.dart';

class OrderCtrl extends GetxController {
  Crud crud = Crud();
  Myservices myservices = Get.find();
  StatusRequest statusrequest = StatusRequest.loading;

  List ordersList = [];

  @override
  void onInit() {
    getOrders();
    super.onInit();
  }

  getOrders() async {
    Map response = await crud.post(url:AppLinks.getActiveOrders,body:  {
      'user_id': myservices.sharedpref.getString('id'),
    });

    statusrequest = handlingStatus(response);
    if (statusrequest == StatusRequest.success) {
      ordersList = response['data'];
    }
    update();
  }

  onOrderDetailsTap(int id) {
    Get.toNamed(AppRoutes.orderDetails, arguments: {'order_id': id});
  }

  deleteOrder(int id) async {
    await crud.post(url:AppLinks.order,body:  {'order_id': id.toString()});
    await getOrders();
  }

  decodeStatus(int val) {
    switch (val) {
      case 0:
        return 'Order placed';
      case 1:
        return 'Order processing';
      case 2:
        return 'Order ready for delivering';
      case 3:
        return 'Out for delivery';
      case 4:
        return 'Delivered';
      case 5:
        return 'Canceled';
      default:
        return 'Unknown';
    }
  }
}

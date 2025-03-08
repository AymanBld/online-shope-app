import 'package:deleviry_app/core/class/crud.dart';
import 'package:deleviry_app/core/constant/links.dart';
import 'package:deleviry_app/core/constant/routes.dart';
import 'package:deleviry_app/core/functions/handle_statuss.dart';
import 'package:deleviry_app/core/services/services.dart';
import 'package:deleviry_app/data/order_model.dart';
import 'package:get/get.dart';

class WaitingOrdersCtrl extends GetxController {
  Crud crud = Crud();
  StatusRequest? statusrequest = StatusRequest.loading;
  Myservices myservices = Get.find();

  List<OrderModel> orders = [];

  @override
  void onInit() {
    getordders();
    super.onInit();
  }

  getordders() async {
    Map response = await crud.postData(AppLinks.getWaiting, {});

    statusrequest = handlingStatus(response);
    if (statusrequest == StatusRequest.success) {
      orders = List.generate(
        response['data'].length,
        (index) => OrderModel.fromJson(response['data'][index]),
      );
    }

    update();
  }

  onOrderDetailsTap(int id) {
    Get.toNamed(AppRoutes.orderDetails, arguments: {'order_id': id});
  }

  onOrderAccepted(int id) async {
    Map response = await crud.postData(AppLinks.acceptOrder, {
      'delivery_id': myservices.sharedpref.getString('id'),
      'order_id': id.toString(),
    });

    statusrequest = handlingStatus(response);
    if (statusrequest == StatusRequest.success) {
      orders.removeWhere((element) => element.orderId == id);
    }
    update();
  }
}

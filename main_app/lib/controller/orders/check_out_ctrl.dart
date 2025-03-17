import 'package:online_shope_app/core/class/crud.dart';
import 'package:online_shope_app/core/constant/links.dart';
import 'package:online_shope_app/core/services/services.dart';
import 'package:get/get.dart';

class CheckOutCtrl extends GetxController {
  Myservices myservices = Get.find();
  Crud crud = Get.find<Crud>();

  List addressList = [];
  double totalprice = 0;
  int totalcount = 0;
  int? address;
  int? payment;

  @override
  onInit() {
    getAddress();
    totalprice = Get.arguments['total_price'];
    totalcount = Get.arguments['total_count'];
    super.onInit();
  }

  getAddress() async {
    Map response = await crud.post(url: AppLinks.address, body: {'user_id': myservices.sharedpref.getString('id')});

    if (response["status"] == 'success') {
      addressList = response['data'];
    }
    update();
  }

  changePayment(int val) {
    payment = val;
    update();
  }

  changeAdr(int value) {
    address = value;
    update();
  }

  buyNow() {
    if (payment != null && address != null) {
      crud.post(
        url: AppLinks.order,
        body: {
          'user_id': myservices.sharedpref.getString('id'),
          'order_price': totalprice.toString(),
          'order_count': totalcount.toString(),
          'order_payment': payment.toString(),
          'order_address': address.toString(),
        },
      );
      Get.back();
      Get.back();
    }
  }
}

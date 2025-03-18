import 'package:online_shope_app/core/class/crud.dart';

StatusRequest handlingStatus(Map response) {
  print('--------------respons---------$response');
  var status = response["status"];

  if (status == null || status is! StatusRequest) {
    return StatusRequest.success;
  } else {
    return status;
  }
}

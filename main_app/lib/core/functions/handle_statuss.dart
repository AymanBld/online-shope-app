import 'package:online_shope_app/core/class/crud.dart';

StatusRequest handlingStatus(Map response) {
  print('--------------respons---------$response');
  StatusRequest? status = response["status"];

  if (status == null) {
    return StatusRequest.success;
  } else {
    return status;
  }
}

import 'package:online_shope_app/core/class/crud.dart';

StatusRequest handlingStatus(Map response) {
  var status = response["status"];

  if (status) {
    return status;
  } else {
    return StatusRequest.success;
  }
}

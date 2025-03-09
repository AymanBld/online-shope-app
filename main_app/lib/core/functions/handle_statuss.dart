import 'package:online_shope_app/core/class/crud.dart';

StatusRequest handlingStatus(Map response) {
  StatusRequest? status = response["status"];

  if (status == null) {
    return StatusRequest.success;
  } else {
    return status;
  }
}

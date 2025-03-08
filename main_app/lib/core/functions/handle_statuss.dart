import 'package:online_shope_app/core/class/crud.dart';

StatusRequest handlingStatus(Map response) {
  var status = response["status"];

  switch (status) {
    case 'success':
      return StatusRequest.success;
    case 'failed':
      return StatusRequest.failed;
    default:
      return status;
  }
}

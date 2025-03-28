import 'package:online_shope_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Myservices extends GetxService {
  late SharedPreferences sharedpref;

  Future<Myservices> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    sharedpref = await SharedPreferences.getInstance();
    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => Myservices().init());
}

import 'package:get/get.dart';
import 'package:irhib/controllers/home_controller.dart';
import 'package:irhib/controllers/signup_controller.dart';

import '../controllers/splashcontroller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashController());
    Get.lazyPut(() => SignUpController());

    Get.lazyPut(() => HomeController());
  }
}

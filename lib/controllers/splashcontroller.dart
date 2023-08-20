import 'package:get/get.dart';
import 'package:irhib/routes/app_routs.dart';
import 'package:irhib/utils/app_helper.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    startApp();
    super.onInit();
  }

  Future startApp() {
    // print('TOKEN: ${AppHelper.getUserToken()}');
    if (AppHelper.getUserToken() != null) {
      return Future.delayed(Duration(seconds: 3), () {
        Get.toNamed(Routes.home);
      });
    } else {
      return Future.delayed(Duration(seconds: 3), () {
        Get.toNamed(Routes.signIn);
      });
    }
  }
}

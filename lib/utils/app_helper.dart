import 'package:get/get.dart';
import 'package:irhib/utils/constants.dart';
import 'package:irhib/utils/preferance_manager.dart';

class AppHelper {
  static String? getUserToken() {
    if (PreferanceManager.getUserToken(key: Const.KEY_USER_TOKEN) != null) {
      return 'Bearer ${PreferanceManager.getUserToken(key: Const.KEY_USER_TOKEN)}';
    } else {
      return null;
    }
  }

  static String getAppLanguage() {
    String? language = PreferanceManager.getLanguage(key: Const.KEY_LANGUAGE);
    print('getAppLANG: $language');
    if (language != null) {
      if (language == Const.KEY_LANGUAGE_AR) {
        return Const.KEY_LANGUAGE_AR;
      } else if (language == Const.KEY_LANGUAGE_EN) {
        return Const.KEY_LANGUAGE_EN;
      } else {
        return Get.deviceLocale!.languageCode;
      }
    } else {
      return Get.deviceLocale!.languageCode;
    }
  }
}

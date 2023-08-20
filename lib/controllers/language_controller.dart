import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:irhib/utils/constants.dart';
import 'package:irhib/utils/preferance_manager.dart';

import '../model/language.dart';

class LanguageController extends GetxController {
  RxString languageSelected = ''.obs;

  List<Langauge> language = [
    Langauge(langueCode: Const.KEY_LANGUAGE_EN, langueName: "English"),
    Langauge(langueCode: Const.KEY_LANGUAGE_AR, langueName: "Arabic"),
  ];

  void saveAppLanguage(String languageCode) {
    Locale locale = Locale(languageCode);
    PreferanceManager.saveLanguage(
        key: Const.KEY_LANGUAGE, value: languageCode);
    Get.updateLocale(locale);
  }

  Locale? getAppLocle() {
    print('DEVICE LANG: ${Get.deviceLocale!.languageCode}');
    String? language = PreferanceManager.getLanguage(key: Const.KEY_LANGUAGE);
    print('PREF LANG: $language');
    if (language != null) {
      if (language == Const.KEY_LANGUAGE_AR) {
        return Locale(Const.KEY_LANGUAGE_AR);
      } else if (language == Const.KEY_LANGUAGE_EN) {
        return Locale(Const.KEY_LANGUAGE_EN);
      } else {
        return Locale(Get.deviceLocale!.languageCode);
      }
    } else {
      return Locale(Get.deviceLocale!.languageCode);
    }
  }
}

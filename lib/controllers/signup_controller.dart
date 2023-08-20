import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:irhib/api/api_helper.dart';
import 'package:irhib/api/api_requestes.dart';
import 'package:irhib/model/countries.dart';
import 'package:irhib/model/cities.dart';
import 'package:irhib/model/services.dart';
import 'package:irhib/routes/app_routs.dart';
import 'package:irhib/utils/app_helper.dart';
import 'package:irhib/utils/preferance_manager.dart';

import '../utils/constants.dart';

class SignUpController extends GetxController {
  RxBool isLoading = false.obs;

  RxString itemCountrySelected = ''.obs;
  RxString itemCitySelected = ''.obs;
  RxString itemServiesSelected = ''.obs;

  int countrySelected = 0;
  int citySelected = 0;
  int serviesSelected = 0;

  int tabIndex = 0;

  List<CountryData> listCountries = [];
  List<CityData> listCities = [];
  List<ServiecesData> listServices = [];

  late GlobalKey<FormState> touristsFormKey;
  late GlobalKey<FormState> mentorsFormKey;
  late GlobalKey<FormState> providersFormKey;

  late TextEditingController userNameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController addressController;

  @override
  void onInit() {
    touristsFormKey = GlobalKey();
    mentorsFormKey = GlobalKey();
    providersFormKey = GlobalKey();

    userNameController = TextEditingController();
    phoneController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    addressController = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    touristsFormKey.currentState!.dispose();
    mentorsFormKey.currentState!.dispose();
    providersFormKey.currentState!.dispose();

    userNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    passwordController.dispose();
    addressController.dispose();
    super.dispose();
  }

  Future<void> fetchCountries() async {
    print('LANG: ${AppHelper.getAppLanguage()}');
    print('ANY');

    await ApiRequest.getCountries(language: AppHelper.getAppLanguage())
        .then((value) {
      if (value != null) {
        listCountries.clear();
        listCountries.addAll(value.countries!);
      } else {
        print('ANY ${value}');
      }
    });
  }

  Future<void> fetchCities() async {
    await ApiRequest.getCities().then((value) {
      if (value != null) {
        listCities.clear();
        listCities.addAll(value.cities!);
      }
    });
  }

  Future<void> fetchServices() async {
    await ApiRequest.getServices().then((value) {
      if (value != null) {
        listServices.clear();
        listServices.addAll(value.service!);
      }
    });
  }

  void registerTourists() {
    isLoading(true);
    ApiRequest.registerTourists(
            name: userNameController.text,
            countryId: countrySelected,
            phone: phoneController.text,
            email: emailController.text,
            password: passwordController.text)
        .then((value) {
      if (value != null) {
        isLoading(false);
        PreferanceManager.saveUserData(
            key: Const.KEY_USER_DATA, user: value.user!);
        PreferanceManager.saveUserToken(
            key: Const.KEY_USER_TOKEN, token: value.accessToken!);
        PreferanceManager.saveUserType(
            key: Const.KEY_USER_TOKEN_TYPE, userType: value.user!.type!);
        Get.toNamed(Routes.home);
      } else {
        isLoading(true);
      }
    });
  }

  // void registerServiceProvider() {
  //   isLoading(true);

  // }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:irhib/api/api_requestes.dart';
import 'package:irhib/routes/app_routs.dart';
import 'package:irhib/utils/preferance_manager.dart';

import '../model/user_type.dart';
import '../utils/constants.dart';

class LoginController extends GetxController {
  RxBool isLoading = false.obs;

  late GlobalKey<FormState> formkey;
  late TextEditingController phoneEmailController;
  late TextEditingController passwordController;
  late TextEditingController userNameController;

  @override
  void onInit() {
    formkey = GlobalKey();
    phoneEmailController = TextEditingController();
    passwordController = TextEditingController();
    userNameController = TextEditingController();
    super.onInit();

    // userNameController.text = 'amanynada';
    // passwordController.text = '123654';
  }

  @override
  void dispose() {
    formkey.currentState!.dispose();
    phoneEmailController.dispose();
    passwordController.dispose();
  }

  String? validateEmail(String email) {
    if (!GetUtils.isEmail(email)) {
      return "Email is not correct";
    }
    return null;
  }

  String? validatePassword(String password) {
    if (password.length <= 6) {
      return "Password must be of 6 characters";
    }
    return null;
  }

  void saveLoginData() {
    final isValid = formkey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formkey.currentState!.save();
  }

  List<UserType> listUserType = [
    UserType(name: "toure_guide", type: Const.KEY_MENTORS, isSelected: false),
    UserType(name: "tourist", type: Const.KEY_TOURISTS, isSelected: true),
    UserType(
        name: "service_provider", type: Const.KEY_PROVIDERS, isSelected: false)
  ];

  void loginTourists() {
    isLoading(true);
    ApiRequest.loginTourists(
            email: phoneEmailController.text, password: passwordController.text)
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
}

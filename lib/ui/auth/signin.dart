import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:irhib/controllers/login_controller.dart';
import 'package:irhib/routes/app_routs.dart';
import 'package:irhib/ui/auth/component/app_text_feild.dart';
import 'package:irhib/ui/auth/component/background.dart';
import 'package:irhib/ui/auth/signup.dart';
import 'package:irhib/ui/home/home_screen.dart';
import 'package:irhib/utils/app_colors.dart';
import 'package:irhib/utils/app_text.dart';
import 'package:irhib/utils/constants.dart';

class SignIn extends StatelessWidget {
  SignIn({super.key});

  final controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: controller.formkey,
        child: Stack(
          children: [
            Background(),
            Column(
              children: [
                Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Container(
                    padding: EdgeInsetsDirectional.only(
                        top: 88, start: 29, bottom: 20),
                    child: Text(
                      "welcome".tr,
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional.topCenter,
                  child: Container(
                    padding: EdgeInsetsDirectional.only(bottom: 20.h),
                    child: Text(
                      "signin".tr,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding:
                        EdgeInsetsDirectional.only(end: 27, start: 27, top: 39),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        )),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppTextFeiled(
                            text: "username".tr,
                            controller: controller.phoneEmailController,
                            hintText: "userhint".tr,
                            prefixIcon: Icon(
                              Icons.person,
                              color: AppColors.mainColor,
                            ),
                            onSaved: (value) {
                              controller.userNameController.text = value!;
                            },
                            validation: (value) {
                              return controller.validateEmail(value!);
                            },
                          ),
                          AppTextFeiled(
                            text: "password".tr,
                            controller: controller.passwordController,
                            hintText: "userhint".tr,
                            prefixIcon: Icon(
                              Icons.lock,
                              color: AppColors.mainColor,
                            ),
                            validation: (value) {
                              return controller.validatePassword(value!);
                            },
                            onSaved: (value) {
                              controller.passwordController.text = value!;
                            },
                          ),
                          Center(
                              child: AppText.medium(
                                  text: 'forgetpassword',
                                  fontSize: 18,
                                  color: AppColors.mainColor)),
                          Align(
                            alignment: AlignmentDirectional.center,
                            child: InkWell(
                              onTap: () => controller.loginTourists(),
                              child: Container(
                                  alignment: AlignmentDirectional.center,
                                  margin: EdgeInsetsDirectional.only(
                                      top: 61, bottom: 130),
                                  width: 254,
                                  height: 48,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors.mainColor,
                                  ),
                                  child: AppText.medium(
                                      fontWeight: FontWeight.w700,
                                      text: 'login',
                                      fontSize: 18,
                                      color: Colors.white)),
                            ),
                          ),
                          Obx(() => controller.isLoading.isTrue
                              ? Center(
                                  child: Container(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      color: AppColors.mainColor,
                                    ),
                                  ),
                                )
                              : Container()),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppText.medium(
                                  text: 'noaccount',
                                  color: AppColors.lightColor,
                                  fontSize: 18),
                              InkWell(
                                  onTap: () {
                                    Get.to(SignUp());
                                  },
                                  child: AppText.medium(
                                      text: 'creataccount',
                                      color: AppColors.lightColor,
                                      fontSize: 18))
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

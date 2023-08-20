import 'dart:convert';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:irhib/controllers/home_controller.dart';
import 'package:irhib/routes/app_routs.dart';
import 'package:irhib/utils/app_colors.dart';
import 'package:irhib/utils/app_text.dart';
import 'package:irhib/utils/constants.dart';
import 'package:irhib/utils/preferance_manager.dart';

import '../../controllers/language_controller.dart';
import '../../model/language.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // print(
    //     "user token : ${PreferanceManager.getUserToken(key: Const.KEY_USER_TOKEN)}");
    // print(
    //     " user type: ${PreferanceManager.getUserType(key: Const.KEY_USER_TOKEN_TYPE)}");
    // print(
    //     "user data : ${jsonEncode(PreferanceManager.getUserData(key: Const.KEY_USER_DATA))}");
    return GetBuilder<HomeController>(
      builder: (controller) => Scaffold(
        key: controller.drawerKey,
        drawer: DrawerNavigation(),
        body: controller.listScreens[controller.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentIndex,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: AppColors.mainColor,
            onTap: (index) => controller.getCurrentIndex(index),
            items: _navigationItems()),
      ),
    );
  }

  List<BottomNavigationBarItem> _navigationItems() => [
        BottomNavigationBarItem(
            activeIcon: const Icon(
              Icons.home,
              color: AppColors.mainColor,
            ),
            icon: Icon(Icons.home),
            label: 'home'.tr),
        BottomNavigationBarItem(
            activeIcon: const Icon(
              Icons.favorite,
              color: AppColors.mainColor,
            ),
            icon: Icon(Icons.favorite),
            label: "favorite".tr),
        BottomNavigationBarItem(
            activeIcon: const Icon(
              Icons.explore,
              color: AppColors.mainColor,
            ),
            icon: const Icon(Icons.explore),
            label: "explore".tr),
        BottomNavigationBarItem(
            activeIcon: const Icon(
              Icons.person,
              color: AppColors.mainColor,
            ),
            icon: Icon(Icons.person),
            label: "profile".tr),
      ];
}

class DrawerNavigation extends StatelessWidget {
  // final _controller = Get.put(LanguageController());
  final _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.mainColor,
      child: ListView(
        children: [
          SizedBox(
            height: 66.h,
          ),
          Row(
            children: [
              SizedBox(
                width: 27.w,
              ),
              InkWell(
                onTap: () => _controller.drawerKey.currentState!.closeDrawer(),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              )
            ],
          ),
          SizedBox(
            height: 21,
          ),
          Row(
            children: [
              SizedBox(
                width: 51.w,
              ),
              CircleAvatar(
                backgroundImage: AssetImage(
                  "${Const.images}user.png",
                ),
                radius: 30,
              ),
              SizedBox(
                width: 10.w,
              ),
              Column(
                children: [
                  Text(
                    "Alex",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.white,
                        size: 16,
                      ),
                      Text("india",
                          style: TextStyle(
                            color: Colors.white,
                          ))
                    ],
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 50.h,
          ),
          ListTile(
            leading: Icon(
              Icons.email_outlined,
              color: Colors.white,
            ),
            title: Container(
              //  color: Colors.black,
              margin: EdgeInsetsDirectional.only(top: 5.h),
              child: AppText.medium(
                  text: "inbox".tr,
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.privacy_tip_outlined,
              color: Colors.white,
            ),
            title: Container(
              //  color: Colors.black,
              margin: EdgeInsetsDirectional.only(top: 5.h),
              child: AppText.medium(
                  text: "privacy policy".tr,
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.privacy_tip_sharp,
              color: Colors.white,
            ),
            title: Container(
              //  color: Colors.black,
              margin: EdgeInsetsDirectional.only(top: 5.h),
              child: AppText.medium(
                  text: "about app".tr,
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.privacy_tip_sharp,
              color: Colors.white,
            ),
            title: Container(
              //  color: Colors.black,
              margin: EdgeInsetsDirectional.only(top: 5.h),
              child: AppText.medium(
                  text: "precautionary conditions".tr,
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.language_rounded,
              color: Colors.white,
            ),
            title: Container(
              //  color: Colors.black,
              margin: EdgeInsetsDirectional.only(top: 5.h),
              child: Row(
                children: [
                  AppText.medium(
                      text: "language".tr,
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                  Spacer(),
                  Container(
                      child: GetBuilder<LanguageController>(
                    builder: (controller) => DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        isExpanded: true,
                        hint: Obx(() => Text(
                            controller.languageSelected.value.isNotEmpty
                                ? controller.languageSelected.value.tr
                                : '',
                            style: TextStyle(
                              color: Colors.white,
                            ))),
                        items: controller.language
                            .map((item) => DropdownMenuItem<Langauge>(
                                  value: item,
                                  child: Text(
                                    item.langueName,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ))
                            .toList(),
                        onChanged: (value) {
                          controller.languageSelected.value = value!.langueName;
                          controller.saveAppLanguage(value.langueCode);
                          _controller.update();
                          controller.update();
                        },
                        icon: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 32,
                          color: Colors.white,
                        ),
                        iconSize: 14.sp,
                        iconEnabledColor: Colors.amber,
                        iconDisabledColor: Colors.black,
                        buttonHeight: 40.h,
                        buttonWidth: 110.w,
                        buttonPadding:
                            const EdgeInsets.only(left: 14, right: 14),
                        buttonDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            border: Border.all(
                              color: AppColors.mainColor,
                              width: 0.5,
                            ),
                            color: AppColors.mainColor),
                        itemHeight: 50,
                        dropdownMaxHeight: 180,
                        dropdownWidth: 110,
                        dropdownDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.mainColor),
                        dropdownElevation: 8,
                        scrollbarThickness: 6,
                        scrollbarAlwaysShow: true,
                        offset: const Offset(10, 0),
                      ),
                    ),
                  )),
                ],
              ),
            ),
          ),
          Divider(
            color: AppColors.mainColor,
            thickness: 0.6,
            indent: 10,
            endIndent: 20,
          ),
          SizedBox(
            height: 89.h,
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: Colors.white,
            ),
            title: InkWell(
              child: Container(
                //  color: Colors.black,
                margin: EdgeInsetsDirectional.only(top: 5.h),
                child: AppText.medium(
                    text: "logout".tr,
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
              onTap: () {
                PreferanceManager.clearData(key: Const.KEY_USER_TOKEN)
                    .then((value) {
                  if (value) {
                    PreferanceManager.clearData(key: Const.KEY_USER_DATA);
                    PreferanceManager.clearData(key: Const.KEY_USER_TOKEN_TYPE);
                    Get.offAndToNamed(Routes.signIn);
                  }
                });
              },
            ),
          )
        ],
      ),
    );
  }
}

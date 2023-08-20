import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:irhib/controllers/signup_controller.dart';
import 'package:irhib/model/cities.dart';
import 'package:irhib/model/countries.dart';
import 'package:irhib/model/country.dart';
import 'package:irhib/model/services.dart';
import 'package:irhib/ui/auth/component/app_text_feild.dart';
import 'package:irhib/ui/auth/component/background.dart';
import 'package:irhib/utils/app_text.dart';

import '../../utils/app_colors.dart';
import '../../utils/constants.dart';

final _controller = Get.put(SignUpController());

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SignUpController>(builder: (controller) {
        return DefaultTabController(
          length: 3,
          initialIndex: _controller.tabIndex,
          child: Stack(
            children: [
              Background(),
              Column(children: [
                Container(
                  margin: EdgeInsetsDirectional.only(
                      top: 80, start: 133, bottom: 71),
                  child: Row(
                    children: [
                      AppText.medium(
                        text: "creataccount".tr,
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                      SizedBox(
                        width: 97,
                      ),
                      Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.white,
                        size: 20,
                      ),
                    ],
                  ),
                ),
              ]),
              Container(
                margin: EdgeInsetsDirectional.only(top: 140.h),
                padding: EdgeInsetsDirectional.only(
                  top: 9.h,
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.r),
                      topRight: Radius.circular(10.r),
                    )),
                child: Column(
                  children: [
                    TabBar(
                        isScrollable: false,
                        labelColor: AppColors.mainColor,
                        unselectedLabelColor: Colors.grey,
                        labelStyle: const TextStyle(
                          color: AppColors.mainColor,
                          fontWeight: FontWeight.w800,
                          fontSize: 14,
                        ),
                        unselectedLabelStyle: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                        indicatorColor: AppColors.mainColor,
                        indicatorSize: TabBarIndicatorSize.tab,
                        onTap: (int index) {
                          _controller.tabIndex = index;
                          _controller.update();
                        },
                        tabs: [
                          Tab(
                            text: 'Toure Guide',
                          ),
                          Tab(
                            text: 'Tourist',
                          ),
                          Tab(
                            text: 'Service Provider',
                          )
                        ]),
                    Expanded(
                        child: TabBarView(children: [
                      Container(
                          padding: EdgeInsetsDirectional.only(
                              top: 9.h, start: 25.r, end: 25.r),
                          child: TourGuideSignup()),
                      Container(
                          padding: EdgeInsetsDirectional.only(
                              top: 5.h, start: 27.w, end: 27.w),
                          child: TouristSignUp()),
                      Container(
                          padding: EdgeInsetsDirectional.only(
                              top: 5.h, start: 27.w, end: 27.w),
                          child: ServiceProviderSignUp()),
                    ]))
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class ServiceProviderSignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText.medium(
              text: "Service provider type".tr,
              color: AppColors.mainColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            FutureBuilder(
              future: _controller.fetchServices(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Container(
                    margin: EdgeInsetsDirectional.only(top: 17.h, bottom: 19.h),
                    width: double.infinity,
                    height: 44.h,
                    decoration: BoxDecoration(
                      color: AppColors.subColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        isExpanded: true,
                        hint: Obx(() => Text(
                            _controller.itemServiesSelected.value.isNotEmpty
                                ? _controller.itemServiesSelected.value
                                : 'All',
                            style: TextStyle(
                              color: AppColors.mainColor,
                            ))),
                        items: _controller.listServices
                            .map((item) => DropdownMenuItem<ServiecesData>(
                                  value: item,
                                  child: Text(item.name!),
                                ))
                            .toList(),
                        onChanged: (value) {
                          _controller.itemServiesSelected.value = value!.name!;
                          _controller.serviesSelected = value.id!;
                          print('Country ID: ${_controller.serviesSelected}');
                          print(
                              'Country NAME: ${_controller.itemServiesSelected.value}');
                          _controller.update();
                        },
                        icon: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 32,
                          color: AppColors.mainColor,
                        ),
                        iconSize: 14.sp,
                        iconEnabledColor: Colors.amber,
                        iconDisabledColor: Colors.black,
                        buttonHeight: 50.h,
                        buttonWidth: 40.w,
                        buttonPadding:
                            const EdgeInsets.only(left: 14, right: 14),
                        buttonDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            border: Border.all(
                              color: Colors.white,
                              width: 0.5,
                            ),
                            color: AppColors.subColor),
                        itemHeight: 50,
                        dropdownMaxHeight: 180,
                        dropdownWidth: 350,
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                        ),
                        dropdownElevation: 8,
                        scrollbarThickness: 6,
                        scrollbarAlwaysShow: true,
                        offset: const Offset(10, 0),
                      ),
                    ),
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Container(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                          backgroundColor: AppColors.mainColor));
                } else {
                  return Container();
                }
              },
            ),
            AppText.medium(
              text: "citiy".tr,
              color: AppColors.mainColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            FutureBuilder(
              future: _controller.fetchCities(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Container(
                    margin: EdgeInsetsDirectional.only(top: 9.h, bottom: 10.h),
                    width: double.infinity,
                    height: 44.h,
                    decoration: BoxDecoration(
                      color: AppColors.subColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        isExpanded: true,
                        hint: Obx(() => Text(
                            _controller.itemCitySelected.value.isNotEmpty
                                ? _controller.itemCitySelected.value
                                : 'All',
                            style: TextStyle(
                              color: AppColors.mainColor,
                            ))),
                        items: _controller.listCities
                            .map((item) => DropdownMenuItem<CityData>(
                                  value: item,
                                  child: Text(item.name!),
                                ))
                            .toList(),
                        onChanged: (value) {
                          _controller.itemCitySelected.value = value!.name!;
                          _controller.citySelected = value.id!;
                          print('City ID: ${_controller.citySelected}');
                          print(
                              'City NAME: ${_controller.itemCitySelected.value}');
                          _controller.update();
                        },
                        icon: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 32,
                          color: AppColors.mainColor,
                        ),
                        iconSize: 14.sp,
                        iconEnabledColor: Colors.amber,
                        iconDisabledColor: Colors.black,
                        buttonHeight: 50.h,
                        buttonWidth: 40.w,
                        buttonPadding:
                            const EdgeInsets.only(left: 14, right: 14),
                        buttonDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            border: Border.all(
                              color: Colors.white,
                              width: 0.5,
                            ),
                            color: AppColors.subColor),
                        itemHeight: 50,
                        dropdownMaxHeight: 180,
                        dropdownWidth: 350,
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                        ),
                        dropdownElevation: 8,
                        scrollbarThickness: 6,
                        scrollbarAlwaysShow: true,
                        offset: const Offset(10, 0),
                      ),
                    ),
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Container(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                          backgroundColor: AppColors.mainColor));
                } else {
                  return Container();
                }
              },
            ),
            AppTextFeiled(
              text: "location".tr,
              prefixIcon: Icon(
                Icons.location_on,
                color: AppColors.mainColor,
              ),
            ),
            AppTextFeiled(
              text: "government document".tr,
              prefixIcon: Icon(
                Icons.picture_as_pdf,
                color: AppColors.mainColor,
              ),
            ),
            Align(
              alignment: AlignmentDirectional.center,
              child: Container(
                  alignment: AlignmentDirectional.center,
                  margin: EdgeInsetsDirectional.only(top: 20, bottom: 9),
                  width: 254,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.mainColor,
                  ),
                  child: AppText.medium(
                      fontWeight: FontWeight.w700,
                      text: "next".tr,
                      color: Colors.white,
                      fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}

class TouristSignUp extends StatelessWidget {
  const TouristSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextFeiled(
              controller: _controller.userNameController,
              text: 'username'.tr,
              hintText: "userhint".tr,
              prefixIcon: Icon(
                Icons.person,
                color: AppColors.mainColor,
              ),
            ),
            AppText.medium(
              text: "country".tr,
              color: AppColors.mainColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            FutureBuilder(
              future: _controller.fetchCountries(),
              builder: (context, snapshot) {
                return Container(
                  margin: EdgeInsetsDirectional.only(top: 9.h, bottom: 10.h),
                  width: double.infinity,
                  height: 44.h,
                  decoration: BoxDecoration(
                    color: AppColors.subColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      isExpanded: true,
                      hint: Obx(() => Text(
                          _controller.itemCountrySelected.value.isNotEmpty
                              ? _controller.itemCountrySelected.value
                              : 'All',
                          style: TextStyle(
                            color: AppColors.mainColor,
                          ))),
                      items: _controller.listCountries
                          .map((item) => DropdownMenuItem<CountryData>(
                                value: item,
                                child: Text(item.name!),
                              ))
                          .toList(),
                      onChanged: (value) {
                        _controller.itemCountrySelected.value = value!.name!;
                        _controller.countrySelected = value.id!;
                        print('Country ID: ${_controller.countrySelected}');
                        print(
                            'Country NAME: ${_controller.itemCountrySelected.value}');
                        _controller.update();
                      },
                      icon: const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 32,
                        color: AppColors.mainColor,
                      ),
                      iconSize: 14.sp,
                      iconEnabledColor: Colors.amber,
                      iconDisabledColor: Colors.black,
                      buttonHeight: 50.h,
                      buttonWidth: 40.w,
                      buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                      buttonDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(
                            color: Colors.white,
                            width: 0.5,
                          ),
                          color: AppColors.subColor),
                      itemHeight: 50,
                      dropdownMaxHeight: 180,
                      dropdownWidth: 350,
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      dropdownElevation: 8,
                      scrollbarThickness: 6,
                      scrollbarAlwaysShow: true,
                      offset: const Offset(10, 0),
                    ),
                  ),
                );
              },
            ),
            AppTextFeiled(
              controller: _controller.phoneController,
              text: "phonenumber".tr,
              prefixIcon: Icon(
                Icons.mobile_friendly,
                color: AppColors.mainColor,
              ),
            ),
            AppTextFeiled(
              controller: _controller.emailController,
              text: "email".tr,
              prefixIcon: Icon(
                Icons.email,
                color: AppColors.mainColor,
              ),
            ),
            AppTextFeiled(
              controller: _controller.passwordController,
              text: "password".tr,
              prefixIcon: Icon(Icons.lock, color: AppColors.mainColor),
            ),
            InkWell(
              child: Align(
                alignment: AlignmentDirectional.center,
                child: Container(
                    alignment: AlignmentDirectional.center,
                    margin: EdgeInsetsDirectional.only(top: 20, bottom: 9),
                    width: 254,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.mainColor,
                    ),
                    child: AppText.medium(
                        fontWeight: FontWeight.w700,
                        text: 'creataccount'.tr,
                        color: Colors.white)),
              ),
              onTap: () => _controller.registerTourists(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText.medium(
                    text: "have account".tr,
                    color: AppColors.lightColor,
                    fontSize: 18),
                InkWell(
                    onTap: () {
                      Get.to(ServiceProviderSignUp());
                    },
                    child: AppText.medium(
                        text: 'login'.tr,
                        color: AppColors.lightColor,
                        fontSize: 18))
              ],
            ),
            Obx(() => _controller.isLoading.isTrue
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
            SizedBox(
              height: 15.h,
            )
          ],
        ),
      ),
    );
  }
}

class TourGuideSignup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextFeiled(
              text: 'username'.tr,
              hintText: "userhint".tr,
              prefixIcon: Icon(
                Icons.person,
                color: AppColors.mainColor,
              ),
            ),
            AppText.medium(
              text: "city".tr,
              color: AppColors.mainColor,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
            FutureBuilder(
              future: _controller.fetchCities(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Container(
                    margin: EdgeInsetsDirectional.only(top: 9.h, bottom: 10.h),
                    width: double.infinity,
                    height: 44.h,
                    decoration: BoxDecoration(
                      color: AppColors.subColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        isExpanded: true,
                        hint: Obx(() => Text(
                            _controller.itemCitySelected.value.isNotEmpty
                                ? _controller.itemCitySelected.value
                                : 'All',
                            style: TextStyle(
                              color: AppColors.mainColor,
                            ))),
                        items: _controller.listCities
                            .map((item) => DropdownMenuItem<CityData>(
                                  value: item,
                                  child: Text(item.name!),
                                ))
                            .toList(),
                        onChanged: (value) {
                          _controller.itemCitySelected.value = value!.name!;
                          _controller.citySelected = value.id!;
                          print('City ID: ${_controller.citySelected}');
                          print(
                              'City NAME: ${_controller.itemCitySelected.value}');
                          _controller.update();
                        },
                        icon: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 32,
                          color: AppColors.mainColor,
                        ),
                        iconSize: 14.sp,
                        iconEnabledColor: Colors.amber,
                        iconDisabledColor: Colors.black,
                        buttonHeight: 50.h,
                        buttonWidth: 40.w,
                        buttonPadding:
                            const EdgeInsets.only(left: 14, right: 14),
                        buttonDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            border: Border.all(
                              color: Colors.white,
                              width: 0.5,
                            ),
                            color: AppColors.subColor),
                        itemHeight: 50,
                        dropdownMaxHeight: 180,
                        dropdownWidth: 350,
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.white,
                        ),
                        dropdownElevation: 8,
                        scrollbarThickness: 6,
                        scrollbarAlwaysShow: true,
                        offset: const Offset(10, 0),
                      ),
                    ),
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Container(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                          backgroundColor: AppColors.mainColor));
                } else {
                  return Container();
                }
              },
            ),
            AppTextFeiled(
              text: "email".tr,
              prefixIcon: Icon(
                Icons.email,
                color: AppColors.mainColor,
              ),
            ),
            AppTextFeiled(
              text: "government document".tr,
              prefixIcon: Icon(
                Icons.picture_as_pdf,
                color: AppColors.mainColor,
              ),
            ),
            AppTextFeiled(
              text: "password".tr,
              prefixIcon: Icon(Icons.lock, color: AppColors.mainColor),
            ),
            Align(
              alignment: AlignmentDirectional.center,
              child: Container(
                  alignment: AlignmentDirectional.center,
                  margin: EdgeInsetsDirectional.only(top: 20, bottom: 9),
                  width: 254,
                  height: 48,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.mainColor,
                  ),
                  child: AppText.medium(
                      fontWeight: FontWeight.w700,
                      text: 'creataccount'.tr,
                      color: Colors.white)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText.medium(
                    text: "have account".tr,
                    color: AppColors.lightColor,
                    fontSize: 18),
                InkWell(
                  onTap: () {
                    Get.to(ServiceProviderSignUp());
                  },
                  child: AppText.medium(
                      text: 'login'.tr,
                      color: AppColors.lightColor,
                      fontSize: 18),
                )
              ],
            ),
            SizedBox(
              height: 20.h,
            )
          ],
        ),
      ),
    );
  }
}

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:irhib/ui/auth/component/app_text_feild.dart';
import 'package:irhib/ui/auth/component/background.dart';
import 'package:irhib/utils/app_text.dart';

import '../../controllers/signup_controller.dart';
import '../../model/cities.dart';
import '../../utils/app_colors.dart';

class AddTripe extends StatelessWidget {
  AddTripe({super.key});
  final _controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Background(),
        Column(
          children: [
            Container(
              margin: EdgeInsetsDirectional.only(
                  start: 141.w, end: 27.w, top: 80.h, bottom: 20.h),
              child: Row(
                children: [
                  AppText.medium(
                    text: 'add_tripe'.tr,
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(
                    width: 95.w,
                  ),
                  Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            Expanded(
                child: Container(
              padding:
                  EdgeInsetsDirectional.only(start: 27.w, end: 27.w, top: 15.h),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.r),
                      topRight: Radius.circular(8.r)),
                  color: Colors.white),
              child: Column(
                children: [
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
                          margin: EdgeInsetsDirectional.only(
                              top: 9.h, bottom: 10.h),
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
                                _controller.itemCitySelected.value =
                                    value!.name!;
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
                ],
              ),
            )),
          ],
        )
      ]),
    );
  }
}

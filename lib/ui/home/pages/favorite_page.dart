import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controllers/explore_controller.dart';
import '../../../model/trips/trips.dart';
import '../../../routes/app_routs.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_text.dart';

class Favorite extends StatelessWidget {
  Favorite({super.key});
  final _controller = Get.put(ExploreController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Align(
            alignment: AlignmentDirectional.topCenter,
            child: Container(
              margin: EdgeInsetsDirectional.only(
                  start: 20.w, top: 50.h, bottom: 20.h),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => Get.toNamed(Routes.home),
                    child: Icon(
                      Icons.arrow_back_ios_outlined,
                      color: AppColors.mainColor,
                    ),
                  ),
                  SizedBox(
                    width: 110.w,
                  ),
                  AppText.medium(
                    text: 'Favorite',
                    color: AppColors.mainColor,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
            ),
          ),
          // Container(
          //     // height: double.infinity,
          //     child: SingleChildScrollView(
          //         scrollDirection: Axis.vertical,
          //         child: Column(
          //           children: _controller.exolpre.trips!
          //               .map(
          //                 (trips) => buildDetailTripeItem(trips),
          //               )
          //               .toList(),
          //         ))),
        ],
      ),
    );
  }
}

Widget buildDetailTripeItem(Trips tripsDetails) => Container(
      margin: EdgeInsetsDirectional.only(start: 27.w, end: 27.w, bottom: 15.h),
      width: double.infinity,
      padding: EdgeInsetsDirectional.only(
          start: 5.w, end: 5.w, top: 5.h, bottom: 10.h),
      decoration: BoxDecoration(
          border: Border.all(
            width: 3.r,
            color: AppColors.mainColor,
          ),
          borderRadius: BorderRadius.circular(10.r)),
      child: Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              // Container(
              //     height: 167.h,
              //     width: double.infinity,
              //     margin: EdgeInsetsDirectional.only(bottom: 13.h),
              //     clipBehavior: Clip.antiAlias,
              //     decoration:
              //         BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
              //     child: tripsDetails.image != null
              //         ? Image.network(
              //             tripsDetails.image!,
              //             fit: BoxFit.cover,
              //             width: double.infinity,
              //           )
              //         : Image.asset(
              //             "${Const.images}maka.jpg",
              //             fit: BoxFit.cover,
              //             width: double.infinity,
              //           )),
              Container(
                margin: EdgeInsetsDirectional.all(10.r),
                padding: EdgeInsetsDirectional.only(bottom: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AppText.medium(
                        text: tripsDetails.title!,
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                    SizedBox(
                      width: 15.w,
                    ),
                    Icon(
                      Icons.location_on,
                      color: Colors.white,
                      size: 20,
                    ),
                  ],
                ),
              ),
              Stack(
                children: [
                  Container(
                    height: 45.h,
                    width: 80.w,
                    margin: EdgeInsetsDirectional.only(bottom: 125.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.r),
                          bottomLeft: Radius.circular(10.r)),
                      color: AppColors.lightColor,
                    ),
                  ),
                  // Container(
                  //   child: Text(
                  //     "900\$ لكل شخص ",
                  //     style: TextStyle(
                  //       color: Colors.white,
                  //       fontSize: 17,
                  //       fontWeight: FontWeight.w500,
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(height: 10.h),
                  // AppText.medium(
                  //   text: "لكل شخص",
                  //   color: Colors.white,
                  //   fontSize: 17.sp,
                  //   fontWeight: FontWeight.w500,
                  // ),
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsetsDirectional.only(bottom: 5.h),
                child: Row(
                  children: [
                    Icon(
                      Icons.timer_outlined,
                      color: Colors.grey,
                    ),
                    SizedBox(width: 8.w),
                    Container(
                      margin: EdgeInsetsDirectional.only(top: 8.h),
                      child: AppText.medium(
                        text: "7 days",
                        color: AppColors.mainColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              AppText.medium(
                text: "praivet\\public",
                color: AppColors.mainColor,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              )
            ],
          ),
          Container(
            //  margin: EdgeInsetsDirectional.only(start: 20.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // children: tripsDetails.tripsservices!
              //     .map((services) => Container(
              //           width: 38.w,
              //           height: 36.h,
              //           margin:
              //               EdgeInsetsDirectional.only(start: 5.w, end: 5.w),
              //           clipBehavior: Clip.antiAlias,
              //           decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(10.r),
              //               color: AppColors.mainColor),
              //           child: services.serviceImg != null
              //               ? Image.network(services.serviceImg!,
              //                   fit: BoxFit.fill)
              //               : Image.asset("${Const.images}maka.jpg",
              //                   fit: BoxFit.fill),
              //         ))
              //     .toList()
            ),
          ),
          Container(
            // margin: EdgeInsetsDirectional.only(bottom: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.favorite,
                  color: Colors.black54,
                  size: 30,
                ),
                RatingBarIndicator(
                  rating: 2.75,
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: Colors.yellow,
                    //  size: 20,
                  ),
                  itemCount: 5,
                  itemSize: 25.0,
                  direction: Axis.horizontal,
                ),
              ],
            ),
          ),
        ],
      ),
    );

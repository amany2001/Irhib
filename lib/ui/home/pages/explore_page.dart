import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:irhib/controllers/explore_controller.dart';
import 'package:irhib/model/explore.dart';
import 'package:irhib/model/providers.dart';
import 'package:irhib/model/service_providers.dart';
import 'package:irhib/routes/app_routs.dart';
import 'package:irhib/utils/app_colors.dart';

import '../../../model/trips/trips.dart';
import '../../../utils/app_text.dart';
import '../../../utils/constants.dart';

class Explore extends StatelessWidget {
  final _controller = Get.put(ExploreController());

  int? cityId;
  String? cityName;
  Explore({super.key, this.cityId, this.cityName});

  @override
  Widget build(BuildContext context) {
    print('CITYID: $cityId');
    print('services:${_controller.exolpre.servicesProvider}');
    return Scaffold(
        body: FutureBuilder(
            future: _controller.fetchExploreDetails(cityId!.toString()),
            builder: (con, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                        // color: Colors.amber,
                        margin: EdgeInsetsDirectional.only(
                            start: 27.w, end: 161.w, top: 61.h, bottom: 20.h),
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
                              text: cityName!,
                              color: AppColors.mainColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ],
                        ),
                      ),
                      buildExploreItem(_controller.exolpre.img!),
                      Container(
                        margin: EdgeInsetsDirectional.only(
                            start: 26.w, end: 27.w, bottom: 17.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText.medium(
                                text: "toure_guides".tr,
                                color: AppColors.mainColor,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500),
                            AppText.medium(
                                text: "more".tr,
                                color: AppColors.lightColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: _controller.exolpre.mentors!
                                .map((mentor) => buildToureGuidesItem(mentor))
                                .toList(),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsetsDirectional.only(
                            start: 26.w, end: 27.w, bottom: 10.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText.medium(
                                text: "service_providers".tr,
                                color: AppColors.mainColor,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500),
                            AppText.medium(
                                text: "more".tr,
                                color: AppColors.lightColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ],
                        ),
                      ),

                      Container(
                        width: double.infinity,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: _controller.exolpre.servicesProvider!
                                .map((servicesProvider) {
                              print('PROVIDEERS: ${servicesProvider}');
                              return buildServiceProviderItem(servicesProvider);
                            }).toList(),
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: 58.h,
                      //   child: ListView.builder(
                      //     shrinkWrap: true,
                      //     itemCount: _controller.mentorsList.length,
                      //     scrollDirection: Axis.horizontal,
                      //     physics: const NeverScrollableScrollPhysics(),
                      //     itemBuilder: (context, index) {
                      //       return buildServiceProviderItem();
                      //     },
                      //   ),
                      // ),

                      FutureBuilder(
                          future: _controller.fetchServiceProviders(
                              serviceId: _controller.providerId),
                          builder: (con, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              return GetBuilder<ExploreController>(
                                builder: (controller) => Column(
                                  children: [
                                    Container(
                                        margin: EdgeInsetsDirectional.only(
                                            start: 26.w,
                                            end: 27.w,
                                            bottom: 10.h),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            AppText.medium(
                                                text: "populerCity".tr,
                                                color: AppColors.mainColor,
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.w500),
                                            AppText.medium(
                                                text: "more".tr,
                                                color: AppColors.lightColor,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500),
                                          ],
                                        )),
                                    Container(
                                        child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              children: _controller
                                                  .listServiceProviders
                                                  .map((providers) =>
                                                      buildPopulerHotelsItem(
                                                          providers))
                                                  .toList(),
                                            ))),
                                  ],
                                ),
                              );
                            } else if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Container(
                                width: 20.w,
                                height: 20.h,
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              return Container();
                            }
                          }),
                      Container(
                        margin: EdgeInsetsDirectional.only(
                            start: 26.w, end: 27.w, bottom: 17.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppText.medium(
                                text: "populer_trips".tr,
                                color: AppColors.mainColor,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w500),
                            AppText.medium(
                                text: "more".tr,
                                color: AppColors.lightColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ],
                        ),
                      ),
                      Container(
                          // height: double.infinity,
                          child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: _controller.exolpre.trips!
                                    .map(
                                      (trips) => buildDetailTripeItem(trips),
                                    )
                                    .toList(),
                              ))),
                    ],
                  ),
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: Container(
                      width: 20.w,
                      height: 20.h,
                      child: CircularProgressIndicator()),
                );
              } else {
                return Container();
              }
            }));
  }

  Widget buildExploreItem(String image) => Container(
        margin: EdgeInsetsDirectional.only(start: 27.w, end: 27.w, bottom: 14),
        height: 170.h,
        decoration: BoxDecoration(
            border: Border.all(
              width: 3.r,
              color: AppColors.mainColor,
            ),
            borderRadius: BorderRadius.circular(10.r)),
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              height: 170.h,
              clipBehavior: Clip.antiAlias,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(7.r)),
              child: Image.network(
                image,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
            Container(
              margin:
                  EdgeInsetsDirectional.only(start: 15.w, end: 15.w, top: 81.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {},
                    child: CircleAvatar(
                      radius: 12.r,
                      backgroundColor: AppColors.mainColor,
                      child: Center(
                        child: Icon(
                          Icons.arrow_back_ios_outlined,
                          size: 12.r,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  InkWell(
                    onTap: () {},
                    child: CircleAvatar(
                      radius: 12.r,
                      backgroundColor: AppColors.mainColor,
                      child: Center(
                        child: Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 12.r,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  // SvgPicture.asset(
                  //   "${Const.icons}arrow_left.svg",
                  // ),
                  // SvgPicture.asset(
                  //   "${Const.icons}arrow_right.svg",
                  // ),
                ],
              ),
            )
          ],
        ),
      );

  Widget buildToureGuidesItem(Mentors mentors) => Container(
        margin:
            EdgeInsetsDirectional.only(start: 27.w, end: 10.w, bottom: 16.h),
        child: mentors.image != null
            ? CircleAvatar(
                radius: 28.r,
                backgroundColor: AppColors.mainColor,
                backgroundImage: NetworkImage(mentors.image!),
              )
            : CircleAvatar(
                radius: 28.r,
                backgroundColor: AppColors.mainColor,
                backgroundImage: AssetImage('${Const.images}maka.jpg'),
              ),
      );

  Widget buildServiceProviderItem(ServicesProvider servicesProvider) => InkWell(
        child: Container(
          margin: EdgeInsetsDirectional.only(start: 20.w, bottom: 16.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  servicesProvider.serviceImg != null
                      ? CircleAvatar(
                          radius: 28.r,
                          backgroundColor: AppColors.mainColor,
                          backgroundImage:
                              NetworkImage(servicesProvider.serviceImg!),
                        )
                      : CircleAvatar(
                          radius: 28.r,
                          backgroundColor: AppColors.mainColor,
                          backgroundImage:
                              AssetImage("${Const.images}maka.jpeg"),
                        ),
                  SizedBox(
                    height: 4.h,
                  ),
                  servicesProvider.service != null
                      ? AppText.medium(
                          text: servicesProvider.service!,
                          color: AppColors.mainColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        )
                      : AppText.medium(
                          text: "defult value",
                          color: AppColors.mainColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                ],
              ),
            ],
          ),
        ),
        onTap: () {
          _controller.providerId = servicesProvider.id!;
          _controller.fetchServiceProviders(serviceId: _controller.providerId);
          _controller.update();
        },
      );

  Widget buildPopulerHotelsItem(ProvidersData providers) => Row(
        children: [
          Container(
            margin: EdgeInsetsDirectional.only(start: 27.w, bottom: 10.h),
            child: Column(
              children: [
                Container(
                  height: 167.h,
                  width: 137.w,
                  clipBehavior: Clip.antiAlias,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
                  child: Image.asset(
                    "${Const.images}hotel.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                AppText.medium(
                    text: providers.name!,
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500)
              ],
            ),
          ),
        ],
      );

  Widget buildDetailTripeItem(Trips tripsDetails) => Container(
        margin:
            EdgeInsetsDirectional.only(start: 27.w, end: 27.w, bottom: 15.h),
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
                Container(
                    height: 167.h,
                    width: double.infinity,
                    margin: EdgeInsetsDirectional.only(bottom: 13.h),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r)),
                    child: tripsDetails.image != null
                        ? Image.network(
                            tripsDetails.image!,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          )
                        : Image.asset(
                            "${Const.images}maka.jpg",
                            fit: BoxFit.cover,
                            width: double.infinity,
                          )),
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
                  children: tripsDetails.tripsservices!
                      .map((services) => Container(
                            width: 38.w,
                            height: 36.h,
                            margin: EdgeInsetsDirectional.only(
                                start: 5.w, end: 5.w),
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: AppColors.mainColor),
                            child: services.serviceImg != null
                                ? Image.network(services.serviceImg!,
                                    fit: BoxFit.fill)
                                : Image.asset("${Const.images}maka.jpg",
                                    fit: BoxFit.fill),
                          ))
                      .toList()),
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
}

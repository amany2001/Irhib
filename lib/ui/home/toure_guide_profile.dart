import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:irhib/controllers/tour_guide_profile_controller.dart';
import 'package:irhib/utils/app_colors.dart';
import 'package:irhib/utils/app_text.dart';

import '../../utils/constants.dart';

class TourGuideProfile extends StatelessWidget {
  TourGuideProfile({super.key});

  final _controller = Get.put(TourGuideProfileController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TourGuideProfileController>(
      builder: (controller) => DefaultTabController(
        length: 3,
        initialIndex: controller.tabIndex,
        child: Column(
          children: [
            Card(
              margin: EdgeInsetsDirectional.only(start: 0, end: 0),
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(1.r),
                bottomLeft: Radius.circular(1.r),
              )),
              color: Colors.white,
              shadowColor: AppColors.mainColor,
              child: Container(
                alignment: AlignmentDirectional.topStart,
                padding: EdgeInsetsDirectional.only(
                    start: 10.r, end: 10.r, top: 10.r, bottom: 1.r),
                width: double.infinity,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40.h,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: AppColors.mainColor,
                        )
                      ],
                    ),
                    Container(
                      margin: EdgeInsetsDirectional.only(
                          start: 20.r, top: 16, bottom: 10.r),
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 30.r,
                            backgroundImage:
                                AssetImage("${Const.images}profile.jpg"),
                          ),
                          Container(
                            margin: EdgeInsetsDirectional.only(
                                start: 10, end: 37.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppText.medium(
                                  text: "Ahmed Aziz",
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.mainColor,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: AppColors.mainColor,
                                      size: 18,
                                    ),
                                    AppText.medium(
                                      text: "Median",
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.mainColor,
                                    ),
                                    SizedBox(
                                      width: 100.w,
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                                    Container(
                                      padding: EdgeInsetsDirectional.only(
                                          top: 5.h, start: 4.r),
                                      child: AppText.medium(
                                          text: "5.0",
                                          color: AppColors.mainColor,
                                          fontSize: 15.sp),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    TabBar(
                      isScrollable: false,
                      labelColor: AppColors.mainColor,
                      unselectedLabelColor: Colors.grey,
                      labelStyle: const TextStyle(
                        color: AppColors.mainColor,
                        fontWeight: FontWeight.w800,
                        fontSize: 16,
                      ),
                      unselectedLabelStyle: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                      indicatorColor: AppColors.lightColor,
                      indicatorWeight: 2.r,
                      indicatorSize: TabBarIndicatorSize.tab,
                      onTap: (int index) {
                        _controller.tabIndex = index;
                        _controller.update();
                      },
                      tabs: [
                        Tab(
                          text: 'Bio',
                        ),
                        Tab(
                          text: 'Plans',
                        ),
                        Tab(
                          text: 'Reviews',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(children: [
                Container(
                    color: Colors.white,
                    margin: EdgeInsetsDirectional.only(top: 0.r),
                    child: TourGuiedBio()),
                Container(
                    color: Colors.white,
                    margin: EdgeInsetsDirectional.only(top: 0.r),
                    child: ToureGuidePlans()),
                Container(
                    color: Colors.white,
                    margin: EdgeInsetsDirectional.only(top: 0.r),
                    child: TourGuideReview()),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

class TourGuideReview extends StatelessWidget {
  const TourGuideReview({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Container(
            margin: EdgeInsetsDirectional.only(start: 42.r, top: 15.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText.medium(
                  text: "Review",
                  color: AppColors.mainColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(
                  height: 9,
                ),
                Row(
                  children: [
                    RatingBarIndicator(
                      rating: 2.75,
                      itemBuilder: (context, index) => Icon(
                        Icons.star,
                        color: Colors.yellow,
                        //  size: 20,
                      ),
                      itemCount: 5,
                      itemSize: 22.0,
                      direction: Axis.horizontal,
                    ),
                    Container(
                      margin: EdgeInsetsDirectional.only(top: 5.r, start: 5.r),
                      child: AppText.medium(
                        text: "300 Reviews",
                        fontSize: 15.sp,
                        color: AppColors.lightColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 9,
                ),
                AppText.medium(
                  text: "Comments frome tourists",
                  color: AppColors.mainColor,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            itemBuilder: (context, index) => buildCommentsItem(),
          )
        ],
      ),
    );
  }

  Widget buildCommentsItem() => Container(
        margin:
            EdgeInsetsDirectional.only(start: 27.w, end: 27.w, bottom: 15.h),
        decoration: BoxDecoration(
            border: Border.all(
              color: AppColors.mainColor,
              width: 3.w,
            ),
            borderRadius: BorderRadius.circular(8.r)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsetsDirectional.only(start: 8.r, top: 4.r),
              child: CircleAvatar(
                radius: 25.r,
                backgroundImage: AssetImage("${Const.images}profile.jpg"),
              ),
            ),
            Expanded(
                child: Container(
              margin: EdgeInsetsDirectional.only(start: 11.r, top: 12.r),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsetsDirectional.only(end: 4.r, bottom: 9.r),
                    child: Row(
                      children: [
                        AppText.medium(
                          text: "Yousef",
                          color: AppColors.mainColor,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        Spacer(),
                        RatingBarIndicator(
                          rating: 2.75,
                          itemBuilder: (context, index) => Icon(
                            Icons.star,
                            color: Colors.yellow,
                            //  size: 20,
                          ),
                          itemCount: 5,
                          itemSize: 22.0,
                          direction: Axis.horizontal,
                        ),
                      ],
                    ),
                  ),
                  AppText.medium(
                      text:
                          'Lorem ipsum. Lorem ipsum Lorem ipsum.Lorem ipsum Lorem ipsum ',
                      maxline: 2,
                      color: AppColors.mainColor,
                      fontWeight: FontWeight.w400),
                  SizedBox(height: 14.h),
                ],
              ),
            ))
          ],
        ),
      );
}

class TourGuiedBio extends StatelessWidget {
  const TourGuiedBio({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) => buildBioItem(),
    );
  }

  Widget buildBioItem() => Container(
      margin: EdgeInsetsDirectional.only(start: 27.w, end: 27.w, bottom: 15.h),
      padding: EdgeInsetsDirectional.all(
        4.r,
      ),
      decoration: BoxDecoration(
          border: Border.all(
            width: 3.r,
            color: AppColors.mainColor,
          ),
          borderRadius: BorderRadius.circular(10.r)),
      child: Container(
        margin: EdgeInsetsDirectional.only(start: 10.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText.medium(
                text:
                    "Lorem ipsum.Lorem ipsum.Lorem ipsum. Lorem ipsum.Lorem ipsum.Lorem ipsum. Lorem ipsum.Lorem ipsum.Lorem ipsum.",
                maxline: 4,
                color: AppColors.mainColor,
                fontWeight: FontWeight.w500),
          ],
        ),
      ));
}

class ToureGuidePlans extends StatelessWidget {
  const ToureGuidePlans({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: 6,
      itemBuilder: (context, index) => buildPlansItem(),
    );
  }

  Widget buildPlansItem() => Container(
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
                    child: Image.asset(
                      "${Const.images}maka.jpg",
                      fit: BoxFit.cover,
                      width: double.infinity,
                    )),
                Container(
                  margin: EdgeInsetsDirectional.all(10.r),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AppText.medium(
                          text: "Maka Al_Mokarma",
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
                children: [
                  Container(
                    width: 38.w,
                    height: 36.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: AppColors.mainColor),
                    child: SvgPicture.asset("${Const.icons}util.svg",
                        fit: BoxFit.scaleDown),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Container(
                    width: 38.w,
                    height: 36.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: AppColors.mainColor),
                    child: SvgPicture.asset("${Const.icons}beds.svg",
                        fit: BoxFit.scaleDown),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                  Container(
                    width: 38.w,
                    height: 36.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: AppColors.mainColor),
                    child: SvgPicture.asset("${Const.icons}bus.svg",
                        fit: BoxFit.scaleDown),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                Container(
                  margin: EdgeInsetsDirectional.only(top: 5.r, start: 5.r),
                  child: AppText.medium(
                    text: "300 Reviews",
                    fontSize: 15.sp,
                    color: AppColors.lightColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.favorite,
                  color: Colors.black54,
                  size: 30,
                ),
              ],
            ),
            SizedBox(
              height: 16.h,
            ),
            Align(
              alignment: AlignmentDirectional.center,
              child: InkWell(
                onTap: () {},
                child: Container(
                    // margin: EdgeInsetsDirectional.only(bottom: 15.h),
                    alignment: AlignmentDirectional.center,
                    width: 254,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.mainColor,
                    ),
                    child: AppText.medium(
                        fontWeight: FontWeight.w700,
                        text: 'Book Now',
                        fontSize: 18,
                        color: Colors.white)),
              ),
            ),
          ],
        ),
      );
}

Widget tourGuideReview() => Padding(
      padding: EdgeInsetsDirectional.only(start: 42.w, end: 42.w),
      child: Column(
        children: [
          Container(
            margin: EdgeInsetsDirectional.only(top: 24.h, bottom: 15.h),
            child: AppText.medium(
                text: "Review",
                color: AppColors.mainColor,
                fontWeight: FontWeight.w600,
                fontSize: 18.sp),
          ),
          Container(
            child: Row(
              children: [
                RatingBarIndicator(
                  rating: 2.75,
                  itemBuilder: (context, index) => Icon(
                    Icons.star,
                    color: Colors.yellow,
                    //  size: 20,
                  ),
                  itemCount: 5,
                  itemSize: 10.0,
                  direction: Axis.horizontal,
                ),
                SizedBox(
                  width: 7.w,
                ),
                AppText.medium(
                  text: "300 Review",
                  color: AppColors.lightColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
          AppText.medium(
            text: "Comment from tourist",
            color: AppColors.mainColor,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          Container(
            height: 113.h,
            width: double.infinity,
            padding: EdgeInsetsDirectional.all(10),
            decoration: BoxDecoration(
                border: Border.all(
                  width: 3.r,
                  color: AppColors.mainColor,
                ),
                borderRadius: BorderRadius.circular(10.r)),
            child: Row(
              children: [
                CircleAvatar(),
                Column(),
              ],
            ),
          ),
        ],
      ),
    );

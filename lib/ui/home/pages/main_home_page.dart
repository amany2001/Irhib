import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:irhib/controllers/home_controller.dart';
import 'package:irhib/controllers/main_home_controller.dart';
import 'package:irhib/model/home/ads.dart';
import 'package:irhib/model/main_home.dart';
import 'package:irhib/ui/guide_app/add_tripe.dart';
import 'package:irhib/ui/home/pages/explore_page.dart';
import 'package:irhib/utils/app_colors.dart';
import 'package:irhib/utils/app_text.dart';

import '../../../utils/constants.dart';

class MainHome extends StatelessWidget {
  MainHome({super.key});

  final _controller = Get.put(MainHomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Container(
            margin: EdgeInsetsDirectional.only(
              start: 27.w,
              end: 27.w,
              top: 58.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  child: SvgPicture.asset(
                    "${Const.icons}drawer.svg",
                  ),
                  onTap: () {
                    HomeController controller = Get.find();
                    controller.drawerKey.currentState!.openDrawer();
                  },
                ),
                AppText.medium(
                  text: "اكتشف",
                  color: AppColors.mainColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
                SvgPicture.asset(
                  "${Const.icons}notivigation_bell.svg",
                ),
              ],
            ),
          ),
          Container(
              margin: EdgeInsetsDirectional.only(
                  top: 10.h, bottom: 16.h, start: 27.w, end: 27.w),
              height: 191.h,
              width: double.infinity,
              child: FutureBuilder(
                future: _controller.fetchAdsDetails(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return ImageSlideshow(
                        isLoop: false,
                        disableUserScrolling: false,
                        initialPage: 0,
                        autoPlayInterval: 3000,
                        indicatorColor: AppColors.mainColor,
                        children: _controller.listAdsDetails
                            .map((ads) => buildAdsDetailsItem(ads))
                            .toList());
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Container(
                        height: 20.h,
                        width: 20.w,
                        child: CircularProgressIndicator());
                  } else {
                    return Container();
                  }
                },
              )),
          Container(
              height: 40.h,
              width: 321.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.subColor,
              ),
              child: TextField(
                onChanged: (word) {
                  _controller.fetchHomeDetails(word);
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppColors.mainColor,
                  ),
                  hintText: "search".tr,
                  hintStyle: TextStyle(
                    color: AppColors.lightColor,
                    fontSize: 18,
                  ),
                  border: InputBorder.none,
                ),
              )),
          Container(
            margin: EdgeInsetsDirectional.only(
                top: 27.h, start: 26.w, end: 27.w, bottom: 17.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            ),
          ),
          FutureBuilder(
            future: _controller.fetchHomeDetails(''),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return GetBuilder<MainHomeController>(
                  builder: (controller) => ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _controller.listHomeDetails.length,
                    itemBuilder: (context, index) => buildPopulerCitiesItem(
                        _controller.listHomeDetails[index]),
                  ),
                );
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else {
                return Container();
              }
            },
          )
        ],
      ),
    ));
  }
}

Widget buildAdsDetailsItem(AdsData ads) => InkWell(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Image.network(
          ads.img!,
          fit: BoxFit.cover,
        ),
      ),
      onTap: () {
        Get.to(() => AddTripe());
      },
    );

Widget buildPopulerCitiesItem(HomeData homeData) => InkWell(
      onTap: () {
        Get.to(() => Explore(
              cityId: homeData.id,
              cityName: homeData.name,
            ));
      },
      child: Container(
        width: double.infinity,
        // height: 184.h,
        margin: EdgeInsetsDirectional.only(
          start: 27.w,
          end: 27.w,
          bottom: 15.h,
        ),
        padding: EdgeInsetsDirectional.all(5.r),
        decoration: BoxDecoration(
            border: Border.all(
              width: 3.w,
              color: AppColors.mainColor,
            ),
            borderRadius: BorderRadius.circular(10.r)),
        child: Container(
          //  height: 184.h,
          width: double.infinity,
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              Container(
                height: 174.h,
                clipBehavior: Clip.antiAlias,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
                child: Image.network(
                  // isAntiAlias: true,
                  homeData.img!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              Container(
                margin: EdgeInsetsDirectional.all(10.r),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    AppText.medium(
                        text: homeData.name!,
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
        ),
      ),
    );

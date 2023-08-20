import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:irhib/utils/constants.dart';

import '../../utils/app_text.dart';

class TripeDetailsPage extends StatelessWidget {
  const TripeDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            // height: double.infinity,
            child: Image.asset(
              '${Const.images}tripe_background_image.png',
              fit: BoxFit.cover,
              height: double.infinity,
            ),
          ),
          Container(
            margin: EdgeInsetsDirectional.only(top: 80.h, bottom: 20.h),
            child: Align(
              alignment: AlignmentDirectional.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SvgPicture.asset("${Const.icons}log.png"),
                  AppText.medium(
                    text: "tripe_details".tr,
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                  Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

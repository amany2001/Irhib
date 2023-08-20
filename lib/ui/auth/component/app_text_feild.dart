import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_text.dart';

class AppTextFeiled extends StatelessWidget {
  AppTextFeiled({
    super.key,
    required this.text,
    this.hintText,
    this.color,
    this.prefixIcon,
    this.controller,
    this.validation,
    this.onSaved,
  });

  String? text;
  String? hintText;
  Color? color;
  TextEditingController? controller;
  String? Function(String?)? validation;
  void Function(String?)? onSaved;
  // Color cursorColor = AppColors.mainColor;
  // double cursorWidth = 1.3.w;
  // Radius cursorRadius = Radius.circular(10.r);
  // bool enabeld = true;

  Icon? prefixIcon;

  EdgeInsetsGeometry margin = EdgeInsetsDirectional.only(top: 8, bottom: 10);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            padding: EdgeInsetsDirectional.only(start: 5.w),
            child: AppText.medium(text: text!, color: AppColors.mainColor)),
        Container(
          //padding: EdgeInsetsDirectional.only(top: 1),
          margin: margin,
          decoration: BoxDecoration(
            color: AppColors.subColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            // textAlign: TextAlign.right,
            controller: controller,
            validator: validation,
            onSaved: onSaved,
            cursorColor: AppColors.mainColor,
            cursorWidth: 1.3.w,
            cursorRadius: Radius.circular(10.r),
            enabled: true,
            textAlignVertical: TextAlignVertical.center,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
                color: AppColors.mainColor),
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: TextStyle(
                  color: AppColors.mainColor,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.normal),
              prefixIcon: prefixIcon,
              fillColor: AppColors.subColor,
              filled: true,
              helperMaxLines: 2,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 1.w),
                borderRadius: BorderRadius.circular(8).r,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.subColor, width: 1.w),
                borderRadius: BorderRadius.circular(8).r,
              ),
              constraints: BoxConstraints(
                maxHeight: 50.h,
                minWidth: 48.w,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

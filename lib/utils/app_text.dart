import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:irhib/utils/constants.dart';

class AppText {
  static Widget medium(
      {required String text,
      Color? color = Colors.black,
      double fontSize = 16,
      double? height,
      FontWeight fontWeight = FontWeight.w500,
      TextAlign? textAlign,
      TextDecoration? textDecoration,
      int? maxline}) {
    return Text(
      text.tr,
      textAlign: textAlign,
      textWidthBasis: TextWidthBasis.longestLine,
      maxLines: maxline,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          decoration: textDecoration,
          overflow: TextOverflow.ellipsis,
          fontFamily: Const.appFont,
          fontSize: fontSize,
          color: color,
          height: height,
          fontWeight: fontWeight),
    );
  }
}

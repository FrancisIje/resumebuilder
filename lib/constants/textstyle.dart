import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:resumebuilder/constants/colors.dart';

String appFont = "Acquire";

class AppText {
  static TextStyle title = TextStyle(
      fontSize: 22.sp,
      color: Colors.black,
      fontFamily: appFont,
      fontWeight: FontWeight.w700);
  static TextStyle body = TextStyle(
      fontSize: 14.sp, color: AppColors.textColor, fontFamily: appFont);
  static TextStyle subtitle = TextStyle(
      fontSize: 16.sp, color: AppColors.textColor, fontFamily: appFont);
  static TextStyle greySubtitle = TextStyle(
      fontSize: 16.sp, color: AppColors.textColorGrey, fontFamily: appFont);
}

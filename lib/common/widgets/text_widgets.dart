import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app_flutter_udemy/common/utils/app_colors.dart';

Widget text24Normal({String text = "", Color color = AppColors.primaryText}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal, color: color),
  );
}

Widget text16Normal(
    {String text = "", Color color = AppColors.primarySecondaryElementText}) {
  return Text(
    text,
    textAlign: TextAlign.center,
    style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: color),
  );
}

Widget text14Normal(
    {String text = "", Color color = AppColors.primaryThreeElementText}) {
  return Text(
    text,
    textAlign: TextAlign.start,
    style:
        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.normal, color: color),
  );
}

Widget textUnderline({String text ="Forgot Password"}) {
  return GestureDetector(
    onTap: (){

    },
    child: Text(
      text,
      style: TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 12.sp,
          color: AppColors.primaryText,
      decoration: TextDecoration.underline,
      decorationColor: AppColors.primaryText),
    ),
  );
}

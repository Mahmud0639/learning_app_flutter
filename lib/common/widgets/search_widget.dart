import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app_flutter_udemy/common/utils/app_colors.dart';
import 'package:shop_app_flutter_udemy/common/utils/image_res.dart';
import 'package:shop_app_flutter_udemy/common/widgets/app_textfields.dart';
import 'package:shop_app_flutter_udemy/common/widgets/box_shadow.dart';
import 'package:shop_app_flutter_udemy/common/widgets/image_widget.dart';

Widget searchBar(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        width: 260.w,
        height: 40.h,
        decoration: boxDecoration(color: AppColors.primaryBackground,border: Border.all(color: AppColors.primaryFourElementText)),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 15.w),
              child: appImage(imagePath: ImageRes.search),
            ),
            SizedBox(
              width: 200.w,
              height: 40.h,
              child: app_textfield_only(width: 240.w,height: 40.h,hintText: "Search your course..."),
            )
          ],
        ),
      ),
      GestureDetector(
        child: Container(
          width: 40.w,
          height: 40.h,
          padding: EdgeInsets.all(5.w),
          decoration: boxDecoration(border: Border.all(color: AppColors.primaryElement)),
          child: appImage(imagePath: ImageRes.searchButton),
        ),
      )
    ],
  );
}
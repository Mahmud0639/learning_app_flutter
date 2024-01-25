import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app_flutter_udemy/common/utils/app_colors.dart';

import '../utils/image_res.dart';

BoxDecoration boxDecoration(
    {Color color = AppColors.primaryElement,
    double radius = 12,
    double sR = 1,
    double bR = 2,
    BoxBorder? border}) {
  return BoxDecoration(boxShadow: [
    BoxShadow(
        color: Colors.grey.withOpacity(0.1),
        spreadRadius: sR,
        blurRadius: bR,
        offset: Offset(0, 1))
  ], color: color, borderRadius: BorderRadius.circular(radius),border: border);
}

BoxDecoration boxDecorationWithRadius(
    {Color color = AppColors.primaryElement,
      double radius = 12,
      double sR = 1,
      double bR = 2,
      BoxBorder? border}) {
  return BoxDecoration(boxShadow: [
    BoxShadow(
        color: Colors.grey.withOpacity(0.1),
        spreadRadius: sR,
        blurRadius: bR,
        offset: Offset(0, 1))
  ], color: color, borderRadius: BorderRadius.only(topLeft: Radius.circular(20.h),topRight: Radius.circular(20.h)),border: border);
}

BoxDecoration appBoxTextFormField(
    {Color color = AppColors.primaryBackground,
    Color borderColor = AppColors.primaryFourElementText,
    double radius = 15}) {
  return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(
        color: borderColor,
      ));
}

class AppBoxDecorationImage extends StatelessWidget {
  final double width;
  final double height;
  final String imgPath;
  const AppBoxDecorationImage({super.key,this.width=40,this.height=40,this.imgPath=ImageRes.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width.h,
      height: height.h,
      decoration: BoxDecoration(
          image:  DecorationImage(
              image: NetworkImage(
                  imgPath
              )
          ),
          borderRadius: BorderRadius.circular(20.w)
      ),
    );
  }
}


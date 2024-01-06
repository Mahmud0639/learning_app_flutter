import 'package:flutter/material.dart';
import 'package:shop_app_flutter_udemy/common/utils/app_colors.dart';

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
  ], color: color, borderRadius: BorderRadius.circular(12),border: border);
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

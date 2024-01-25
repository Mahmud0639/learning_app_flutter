import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app_flutter_udemy/common/utils/app_colors.dart';
import 'package:shop_app_flutter_udemy/common/utils/image_res.dart';

Widget appImage({String imagePath = ImageRes.defaultImage,double width = 16, double height = 16}){
  return Image.asset(imagePath.isEmpty?ImageRes.defaultImage:imagePath,width: width.w,height: height.h);
}

Widget appImageWithColor({String imgPath = ImageRes.defaultImage,double width = 15,double height = 15,Color color = AppColors.primaryElement}){
  return Image.asset(imgPath.isEmpty?ImageRes.defaultImage:imgPath,width: width,height: height,color: color,);
}
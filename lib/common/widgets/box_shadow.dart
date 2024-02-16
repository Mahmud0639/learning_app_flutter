import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app_flutter_udemy/common/models/course_entity.dart';
import 'package:shop_app_flutter_udemy/common/utils/app_colors.dart';
import 'package:shop_app_flutter_udemy/common/widgets/text_widgets.dart';

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
  final BoxFit fit;
  final CourseItem? item;
  final Function()? func;
  const AppBoxDecorationImage({super.key,this.width=40,this.height=40,this.imgPath=ImageRes.user,this.fit=BoxFit.fitHeight,this.item,this.func});

  //changed after adding the CachedNetworkImage
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: CachedNetworkImage(imageUrl: imgPath,
        imageBuilder: (context,imageProvider)=>Container(
        width: width.h,
        height: height.h,
        decoration: BoxDecoration(
            image:  DecorationImage(
                fit: fit,
                image: imageProvider
            ),
            borderRadius: BorderRadius.circular(20.w)
        ),
        child:  item == null? Container():Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 20.w),
              child: FadeText(text:item!.name!),
            ),
            Container(
              margin: EdgeInsets.only(left: 20.w,bottom: 40.h),
              child: FadeText(text: "${item!.lesson_num!} Lessons",color: AppColors.primaryFourElementText,fontSize: 8,),
            )
          ],
        ),
      ),
        placeholder: (context,url)=>Container(//it will show a loading as placeholder while loading the data
        alignment: Alignment.center,
        child: const CircularProgressIndicator(),
      ),
        errorWidget: (context,url,error)=>Image.asset(ImageRes.defaultImage),
      ),
    );
  }
}


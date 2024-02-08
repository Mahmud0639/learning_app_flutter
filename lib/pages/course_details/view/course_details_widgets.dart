import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app_flutter_udemy/common/models/course_entity.dart';
import 'package:shop_app_flutter_udemy/common/utils/app_colors.dart';
import 'package:shop_app_flutter_udemy/common/utils/constants.dart';
import 'package:shop_app_flutter_udemy/common/utils/image_res.dart';
import 'package:shop_app_flutter_udemy/common/widgets/box_shadow.dart';
import 'package:shop_app_flutter_udemy/common/widgets/button_widget.dart';
import 'package:shop_app_flutter_udemy/common/widgets/image_widget.dart';
import 'package:shop_app_flutter_udemy/common/widgets/text_widgets.dart';

class CourseDetailsThumbnail extends StatelessWidget {
  final CourseItem courseItem;
  const CourseDetailsThumbnail({super.key,required this.courseItem});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: 25.w,vertical: 0.h),child: AppBoxDecorationImage(imgPath: "${AppConstants.IMAGE_UPLOAD_PATH}${courseItem.thumbnail}",width: 325.w,height: 200.h,fit: BoxFit.fitWidth,),);
  }
  
  
}

class CourseDetailsIconText extends StatelessWidget {
  final CourseItem courseItem;
  const CourseDetailsIconText({super.key,required this.courseItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      width: 325.w,
      child: Row(
        children: [
          GestureDetector(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 5.h),
              decoration: boxDecoration(radius: 7),
              child: Text10Normal(
                text: "Author Page",
                color: AppColors.primaryElementText,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30.w),
            child: Row(
              children: [
                AppImage(imagePath: ImageRes.people,),
                Text11Normal(
                  text: courseItem.follow==null?"0":courseItem.follow.toString(),
                  color: AppColors.primaryThreeElementText,
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30.w),
            child: Row(
              children: [
                AppImage(imagePath: ImageRes.star,),
                Text11Normal(
                  text: courseItem.score==null?"0":courseItem.score.toString(),
                  color: AppColors.primaryThreeElementText,
                )
              ],
            ),
          )

        ],
      ),
    );
  }
}

class CourseDetailsDescription extends StatelessWidget {
  final CourseItem courseItem;
  const CourseDetailsDescription({super.key,required this.courseItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text16Normal(text: courseItem.name==null?"Course description":courseItem.name!,color: AppColors.primaryText,textAlign: TextAlign.left,fontWeight: FontWeight.bold,),
          Container(child: Text11Normal(text: courseItem.description==null?"No description found.":courseItem.description!,color: AppColors.primaryThreeElementText,))
        ],
      ),
      
    );
  }
}

class CourseDetailsGoBuyButton extends StatelessWidget {
  const CourseDetailsGoBuyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(margin:EdgeInsets.only(top: 20.h),child: ButtonWidget(buttonName: "Go Buy"));
  }
}

class CourseDetailsInclue extends StatelessWidget {
  const CourseDetailsInclue({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      child: Column(
        children: [
          Text14Normal(
            text: "Course Includes",
            fontWeight: FontWeight.bold,
          ),
        ],
      ),
    );
  }
}










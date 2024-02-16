import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app_flutter_udemy/common/models/course_entity.dart';
import 'package:shop_app_flutter_udemy/common/models/lesson_entities.dart';
import 'package:shop_app_flutter_udemy/common/utils/app_colors.dart';
import 'package:shop_app_flutter_udemy/common/utils/constants.dart';
import 'package:shop_app_flutter_udemy/common/utils/image_res.dart';
import 'package:shop_app_flutter_udemy/common/widgets/box_shadow.dart';
import 'package:shop_app_flutter_udemy/common/widgets/button_widget.dart';
import 'package:shop_app_flutter_udemy/common/widgets/image_widget.dart';
import 'package:shop_app_flutter_udemy/common/widgets/text_widgets.dart';
import 'package:shop_app_flutter_udemy/pages/lesson_detail/controller/lesson_controller.dart';

class CourseDetailsThumbnail extends StatelessWidget {
  final CourseItem courseItem;

  const CourseDetailsThumbnail({super.key, required this.courseItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 0.h),
      child: AppBoxDecorationImage(
        imgPath: "${AppConstants.IMAGE_UPLOAD_PATH}${courseItem.thumbnail}",
        width: 325.w,
        height: 200.h,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}

class CourseDetailsIconText extends StatelessWidget {
  final CourseItem courseItem;

  const CourseDetailsIconText({super.key, required this.courseItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      width: 325.w,
      child: Row(
        children: [
          GestureDetector(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
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
                AppImage(
                  imagePath: ImageRes.people,
                ),
                Text11Normal(
                  text: courseItem.follow == null
                      ? "0"
                      : courseItem.follow.toString(),
                  color: AppColors.primaryThreeElementText,
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30.w),
            child: Row(
              children: [
                AppImage(
                  imagePath: ImageRes.star,
                ),
                Text11Normal(
                  text: courseItem.score == null
                      ? "0"
                      : courseItem.score.toString(),
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

  const CourseDetailsDescription({super.key, required this.courseItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text16Normal(
            text: courseItem.name == null
                ? "Course description"
                : courseItem.name!,
            color: AppColors.primaryText,
            textAlign: TextAlign.left,
            fontWeight: FontWeight.bold,
          ),
          Container(
              child: Text11Normal(
            text: courseItem.description == null
                ? "No description found."
                : courseItem.description!,
            color: AppColors.primaryThreeElementText,
          ))
        ],
      ),
    );
  }
}

class CourseDetailsGoBuyButton extends StatelessWidget {
  const CourseDetailsGoBuyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 20.h),
        child: ButtonWidget(buttonName: "Go Buy"));
  }
}

class CourseDetailsInclude extends StatelessWidget {
  final CourseItem courseItem;

  const CourseDetailsInclude({super.key, required this.courseItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text14Normal(
            text: "Course Includes",
            fontWeight: FontWeight.bold,
          ),
          /*Row(
            children: [
              Container(
                alignment: Alignment.center,
                child: AppImage(
                  imagePath: ImageRes.videoDetail,
                  width: 30,
                  height: 30,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10.w),
                child: Text11Normal(
                  text: courseItem.video_len==null?"0 hours video":"${courseItem.video_len} hours video",
                ),
              )
            ],
          )*/
          SizedBox(
            height: 16.h,
          ),
          CourseInfo(
            length: courseItem.video_len,
            imagePath: "${ImageRes.videoDetail}",
            infoText: "hours video",
          ),
          SizedBox(
            height: 16.h,
          ),
          CourseInfo(
            length: courseItem.lesson_num,
            imagePath: ImageRes.fileDetail,
            infoText: "number of files",
          ),
          SizedBox(
            height: 16.h,
          ),
          CourseInfo(
            length: courseItem.down_num,
            imagePath: ImageRes.downloadDetail,
            infoText: "number of items to be downloads",
          )
        ],
      ),
    );
  }
}

class CourseInfo extends StatelessWidget {
  final int? length;
  final String? imagePath;
  final String? infoText;

  const CourseInfo(
      {super.key, required this.length, this.imagePath, this.infoText});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          child: AppImage(
            imagePath: imagePath!,
            width: 30,
            height: 30,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 10.w),
          child: Text11Normal(
            //if the server has not any value and our variable is trying to return int value then the both hashCode value will be same

            //if the model variable type is int and the server does not have the variable of int variable then we will find
            //everytime null, here we can understand this with the help of hashCode object with an example like: variableName.hashCode
            //with comparing null.hashCode, we need to mind it that the variable.hashCode and the null.hashCode is not same
            //take an example:
            /* if(length.hashCode==null.hashCode){
                print("They are same");
                }else{
                print("Not same");
                }*/
            text: length == null ? "0 $infoText" : "$length $infoText",
          ),
        )
      ],
    );
  }
}

class LessonInfo extends StatelessWidget {
  final List<LessonItem> lessonData;
  final WidgetRef ref;

  const LessonInfo({super.key, required this.lessonData,required this.ref});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          lessonData.isNotEmpty?Text14Normal(
            text: "Lesson list",
            color: AppColors.primaryText,
            fontWeight: FontWeight.bold,
          ):SizedBox(),
          SizedBox(
            height: 10,
          ),
          ListView.builder(
              shrinkWrap: true,//(see 171 video and from the starting point of this video)if we don't do the shrinkWrap: true then it won't take effect properly, because by default it wants to take occupy the whole space of the screen, if we do shrinkWrap: true then it would try to take the minimize space of it
              itemCount: lessonData.length,
              itemBuilder: (_, index) {
                return Container(
                  margin: EdgeInsets.only(top: 10.h),
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  width: 325.w,
                  height: 80.h,
                  decoration: boxDecoration(
                      radius: 10,
                      color: const Color.fromRGBO(255, 255, 255, 1),
                      //it's more like white
                      sR: 2,
                      bR: 3),
                  child: InkWell(
                    onTap: (){
                      //we are passing id to the lesson_controller class to get the response from the server id based
                      ref.watch(lessonDetailControllerProvider(index: lessonData[index].id!));
                      //here we are passing id based on the click event on the specific items
                      Navigator.of(context).pushNamed("/lessonDetail",arguments: {"id":lessonData[index].id});
                    },
                    child: Row(
                      children: [
                        AppBoxDecorationImage(
                          width: 60.w,
                          height: 60.h,
                          fit: BoxFit.fill,
                          imgPath: "${AppConstants.IMAGE_UPLOAD_PATH}${lessonData[index].thumbnail}",
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                         Expanded(
                           child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text13Normal(
                                text: "${lessonData[index].name}",
                              ),
                              Text10Normal(
                                text: "${lessonData[index].description}",
                              ),
                            ],
                        ),
                         ),

                        //Expanded(child: Container()),
                        //using the Expanded widget we pushed the last Text to the far end as possible in the Container
                        AppImage(
                          imagePath: ImageRes.arrowRight,
                          width: 24.w,
                          height: 24.h,
                        )
                      ],
                    ),
                  ),
                );
              }),
        ],
      ),
    );
  }
}

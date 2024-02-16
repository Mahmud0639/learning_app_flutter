import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app_flutter_udemy/common/models/lesson_entities.dart';
import 'package:shop_app_flutter_udemy/common/utils/constants.dart';
import 'package:shop_app_flutter_udemy/common/utils/image_res.dart';
import 'package:shop_app_flutter_udemy/common/widgets/box_shadow.dart';
import 'package:shop_app_flutter_udemy/common/widgets/image_widget.dart';
import 'package:shop_app_flutter_udemy/pages/lesson_detail/controller/lesson_controller.dart';

//a complete ListViewBuilder usage thing

class LessonVideos extends StatelessWidget {
  final List<LessonVideoItem> lessonVideoItem;
  final WidgetRef ref;
  final Function syncVideoIndex;
  const LessonVideos({super.key,required this.lessonVideoItem,required this.ref,required this.syncVideoIndex});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(shrinkWrap: true,itemCount: lessonVideoItem.length,itemBuilder: (context,index){
      return Container(
        margin: EdgeInsets.only(top: 10.h),
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        width: 325.w,
        height: 80.h,
        decoration: boxDecoration(
          radius: 10,
          sR: 2,
          bR: 3,
          color: const Color.fromRGBO(255, 255, 255, 1),
        ),
        child: InkWell(
          onTap: (){
            //to access the method of syncVideoIndex we need to make a connection through
            // between the lesson_details to lesson_details_widgets with the help of argument passing(function)
            //receiving the argument value in this class and calling the method to send the index while clicking
            //on the video items list
            syncVideoIndex(index);
            var vidUrl = lessonVideoItem[index].url;
            ref.read(lessonDataControllerProvider.notifier).playNextVideo(vidUrl!);
          },
          child: Row(
            children: [
              AppBoxDecorationImage(
                width: 60.w,
                height: 60.h,
                imgPath: "${AppConstants.IMAGE_UPLOAD_PATH}${lessonVideoItem[index].thumbnail}",
                fit: BoxFit.fill,
              ),
              SizedBox(width: 8.w,),
              Expanded(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${lessonVideoItem[index].name}"),
                  //Text("Mahmud")
                ],
              ),
              ),
              const AppImage(
                imagePath: ImageRes.arrowRight,
                width: 24,
                height: 24,
              )
            ],
          ),
        ),
      );
    });
  }
}

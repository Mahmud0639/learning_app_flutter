import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app_flutter_udemy/common/widgets/app_bar.dart';
import 'package:shop_app_flutter_udemy/pages/course_details/controller/course_controller.dart';
import 'package:shop_app_flutter_udemy/pages/course_details/view/course_details_widgets.dart';

class CourseDetails extends ConsumerStatefulWidget {
  const CourseDetails({super.key});

  @override
  ConsumerState<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends ConsumerState<CourseDetails> {
  //we used Stateful widget because we can override didChangeDependencies
  late var args;

  @override
  void didChangeDependencies() {
    //we receive argument data as Map because we sent id as Map from the home_widgets page
    var id = ModalRoute.of(context)!.settings.arguments as Map;
    args = id["id"]; //we are accessing our id from map

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var courseData =
        ref.watch(courseDetailsControllerProvider(index: args.toInt()));
    var lessonData =
        ref.watch(courseLessonListControllerProvider(index: args.toInt()));
    return Scaffold(
        appBar: buildGlobalAppBar(text: "Course details"),
        body: /*courseData.when(data: (data){
        return data==null?SizedBox():*/
            Padding(
          padding: EdgeInsets.only(left: 25.w, right: 25.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                courseData.when(
                    data: (data) => data == null
                        ? const SizedBox()
                        : Column(
                            children: [
                              CourseDetailsThumbnail(courseItem: data),
                              CourseDetailsIconText(
                                courseItem: data,
                              ),
                              CourseDetailsGoBuyButton(courseItem: data,),
                              CourseDetailsInclude(courseItem: data)
                            ],
                          ),
                    error: (error, stackTrace) => const Text("Error occurred."),
                    loading: () => SizedBox(
                      height: 500.h,
                      child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                    )),
                lessonData.when(
                    data: (data) => data == null ? const SizedBox() : LessonInfo(lessonData: data,ref:ref),
                    error: (error, stackTrace) => const Text("Error occurred."),
                    loading: () => SizedBox(
                      height: 500.h, 
                      child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                    ))
              ],
            ),
          ),
        )
        //}, error: (error,traceStack)=>Text("Error occurred."), loading: ()=>Center(child: CircularProgressIndicator(),)),
        );
  }
}

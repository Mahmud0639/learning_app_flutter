import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shop_app_flutter_udemy/common/models/course_entity.dart';
import 'package:shop_app_flutter_udemy/common/models/lesson_entities.dart';
import 'package:shop_app_flutter_udemy/pages/course_details/repo/course_repo.dart';
part 'course_controller.g.dart';


//we used here the Future provider, it should use when we need to work with the api response
//To convert Future provider to Family provider we need to pass extra dependency like {required int index}
@riverpod
Future<CourseItem?> courseDetailsController(CourseDetailsControllerRef ref,{required int index}) async{
    //with the help of the ref object we can access other ref like ref.watch(homeCourseListProvider)
    CourseRequestEntity courseRequestEntity = CourseRequestEntity();
    courseRequestEntity.id = index;
    final response = await CourseRepo.courseDetails(params: courseRequestEntity);
    if(response.code==200){
      return response.data;
    }else{
      if (kDebugMode) {
        print('Request failed: ${response.code}');
      }
    }
    return null;
}
//we use List here because we get data as list means multiple json objects
@riverpod
Future<List<LessonItem>?> courseLessonListController(CourseLessonListControllerRef ref,{required int index}) async{
  //with the help of the ref object we can access other ref like ref.watch(homeCourseListProvider)
  LessonRequestEntity lessonRequestEntity = LessonRequestEntity();
  lessonRequestEntity.id = index;
  final response = await CourseRepo.courseLessonList(params: lessonRequestEntity);
  if(response.code==200){
    return response.data;
  }else{
    if (kDebugMode) {
      print('Request failed: ${response.code}');
    }
  }
  return null;
}
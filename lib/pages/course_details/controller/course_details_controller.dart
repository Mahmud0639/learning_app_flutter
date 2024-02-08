import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shop_app_flutter_udemy/common/models/course_entity.dart';
import 'package:shop_app_flutter_udemy/pages/course_details/repo/course_details_repo.dart';
part 'course_details_controller.g.dart';


//we used here the Future provider, it should use when we need to work with the api response
//To convert Future provider to Family provider we need to pass extra dependency like {required int index}
@riverpod
Future<CourseItem?> courseDetailsController(CourseDetailsControllerRef ref,{required int index}) async{
    //with the help of the ref object we can access other ref like ref.watch(homeCourseListProvider)
    CourseRequestEntity courseRequestEntity = CourseRequestEntity();
    courseRequestEntity.id = index;
    final response = await CourseDetailsRepo.courseDetails(params: courseRequestEntity);
    if(response.code==200){
      return response.data;
    }else{
      if (kDebugMode) {
        print('Request failed: ${response.code}');
      }
    }
    return null;
}
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shop_app_flutter_udemy/common/models/course_entity.dart';
import 'package:shop_app_flutter_udemy/pages/buy_course/repo/buy_course_repo.dart';
import 'package:shop_app_flutter_udemy/pages/course_details/repo/course_repo.dart';
part 'buy_course_controller.g.dart';


@riverpod
Future<String?> buyCourseController(BuyCourseControllerRef ref,{required int index})async{
  CourseRequestEntity courseRequestEntity = CourseRequestEntity();
  courseRequestEntity.id = index;
  final response = await BuyCourseRepo.buyCourse(params: courseRequestEntity);

  if(response.code == 200){
    return response.data;
  }else{
    print('request failed ${response.code}');
  }
  return null;
}
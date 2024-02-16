import 'package:shop_app_flutter_udemy/common/models/lesson_entities.dart';
import 'package:shop_app_flutter_udemy/common/utils/http_utils.dart';

class LessonRepo{
  static Future<LessonDetailResponseEntity> courseLessonDetail({LessonRequestEntity? params})async{
    //here we need to convert the String or int id into json format
    // because we want to pass to server with the id number to get the response data
    //after getting the response we want to convert them into object format (json to object)
    //with the help of fromJson() method
    var response = await HttpUtil().post("api/lessonDetail",queryParameters: params!.toJson());
    return LessonDetailResponseEntity.fromJson(response);
  }
}
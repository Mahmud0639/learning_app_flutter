import 'package:shop_app_flutter_udemy/common/models/course_entity.dart';
import 'package:shop_app_flutter_udemy/common/utils/http_utils.dart';

class CourseDetailsRepo{
  static Future<CourseDetailResponseEntity> courseDetails({CourseRequestEntity? params}) async{
    //with this we will get a response as json in the response variable and then we will pass this response in the fromJson() to get the json data as object form
    var response = await HttpUtil().post("api/courseDetail",queryParameters: params!.toJson());
    return CourseDetailResponseEntity.fromJson(response);
  }
}
import 'package:shop_app_flutter_udemy/common/models/base_entity.dart';
import 'package:shop_app_flutter_udemy/common/models/course_entity.dart';
import 'package:shop_app_flutter_udemy/common/utils/http_utils.dart';

class BuyCourseRepo{
  static Future<BaseResponseEntity> buyCourse({CourseRequestEntity? params}) async{
    var response = await HttpUtil().post("api/checkout",queryParameters: params?.toJson());
    return BaseResponseEntity.fromJson(response);
  }
}
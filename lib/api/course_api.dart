import 'package:flutter/material.dart';
import 'package:shop_app_flutter_udemy/common/models/course_entity.dart';
import 'package:shop_app_flutter_udemy/common/utils/http_utils.dart';

class CourseApi{
  static Future<CourseListResponseEntity> courseList() async{
    var response = await HttpUtil().post('api/courseList');
    return CourseListResponseEntity.fromJson(response);
  }
}
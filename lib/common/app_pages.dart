import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_flutter_udemy/common/app_routes.dart';
import 'package:shop_app_flutter_udemy/global.dart';
import 'package:shop_app_flutter_udemy/pages/application/view/application.dart';
import 'package:shop_app_flutter_udemy/pages/buy_course/view/buy_course.dart';
import 'package:shop_app_flutter_udemy/pages/course_details/view/course_details.dart';
import 'package:shop_app_flutter_udemy/pages/home/view/home.dart';
import 'package:shop_app_flutter_udemy/pages/lesson_detail/view/lesson_detail.dart';
import 'package:shop_app_flutter_udemy/pages/sign_in/view/sign_in.dart';
import 'package:shop_app_flutter_udemy/pages/sign_up/view/sign_up.dart';
import 'package:shop_app_flutter_udemy/pages/welcome/view/welcome.dart';

class AppPages{
  static List<RouteEntity> routes(){
    return [
      RouteEntity(path: AppRoutes.WELCOME, page: Welcome()),
      RouteEntity(path: AppRoutes.SIGN_IN, page: const SignIn()),
      RouteEntity(path: AppRoutes.SIGN_UP, page: const SignUp()),
      RouteEntity(path: AppRoutes.APPLICATION, page: const Application()),
      RouteEntity(path: AppRoutes.HOME, page: const Home()),
      RouteEntity(path: AppRoutes.COURSE_DETAILS, page: const CourseDetails()),
      RouteEntity(path: AppRoutes.LESSON_DETAIL, page: const LessonDetail()),
      RouteEntity(path: AppRoutes.BUY_COURSE, page: const BuyCourse())
    ];
  }

  static MaterialPageRoute generateRouteSettings(RouteSettings settings){
    if (kDebugMode) {
      print('Clicked route is: ${settings.name}');
    }

    if(settings.name != null){
      var result = routes().where((element) => element.path==settings.name);//here 'settings.name' means the name of the Page name
      if(result.isNotEmpty){
        bool deviceFirstTime = Global.storageService.getDeviceFirstOpen();
        print('Result true means not first time false means first time: $deviceFirstTime');

        if(result.first.path==AppRoutes.WELCOME && deviceFirstTime){//whenever app is open everytime it open the '/' route...here we check two condition if home and deviceFirstTime is true then execute if not then go to else block
          bool isLoggedIn = Global.storageService.isLoggedIn();
          if(isLoggedIn){
            return MaterialPageRoute(builder: (_)=>const Application(),settings: settings);
          }else{
            return MaterialPageRoute(builder: (_)=>SignIn(),settings: settings);
          }

          print('on welcome route');
        }else{
          if(kDebugMode){
            print('App ran first time');
          }
          return MaterialPageRoute(builder: (_)=>result.first.page,settings: settings);//result.first.page means where should go it will go there...like if we try to go to home page after signIn it will go there
        }
      }

    }
    return MaterialPageRoute(builder: (_)=>Welcome(),settings: settings);
  }
}

class RouteEntity{
  String path;
  Widget page;

  RouteEntity({required this.path,required this.page});
}
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shop_app_flutter_udemy/api/course_api.dart';
import 'package:shop_app_flutter_udemy/common/models/course_entity.dart';
import 'package:shop_app_flutter_udemy/common/models/user.dart';
import 'package:shop_app_flutter_udemy/global.dart';
part 'home_controller.g.dart';

@Riverpod(keepAlive: true)
class HomeScreenBannerDots extends _$HomeScreenBannerDots{
    @override
    int build()=>0;

    void setIndex(int value){
        state = value;
    }


}

//since we want to retrieve our data from local storage, it will take some times and so we need 'FutureOr' asynchronous way
@riverpod
class HomeUserProfile extends _$HomeUserProfile{

    @override
  FutureOr<UserProfile> build(){
        return Global.storageService.getUserProfile();
    }
}
//When we talk about keeping the state alive in Flutter with Riverpod's keepAlive: true, it means that the state of the widget is preserved even if the widget itself is removed from the widget tree and then added back later. However, it doesn't mean that the state itself is immutable or disconnected from external data sources like a database.
//with this we make it singleton class that is for only one time instance...that means whenever we come in this page then only one time instance created of the page
//In this context, keepAlive: true is an argument that can be passed to @Riverpod to ensure that the state remains alive even when the widget associated with it is removed from the widget tree. This is particularly useful in scenarios where you want to maintain the state of a widget even if it's temporarily removed from the UI.
@Riverpod(keepAlive: true)
class HomeCourseList extends _$HomeCourseList{
   Future<List<CourseItem>?> fetchCourseList() async{//we make it FutureOr with calling the FutureOr build() method here
   var result = await CourseApi.courseList();
   if(result.code == 200){
     return result.data;
   }
   return null;
  }

  //we can use FutureOr because with the name of the FutureOr it implies that it can wait or not based on the event
  @override
  FutureOr<List<CourseItem>?> build() async{
     return fetchCourseList();
  }
}
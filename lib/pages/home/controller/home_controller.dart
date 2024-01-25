import 'package:riverpod_annotation/riverpod_annotation.dart';
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
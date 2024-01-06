import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_app_flutter_udemy/common/utils/constants.dart';

class StorageService{//it will be global class for accessing the SharedPreferences
  late final SharedPreferences _preferences;

  Future<StorageService>init() async {
    _preferences = await SharedPreferences.getInstance();
    return this;//here 'this' keyword is referred to it's class own
  }

  Future<bool>setString(String key, String value)async{
    return await _preferences.setString(key, value);
  }

  Future<bool>setBool(String key, bool value) async {
    return await _preferences.setBool(key, value);
  }

  bool getDeviceFirstOpen(){
    return _preferences.getBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_KEY)??false;//if we are opening first time then it would return as false if not then true
  }

  bool isLoggedIn(){
    return _preferences.getString(AppConstants.STORAGE_USER_PROFILE_KEY)!=null?true:false;
  }


}
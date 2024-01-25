import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:shop_app_flutter_udemy/common/models/entities.dart';
import 'package:shop_app_flutter_udemy/common/utils/http_utils.dart';

class SignInRepo{
 static Future<UserCredential>firebaseSignIn(String email,String password) async {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);//In Dart, when you use the final keyword, you don't need to explicitly declare the variable type.When the type of a variable is clear from its initializer, you can omit the type declaration.
    return credential;
  }

  static Future<UserLoginResponseEntity> login({LoginRequestEntity? params})async{
   print('Given info: ${jsonEncode(params)}');
   var response = await HttpUtil().post(//if we try to get the post() method like this HttpUtil.post() then it would throw an error of static type, so if this type of error occurred then we need to write this way
     "api/login",
     queryParameters: params?.toJson()//here we pass the String format data as json with the help of toJson() method

   );

   return UserLoginResponseEntity.fromJson(response);//and we will get the response as json from database and converted as object type

  }
}
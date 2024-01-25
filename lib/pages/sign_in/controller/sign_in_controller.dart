import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app_flutter_udemy/common/models/entities.dart';
import 'package:shop_app_flutter_udemy/common/global_loader/global_loader.dart';
import 'package:shop_app_flutter_udemy/common/utils/constants.dart';
import 'package:shop_app_flutter_udemy/common/utils/http_utils.dart';
import 'package:shop_app_flutter_udemy/global.dart';
import 'package:shop_app_flutter_udemy/main.dart';
import 'package:shop_app_flutter_udemy/pages/sign_in/provider/sign_in_notifier.dart';
import 'package:shop_app_flutter_udemy/pages/sign_in/repo/sign_in_repo.dart';

class SignInController{
  WidgetRef ref;

 // SignInController(this.ref);//as we have the "navKey" in the main class we don't need to pass 'ref' object
  SignInController(this.ref);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();



  Future<void> handleSignIn(WidgetRef ref) async {
     var state = ref.read(signInNotifierProvider);

     String email = state.email;
     String password = state.password;

     emailController.text = email;
     passwordController.text = password;

     print('My email is: $email');
     print('My password is: $password');

     if(state.email.isEmpty || email.isEmpty){
       print('Email is empty.');
        return;
     }
     if(state.password.isEmpty || password.isEmpty){
       print('Password is empty.');
     //  Fluttertoast.showToast(msg: "Password is empty");
       return;
     }

     ref.read(appLoaderProvider.notifier).setLoader(true);//setLoader(true) means we need a progress indicating

     try{
        final credential = await SignInRepo.firebaseSignIn(email, password);//here we need to declare 'await' because the firebaseSignIn method return type is Future<>
       if(credential.user==null){
         print('User not found');
         return;
       }
       if(!credential.user!.emailVerified){
         print('You must verify your email address.');
       }

       var user = credential.user;
       if(user!=null){
         String? displayName = user.displayName;
         String? email = user.email;
         String? id = user.uid;
         String? photoUrl = user.photoURL;

        LoginRequestEntity loginRequestEntity = LoginRequestEntity();
        loginRequestEntity.email = email;
        loginRequestEntity.avatar = photoUrl;
        loginRequestEntity.name = displayName;
        loginRequestEntity.open_id = id;
        loginRequestEntity.type = 1;

        asyncPostAllData(loginRequestEntity);
        print('User logged in');

       }else{
         print('Login error');
       }
     } on FirebaseAuthException catch(e){
       if(e.code=='user-not-found'){
          print('User doesn\'t exist');
       }else if(e.code=='wrong-password'){
         print('Your password is wrong');
       }

     }catch(e){

     }
     ref.read(appLoaderProvider.notifier).setLoader(false);//setLoader(false) means we don't need a progress indicating


  }

  void asyncPostAllData(LoginRequestEntity logInReq)async{

    //var navigation = Navigator.of(ref.context);

    //jsonEncode() method always converts the whole json or jsonMap as String, with this we can access complex String as index
    //because when we need to store many items in the SharedPreferences with the help of setString() then it will only give us
    //to store data only one as String, but when we need to store many items at a time then we need to pass data with the help of jsonEncode()
    
    var result = await SignInRepo.login(params: logInReq);
    if(result.code==200){
      try{
        //if we try to access anything from here then we can access with the index value from it. But when we need to get any element like name or age then we need to get with the help of dot operator. But it is not possible without making them String to object with the help of jsonDecode()));
        Global.storageService.setString(AppConstants.STORAGE_USER_PROFILE_KEY, jsonEncode(result.data));


        Global.storageService.setString(AppConstants.STORAGE_USER_TOKEN_KEY, result.data!.access_token!);//it is already String so don't need to convert it from json

        //navigation.pushNamed('/application');
        navKey.currentState?.pushNamedAndRemoveUntil("/application", (route) => false);//this will not give you permission of going back to the previous page

      }catch(e){
        if(kDebugMode){
          print(e.toString());
        }

      }
    }else{
      if (kDebugMode) {
        print('Login error');
      }
    }
    

  }
}
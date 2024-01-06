import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app_flutter_udemy/common/entities/entities.dart';
import 'package:shop_app_flutter_udemy/common/global_loader/global_loader.dart';
import 'package:shop_app_flutter_udemy/common/utils/constants.dart';
import 'package:shop_app_flutter_udemy/global.dart';
import 'package:shop_app_flutter_udemy/pages/sign_in/notifier/sign_in_notifier.dart';

class SignInController{
  WidgetRef ref;

  SignInController(this.ref);

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();



  Future<void> handleSignIn() async {
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
       final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
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

  void asyncPostAllData(LoginRequestEntity logInReq){

    var navigation = Navigator.of(ref.context);

    try{
      Global.storageService.setString(AppConstants.STORAGE_USER_PROFILE_KEY, "123");
      Global.storageService.setString(AppConstants.STORAGE_USER_TOKEN_KEY, "123456");

      //navigation.pushNamed('/application');
      navigation.pushNamedAndRemoveUntil("/application", (route) => false);//this will not give you permission of going back to the previous page

    }catch(e){
     if(kDebugMode){
       print(e.toString());
     }

    }
  }
}
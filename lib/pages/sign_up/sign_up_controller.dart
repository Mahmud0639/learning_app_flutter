import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app_flutter_udemy/common/global_loader/global_loader.dart';
import 'package:shop_app_flutter_udemy/pages/notifier/register_notifier.dart';


class SignUpController{
  final WidgetRef ref;

  SignUpController({required this.ref});

  Future<void> handleSignUp() async {
    var state = ref.read(registerNotifierProvider);

    String name = state.userName;
    String email = state.email;
    String password = state.password;
    String rePassword = state.rePassword;

    if((state.password != state.rePassword) || password != rePassword){
      print('Your password does not match.');
      return;
    }

    if(state.userName.isEmpty || name.isEmpty){
      print('User name is empty.');
      return;
    }
    if(state.email.isEmpty || email.isEmpty){
      print('Email is empty.');
      return;
    }
    if(state.password.isEmpty || password.isEmpty){
      print('Password is empty.');
      return;
    }
    if(state.rePassword.isEmpty || rePassword.isEmpty){
      print('rePassword is empty.');
      return;
    }
    if(state.userName.length <6 || name.length<6){
      print('User name is too short');
      return;
    }

    ref.read(appLoaderProvider.notifier).setLoader(true);//ref.read used to change the value

    Future.delayed(const Duration(seconds: 3),() async {
      var context = Navigator.of(ref.context);
      try{
        final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
        if(kDebugMode){
          print(credential);
        }

        if(credential.user!=null){
          await credential.user?.sendEmailVerification();
          await credential.user?.updateDisplayName(name);
          //something like ....get server photo url
          //set server photo url

          print('An email has been sent to your email to verify your account. Please open that email and confirm your identity.');
          //Navigator.of(ref.context).pop();//don't use BuildContext across... to fix this issue we should define this before await


          context.pop();

        }
      }on FirebaseAuthException catch(e){
          if(e.code=='weak-password'){
            print('This password is too weak.');
          }else if(e.code=='email-already-in-use'){
            print('This email address has already been registered.');
          }else if(e.code=='user-not-found'){
            print('User can\'t be found');
          }
      }catch(e){
        if(kDebugMode){
          print(e.toString());
        }
      }
      // ref.read(appLoaderProvider.notifier).setLoader(false);
      ref.watch(appLoaderProvider.notifier).setLoader(false);
    });
   /* print("Your name is $name");
    print("Your email is $email");
    print("Your password is $password");
    print("Your rePassword is $rePassword");*/
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app_flutter_udemy/common/utils/app_colors.dart';
import 'package:shop_app_flutter_udemy/common/utils/image_res.dart';
import 'package:shop_app_flutter_udemy/common/widgets/button_widget.dart';
import 'package:shop_app_flutter_udemy/common/widgets/text_widgets.dart';
import 'package:shop_app_flutter_udemy/pages/sign_in/provider/sign_in_notifier.dart';
import 'package:shop_app_flutter_udemy/pages/sign_in/controller/sign_in_controller.dart';
import 'package:shop_app_flutter_udemy/pages/sign_in/widgets/sign_in_widgets.dart';

import '../../../common/global_loader/global_loader.dart';
import '../../../common/widgets/app_bar.dart';
import '../../../common/widgets/app_textfields.dart';

class SignIn extends ConsumerStatefulWidget {
  const SignIn({super.key});

  @override
  ConsumerState<SignIn> createState() => _SignInState();
}

class _SignInState extends ConsumerState<SignIn> {
   late SignInController _controller;

  @override
  void initState() {
    /*Future.delayed(const Duration(seconds: 0),(){//here we should pass the the 'ref' under Future.delayed() because sometimes it will cause a null reference
      _controller = SignInController(ref); //passing ref to the controller page
    });*/
    //with above code, throws an error of late initialization so we do it like this below
    _controller = SignInController(ref);
    // TODO: implement initState
    super.initState();

  }
//another way to pass 'ref' object but "riverpod" don't recommend to pass 'ref' like this way...recommending to pass 'ref' object inside a function
 /* @override
  void didChangeDependencies() {//this method is called while any dependencies initialized,reinitialized or rebuild, in this we can also the same thing regarding 'ref' passing
    Future.delayed(Duration(seconds: 0),(){
      _controller = SignInController(); //passing ref to the controller page
    });
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }*/

  @override
  Widget build(BuildContext context) {
    final signInProvider = ref.watch(signInNotifierProvider);
    final loader = ref.watch(appLoaderProvider);

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
            appBar: buildAppBar(),
            backgroundColor: Colors.white,
            body: loader==false?SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  thirdPartyLogin(),
                  const Center(
                      child: Text14Normal(
                          text: "Or use your email account to login")),
                  SizedBox(
                    height: 40.h,
                  ),
                  textFormField(
                      controller: _controller.emailController,//used to save info after hitting the login button
                      text: "Email",
                      iconName: ImageRes.user,
                      hintText: "Enter your email address",
                      func: (value)=>ref.read(signInNotifierProvider.notifier).onUserEmailChange(value) ),
                  SizedBox(
                    height: 20.h,
                  ),
                  textFormField(
                      controller: _controller.passwordController,//used to save info after hitting the login button
                      text: "Password",
                      iconName: ImageRes.lock,
                      obscureText: true,
                      hintText: "Enter your password",
                  func: (value)=>ref.read(signInNotifierProvider.notifier).onUserPasswordChange(value)),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 25.w),
                      child: textUnderline(text: "Forgot Password?")),
                  SizedBox(
                    height: 70.h,
                  ),
                  Center(
                      child: buttonWidget(isLogin: true, buttonName: "Login",func: ()=>_controller.handleSignIn(ref))),
                  SizedBox(
                    height: 10.h,
                  ),
                  Center(
                      child: buttonWidget(
                          isLogin: false,
                          buttonName: "Register",
                          context: context,
                          func: () {
                            Navigator.pushNamed(context, "/signUp");
                          })),
                ],
              ),
            ):Center(child: CircularProgressIndicator(backgroundColor: Colors.blue,color: AppColors.primaryElement,),)),
      ),
    );
  }
}

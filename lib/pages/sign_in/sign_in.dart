import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app_flutter_udemy/common/utils/app_colors.dart';
import 'package:shop_app_flutter_udemy/common/widgets/button_widget.dart';
import 'package:shop_app_flutter_udemy/common/widgets/text_widgets.dart';
import 'package:shop_app_flutter_udemy/pages/sign_in/notifier/sign_in_notifier.dart';
import 'package:shop_app_flutter_udemy/pages/sign_in/sign_in_controller.dart';
import 'package:shop_app_flutter_udemy/pages/sign_in/widgets/sign_in_widgets.dart';

import '../../common/global_loader/global_loader.dart';
import '../../common/widgets/app_bar.dart';
import '../../common/widgets/app_textfields.dart';

class SignIn extends ConsumerStatefulWidget {
  const SignIn({super.key});

  @override
  ConsumerState<SignIn> createState() => _SignInState();
}

class _SignInState extends ConsumerState<SignIn> {
  late SignInController _controller;

  @override
  void initState() {
    _controller = SignInController(ref); //passing ref to the controller page
    // TODO: implement initState
    super.initState();
  }

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
                  Center(
                      child: text14Normal(
                          text: "Or use your email account to login")),
                  SizedBox(
                    height: 40.h,
                  ),
                  textFormField(
                      controller: _controller.emailController,//used to save info after hitting the login button
                      text: "Email",
                      iconName: "assets/icons/user.png",
                      hintText: "Enter your email address",
                      func: (value)=>ref.read(signInNotifierProvider.notifier).onUserEmailChange(value) ),
                  SizedBox(
                    height: 20.h,
                  ),
                  textFormField(
                      controller: _controller.passwordController,//used to save info after hitting the login button
                      text: "Password",
                      iconName: "assets/icons/lock.png",
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
                      child: buttonWidget(isLogin: true, buttonName: "Login",func: ()=>_controller.handleSignIn())),
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

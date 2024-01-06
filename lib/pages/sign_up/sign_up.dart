import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app_flutter_udemy/common/global_loader/global_loader.dart';
import 'package:shop_app_flutter_udemy/common/widgets/button_widget.dart';
import 'package:shop_app_flutter_udemy/common/widgets/text_widgets.dart';
import 'package:shop_app_flutter_udemy/pages/notifier/register_notifier.dart';
import 'package:shop_app_flutter_udemy/pages/sign_in/widgets/sign_in_widgets.dart';
import 'package:shop_app_flutter_udemy/pages/sign_up/sign_up_controller.dart';

import '../../common/widgets/app_bar.dart';
import '../../common/widgets/app_textfields.dart';

class SignUp extends ConsumerStatefulWidget {//to make the ref as global we made the ConsumerStatefulWidget instead of ConsumerWidget
  const SignUp({super.key});

  @override
  ConsumerState<SignUp> createState() => _SignUpState();
}

class _SignUpState extends ConsumerState<SignUp> {

  late SignUpController _controller;

  @override
  void initState() {
    _controller = SignUpController(ref: ref);
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    final regProvider = ref.watch(registerNotifierProvider);
    final loader = ref.watch(appLoaderProvider);//returns a bool value true or false

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
            appBar: buildAppBar(text: "Sign Up"),
            backgroundColor: Colors.white,
            body: loader==false?SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25.h,
                  ),
                  Center(
                      child: text14Normal(
                          text: "Enter your details below & free sign up")),
                  SizedBox(
                    height: 30.h,
                  ),
                  textFormField(
                      text: "User name",
                      iconName: "assets/icons/user.png",
                      hintText: "Enter your user name",
                      func: (value) {
                        ref.read(registerNotifierProvider.notifier).onUserNameChanged(value);
                      }),
                  SizedBox(
                    height: 20.h,
                  ),
                  textFormField(
                      text: "Email",
                      iconName: "assets/icons/user.png",
                      hintText: "Enter your email address",
                      func: (value) => ref.read(registerNotifierProvider.notifier).onUserEmailChanged(value)),
                  SizedBox(
                    height: 15.h,
                  ),
                  textFormField(
                      text: "Password",
                      iconName: "assets/icons/lock.png",
                      obscureText: true,
                      hintText: "Enter your password",
                      func: (value) => ref.read(registerNotifierProvider.notifier).onUserPasswordChanged(value)),
                  SizedBox(
                    height: 15.h,
                  ),
                  textFormField(
                      text: "Confirm Password",
                      iconName: "assets/icons/lock.png",
                      obscureText: true,
                      hintText: "Enter your confirm password",
                      func: (value) => ref.read(registerNotifierProvider.notifier).onUserRePasswordChanged(value)),
                  SizedBox(
                    height: 15.h,
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 25.w),
                      child: text14Normal(
                          text:
                              "By creating an account you are agreeing with our terms and conditions")),
                  SizedBox(
                    height: 40.h,
                  ),
                  Center(
                      child: buttonWidget(
                          isLogin: true,
                          buttonName: "Sign up",
                          context: context,func: ()=>_controller.handleSignUp())),

                ],
              ),
            ):Center(child: CircularProgressIndicator(),)),
      ),
    );
  }
}

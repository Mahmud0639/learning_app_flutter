import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app_flutter_udemy/common/utils/app_colors.dart';
import 'package:shop_app_flutter_udemy/common/widgets/box_shadow.dart';
import 'package:shop_app_flutter_udemy/common/widgets/text_widgets.dart';
import 'package:shop_app_flutter_udemy/pages/sign_in/widgets/sign_in_widgets.dart';
import 'package:shop_app_flutter_udemy/pages/sign_up/view/sign_up.dart';

import 'app_bar.dart';

/*Widget buttonWidget(
    {double width = 325,
    double height = 50,
    String buttonName = "",
    bool isLogin = true,
    BuildContext? context,
    void Function()? func}) {
  return GestureDetector(
    onTap: func,
    // onTap: (){
    //   if(func==null){
    //     print("The handler is null");
    //   }else{
    //     func();
    //   }
    //},
    child: Container(
      width: width.w,
      height: height.h,
      decoration: boxDecoration(
          color:
              isLogin ? AppColors.primaryElement : AppColors.primaryBackground,
          border: Border.all(color: AppColors.primaryFourElementText)),
      child: Center(
          child: Text16Normal(
              text: buttonName,
              color: isLogin
                  ? AppColors.primaryBackground
                  : AppColors.primaryText)),
    ),
  );
}*/


/*double width = 325,
    double height = 50,
String buttonName = "",
    bool isLogin = true,
BuildContext? context,
void Function()? func*/


class ButtonWidget extends StatelessWidget {
  final double width;
  final double height;
  final String buttonName;
  final bool isLogin;
  final BuildContext? context;
  final void Function()? func;
  const ButtonWidget({super.key, this.width=325, this.height=50, this.buttonName="", this.isLogin=true, this.context,  this.func});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      // onTap: (){
      //   if(func==null){
      //     print("The handler is null");
      //   }else{
      //     func();
      //   }
      //},
      child: Container(
        width: width.w,
        height: height.h,
        decoration: boxDecoration(
            color:
            isLogin ? AppColors.primaryElement : AppColors.primaryBackground,
            border: Border.all(color: AppColors.primaryFourElementText)),
        child: Center(
            child: Text16Normal(
                text: buttonName,
                color: isLogin
                    ? AppColors.primaryBackground
                    : AppColors.primaryText)),
      ),
    );
  }
}


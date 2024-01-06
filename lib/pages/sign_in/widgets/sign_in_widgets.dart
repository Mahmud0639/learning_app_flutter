import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app_flutter_udemy/common/utils/app_colors.dart';
import 'package:shop_app_flutter_udemy/common/widgets/box_shadow.dart';
import 'package:shop_app_flutter_udemy/common/widgets/image_widget.dart';
import 'package:shop_app_flutter_udemy/common/widgets/text_widgets.dart';




Widget thirdPartyLogin(){
  return Container(
    margin: EdgeInsets.only(left: 80.w,right: 80.w,top: 30.h,bottom: 15.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _loginSocialBtn("assets/icons/google.png"),
        _loginSocialBtn("assets/icons/apple.png"),
        _loginSocialBtn("assets/icons/facebook.png"),
      ],
    ),
  );
}

Widget _loginSocialBtn(String imagePath){
  return GestureDetector(
    onTap: (){

    },
    child: SizedBox(
      width: 40.w,
      height: 40.h,
      child: Image.asset(imagePath),
    ),
  );
}


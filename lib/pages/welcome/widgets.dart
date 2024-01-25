
import 'package:flutter/material.dart';
import 'package:shop_app_flutter_udemy/common/utils/constants.dart';
import 'package:shop_app_flutter_udemy/common/widgets/box_shadow.dart';
import 'package:shop_app_flutter_udemy/global.dart';
import 'package:shop_app_flutter_udemy/pages/sign_in/view/sign_in.dart';

import '../../common/utils/app_colors.dart';
import '../../common/widgets/text_widgets.dart';

Widget appOnboardingPage(PageController controller,{String imgPath="assets/images/reading.png",String title="",String subTitle="",index=0,required BuildContext context}){
  return  Column(
    children: [
      Image.asset(imgPath),
      Container(
          margin: const EdgeInsets.only(top: 5),
          child: text24Normal(text: title)),
      Container(
        margin: const EdgeInsets.only(top: 12),
        padding: const EdgeInsets.only(left: 30,right: 30),
        child: Text16Normal(text: subTitle),
      ),
      _nextButton(index,controller,context)
    ],
  );
}

Widget _nextButton(int index,PageController controller,BuildContext context){
  return GestureDetector(
    onTap: (){
      //print('tapped index is: $index');
      if(index<3){
        controller.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.linear);
      }else{
        Global.storageService.setBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_KEY, true);
        print('Local storage data saved successfully!');
        //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>SignIn()));
        Navigator.pushNamed(context, "/signIn");
      }
    },
    child: Container(
      //alignment: Alignment.center,
      margin:const EdgeInsets.only(top: 70,left: 20,right: 20),
      decoration: boxDecoration(color: AppColors.primaryElement,radius: 12),
      width: 300,
      height: 50,
      child: Center(child: Text16Normal(text: index<3?"Next":"Get Started",color: Colors.white)),
    ),
  );
}
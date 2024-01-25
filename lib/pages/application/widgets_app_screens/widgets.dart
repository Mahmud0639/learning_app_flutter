import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app_flutter_udemy/common/utils/image_res.dart';
import 'package:shop_app_flutter_udemy/common/widgets/image_widget.dart';
import 'package:shop_app_flutter_udemy/pages/home/view/home.dart';

import '../../../common/utils/app_colors.dart';

var bottomTabs = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
      activeIcon: bottomContainer(
          imagePath: ImageRes.home, color: AppColors.primaryElement),
      icon: bottomContainer(imagePath: ImageRes.home), label: "Home",
      backgroundColor: AppColors.primaryBackground),
  BottomNavigationBarItem(
      activeIcon: bottomContainer(color: AppColors.primaryElement,
          imagePath: ImageRes.search),
      icon: bottomContainer(imagePath: ImageRes.search),
      label: "Search",
      backgroundColor: AppColors.primaryBackground),
  BottomNavigationBarItem(
      activeIcon: bottomContainer(color: AppColors.primaryElement,
          imagePath: ImageRes.play),
      icon: bottomContainer(imagePath: ImageRes.play),
      label: "Play",
      backgroundColor: AppColors.primaryBackground),
  BottomNavigationBarItem(
      activeIcon: bottomContainer(color: AppColors.primaryElement,
          imagePath: ImageRes.message),
      icon: bottomContainer(imagePath: ImageRes.message),
      label: "Message",
      backgroundColor: AppColors.primaryBackground),
  BottomNavigationBarItem(
      activeIcon: bottomContainer(color: AppColors.primaryElement,
          imagePath: ImageRes.person),
      icon: bottomContainer(imagePath: ImageRes.person),
      label: "Profile",
      backgroundColor: AppColors.primaryBackground)
];

Widget bottomContainer(
    {double width = 15, double height = 15, String imagePath = ImageRes.home, Color color = AppColors
        .primaryFourElementText}) {
  return Container(
    width: 15.w,
    height: 15.h,
    child: appImageWithColor(imgPath: imagePath, color: color),
  );
}

Widget appScreens({int index=0}) {
  List<Widget> screens = [
    const Home(),
    Center(child: appImage(imagePath: ImageRes.search,width: 250,height: 250),),
    Center(child: appImage(imagePath: ImageRes.play,width: 250,height: 250),),
    Center(child: appImage(imagePath: ImageRes.message,width: 250,height: 250),),
    Center(child: appImage(imagePath: ImageRes.person,width: 250,height: 250),)
  ];
  return screens[index];
}

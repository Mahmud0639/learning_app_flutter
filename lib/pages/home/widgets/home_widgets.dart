import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app_flutter_udemy/common/utils/constants.dart';
import 'package:shop_app_flutter_udemy/common/utils/image_res.dart';
import 'package:shop_app_flutter_udemy/common/widgets/box_shadow.dart';
import 'package:shop_app_flutter_udemy/common/widgets/image_widget.dart';
import 'package:shop_app_flutter_udemy/pages/home/controller/home_controller.dart';

import '../../../common/utils/app_colors.dart';
import '../../../common/widgets/text_widgets.dart';
import '../../../global.dart';

class HomeBanner extends StatelessWidget {
  final PageController controller;
  final WidgetRef ref;

  const HomeBanner({super.key, required this.controller, required this.ref});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //banner
        SizedBox(
          width: 300.w,
          height: 140.h,
          child: PageView(
            controller: controller,
            //this is one way to persistent the page with the dotsIndicator
            onPageChanged: (index) {
              ref.read(homeScreenBannerDotsProvider.notifier).setIndex(index);
              //print(index);
            },
            children: [
              bannerContainer(imagePath: ImageRes.banner1),
              bannerContainer(imagePath: ImageRes.banner2),
              bannerContainer(imagePath: ImageRes.banner3)
            ],
          ),
        ),
        //dots
        DotsIndicator(
          dotsCount: 3,
          decorator: DotsDecorator(
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 8.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0))),
          //position: dotsIndex,
          position: ref.watch(
              homeScreenBannerDotsProvider), //ref.watch() used only when we need the value,,,when we need to change the value or passing value we need 'ref.read()'
        ),
      ],
    );
  }
}

/*Widget banner({required WidgetRef ref, required PageController controller}){
  //PageController _controller = PageController(initialPage: ref.watch(homeScreenBannerDotsProvider));//but it is not a good way to do here because it should be in the stateful widget
  return Column(
    children: [
      //banner
      SizedBox(
        width: 300.w,
        height: 140.h,
        child: PageView(
          controller: controller,//this is one way to persistent the page with the dotsIndicator
          onPageChanged: (index){
            ref.read(homeScreenBannerDotsProvider.notifier).setIndex(index);
            //print(index);
          },
          children: [
            bannerContainer(imagePath: ImageRes.banner1),
            bannerContainer(imagePath: ImageRes.banner2),
            bannerContainer(imagePath: ImageRes.banner3)

          ],
        ),
      ),
      //dots
      DotsIndicator(
        dotsCount: 3,
        decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 8.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0))),
        //position: dotsIndex,
        position: ref.watch(homeScreenBannerDotsProvider),//ref.watch() used only when we need the value,,,when we need to change the value or passing value we need 'ref.read()'

      ),
    ],
  );
}*/

Widget bannerContainer({required String imagePath}) {
  return Container(
    width: 300.w,
    height: 140.h,
    margin: EdgeInsets.only(left: 8.w),
    decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              imagePath,
            ),
            fit: BoxFit.fill)),
  );
}

class UserName extends StatelessWidget {
  const UserName({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //child: text24Normal(text: Global.storageService.getUserProfile()["name"],fontWeight: FontWeight.bold),
      child: text24Normal(
          text: Global.storageService.getUserProfile().name ?? "",
          fontWeight: FontWeight.bold),
    );
  }
}

class HelloText extends StatelessWidget {
  const HelloText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: text24Normal(
          text: "Hello,",
          color: AppColors.primaryThreeElementText,
          fontWeight: FontWeight.bold),
    );
  }
}

AppBar homeAppBar(WidgetRef ref) {
  var profileState = ref.watch(homeUserProfileProvider);
  return AppBar(
    title: Container(
      margin: EdgeInsets.only(left: 7.w, right: 7.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          appImage(imagePath: ImageRes.menu, width: 18.w, height: 12.h),
          //Since profileState return an asynchronous data so we need to do like this 'profileState.when()'
          profileState.when(data: (value)=>GestureDetector(child:  AppBoxDecorationImage(imgPath: "${AppConstants.SERVER_API_URL}${value.avatar!}",)), error: (err,stack)=>appImage(imagePath: ImageRes.user, width: 18.w, height: 12.h), loading: ()=>Container())

        ],
      ),
    ),
  );
}

class HomeMenuBar extends StatelessWidget {
  const HomeMenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 15.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Text16Normal(
                text: "Choice your course",
                fontWeight: FontWeight.bold,
                color: AppColors.primaryText,
              ),
              GestureDetector(
                onTap: () {},
                child: const Text10Normal(
                  text: "See all",
                  fontWeight: FontWeight.normal,
                  color: AppColors.primaryThreeElementText,
                ),
              )
            ],
          ),
        ),

        SizedBox(height: 20.h,),
        Row(
          children: [
            Container(
                padding: EdgeInsets.only(left: 15.w,right: 15.w,top: 5.h,bottom: 5.h),
              decoration: boxDecoration(radius: 7.w),
                child: const Text11Normal(
              text: "All",
            ),
            ),
            Container(margin: EdgeInsets.only(left: 30.w),child: const Text11Normal(text: "Popular",color: AppColors.primaryThreeElementText,)),
            Container(margin: EdgeInsets.only(left: 30.w),child: const Text11Normal(text: "Newest",color: AppColors.primaryThreeElementText,)),
          ],
        )
      ],
    );
  }
}

class CourseItemsGrid extends StatelessWidget {
  const CourseItemsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
          shrinkWrap: true,//possible lowest space
          physics: ScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 30,//horizontally spacing
              mainAxisSpacing: 30,//vertically spacing
              crossAxisCount: 2),//crossAxisCount means horizontally count items


          itemCount: 6,
          itemBuilder: (_, int index) {
            return appImage();
          }),
    );
  }
}


/*Widget userName(){
  print('My username');
  return  Container(
    //child: text24Normal(text: Global.storageService.getUserProfile()["name"],fontWeight: FontWeight.bold),
    child: text24Normal(text: Global.storageService.getUserProfile().name??"",fontWeight: FontWeight.bold),
  );
}*/

/*
Widget helloText(){
  return  Container(
    child: text24Normal(text: "Hello,",color: AppColors.primaryThreeElementText,fontWeight: FontWeight.bold),
  );
}*/

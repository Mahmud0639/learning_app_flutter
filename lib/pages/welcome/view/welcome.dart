import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app_flutter_udemy/common/utils/image_res.dart';
import 'package:shop_app_flutter_udemy/pages/welcome/widgets.dart';

import '../../sign_up_notifier/welcome_notifier.dart';



final indexProvider = StateProvider<int>((ref)=>0);

class Welcome extends ConsumerWidget {
  Welcome({super.key});

  final PageController _pageController = PageController();

  int dotsIndex = 0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('my dots value is: $dotsIndex');
    
    //final index = ref.watch(indexProvider);
    final index = ref.watch(indexDotProvider);

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          body: Container(
             margin:  EdgeInsets.only(top: 5.h),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                PageView(
                  onPageChanged: (value) {
                    // setState(() {
                    //   dotsIndex = value;
                    // });
                   // ref.read(indexDotProvider.notifier).state = value;
                    ref.read(indexDotProvider.notifier).changeIndex(value);

                  },
                  controller: _pageController,
                  //scrollDirection: Axis.vertical,
                  children: [
                    appOnboardingPage(_pageController,
                        imgPath: ImageRes.reading,
                        title: "First See Learning",
                        subTitle:
                            "Forget about of paper all knowledge in one learning",
                        index: 1,context: context),
                    appOnboardingPage(_pageController,
                        imgPath: ImageRes.man,
                        title: "Connect with everyone",
                        subTitle:
                            "Always keep in touch with your tutor and friends. Let's get connected",
                        index: 2,context: context),
                    appOnboardingPage(_pageController,
                        imgPath: ImageRes.boy,
                        title: "Always fascinated learning",
                        subTitle:
                            "Anywhere, anytime. The time is at your discretion. So study wherever you want",
                        index: 3,context: context)
                    // Image.asset("assets/images/reading.png"),
                    // Image.asset("assets/images/boy.png"),
                  ],
                ),
                Positioned(
                  bottom: 10,
                  child: DotsIndicator(
                    dotsCount: 3,
                    decorator: DotsDecorator(
                        size: const Size.square(9.0),
                        activeSize: const Size(18.0, 8.0),
                        activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  //position: dotsIndex,
                    position: index,
                  ),
                ),

                // Positioned(bottom: 100, left: 20, child: Text("Widget one")),
                // Positioned(bottom: 100, left: 200, child: Text("Widget two",style: TextStyle(fontSize: 30),))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

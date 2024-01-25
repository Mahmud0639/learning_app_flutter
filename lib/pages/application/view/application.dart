import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app_flutter_udemy/common/utils/app_colors.dart';
import 'package:shop_app_flutter_udemy/common/widgets/box_shadow.dart';
import 'package:shop_app_flutter_udemy/pages/application/provider/application_notifier.dart';

import '../widgets_app_screens/widgets.dart';


class Application extends ConsumerWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {

    int index = ref.watch(applicationNavIndexProvider);


    return Container(
      child: SafeArea(
        child: Scaffold(
          body: appScreens(index: index),
          bottomNavigationBar: Container(
            width: 350.w,
            height: 58.h,
            decoration: boxDecorationWithRadius(),
            child: BottomNavigationBar(
              onTap: (value){
                ref.read(applicationNavIndexProvider.notifier).changeIndex(value);
              },
              currentIndex: index,
              elevation: 0,
              items: bottomTabs,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              selectedItemColor: AppColors.primaryFourElementText,
              unselectedItemColor: AppColors.primaryElement,
            ),
          ),
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app_flutter_udemy/common/utils/app_colors.dart';
import 'package:shop_app_flutter_udemy/common/widgets/app_bar.dart';
import 'package:shop_app_flutter_udemy/common/widgets/image_widget.dart';
import 'package:shop_app_flutter_udemy/common/widgets/search_widget.dart';
import 'package:shop_app_flutter_udemy/pages/home/controller/home_controller.dart';
import 'package:shop_app_flutter_udemy/pages/home/widgets/home_widgets.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  late PageController _controller;

  //it is called in the very beginning so what it can't be initialized while it needed
/*  @override
  void initState() {

    // TODO: implement initState
    super.initState();
  }*/

  @override
  void didChangeDependencies() {
    _controller =
        PageController(initialPage: ref.watch(homeScreenBannerDotsProvider));
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // return Global.storageService.getUserProfile().access_token==null?const Center(child: Text('You are a bad user.')):Scaffold(
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: homeAppBar(
        ref
      ),
      body: RefreshIndicator(
        onRefresh: (){
          //which method should be refreshing we need to write here
         return ref.refresh(homeCourseListProvider.notifier).fetchCourseList();
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15.h,
                ),
                const HelloText(),
                const UserName(),
                //everytime widget building but if we use Class instead of Widget for not rebuilding everytime
                searchBar(),
                SizedBox(
                  height: 20.h,
                ),
                // banner( ref: ref,controller: _controller)
                HomeBanner(controller: _controller, ref: ref),
                const HomeMenuBar(

                ),
                /* CustomScrollView(
                  shrinkWrap: true,//it will take minimum space
                  physics: const ScrollPhysics(),//when scrolling is not working then we should use this
                  slivers: [
                    //sliver only take list of widgets
                    SliverPadding(padding: const EdgeInsets.all(20),sliver: SliverGrid.count(crossAxisCount: 2,children: const [
                      Text("Mahmud Islam"),
                      Text("Mahmud Islam"),
                      Text("Mahmud Islam"),
                      Text("Mahmud Islam"),
                    ],),)
                  ],
                )*/
                //another way to do that
                 CourseItemsGrid(ref: ref,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

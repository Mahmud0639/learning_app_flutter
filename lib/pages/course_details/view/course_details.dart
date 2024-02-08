import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app_flutter_udemy/common/utils/app_colors.dart';
import 'package:shop_app_flutter_udemy/common/utils/constants.dart';
import 'package:shop_app_flutter_udemy/common/utils/image_res.dart';
import 'package:shop_app_flutter_udemy/common/widgets/app_bar.dart';
import 'package:shop_app_flutter_udemy/common/widgets/box_shadow.dart';
import 'package:shop_app_flutter_udemy/common/widgets/image_widget.dart';
import 'package:shop_app_flutter_udemy/common/widgets/text_widgets.dart';
import 'package:shop_app_flutter_udemy/pages/course_details/controller/course_details_controller.dart';
import 'package:shop_app_flutter_udemy/pages/course_details/view/course_details_widgets.dart';

class CourseDetails extends ConsumerStatefulWidget {
  const CourseDetails({super.key});

  @override
  ConsumerState<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends ConsumerState<CourseDetails> {

  //we used Stateful widget because we can override didChangeDependencies
  late var args;
  @override
  void didChangeDependencies() {
    //we receive argument data as Map because we sent id as Map from the home_widgets page
    var id = ModalRoute.of(context)!.settings.arguments as Map;
    args = id["id"];//we are accessing our id from map
    

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var stateData = ref.watch(courseDetailsControllerProvider(index: args.toInt()));
    return Scaffold(
      appBar: buildGlobalAppBar(text: "Course details"),
      body: stateData.when(data: (data){
        return data==null?SizedBox():Padding(
          padding: EdgeInsets.only(left: 25.w,right: 25.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CourseDetailsThumbnail(courseItem: data),
              CourseDetailsIconText(courseItem: data,),
              CourseDetailsGoBuyButton(),
            ],
          ),
        );
      }, error: (error,traceStack)=>Text("Error occurred."), loading: ()=>Center(child: CircularProgressIndicator(),)),
    );
  }
}

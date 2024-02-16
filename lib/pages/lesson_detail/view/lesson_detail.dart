import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app_flutter_udemy/common/utils/constants.dart';
import 'package:shop_app_flutter_udemy/common/utils/image_res.dart';
import 'package:shop_app_flutter_udemy/common/widgets/app_bar.dart';
import 'package:shop_app_flutter_udemy/common/widgets/box_shadow.dart';
import 'package:shop_app_flutter_udemy/common/widgets/image_widget.dart';
import 'package:shop_app_flutter_udemy/pages/lesson_detail/controller/lesson_controller.dart';
import 'package:shop_app_flutter_udemy/pages/lesson_detail/widget/lesson_details_widgets.dart';
import 'package:video_player/video_player.dart';

class LessonDetail extends ConsumerStatefulWidget {
  const LessonDetail({super.key});

  @override
  ConsumerState<LessonDetail> createState() => _LessonDetailState();
}

class _LessonDetailState extends ConsumerState<LessonDetail> {
  late var args;
  int videoIndex = 0;

  @override
  void dispose() {
    videoPlayerController!.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    //with the help of the arguments of ModalRoute class we can get our passed data(in this case id) from "course_details_widgets" class as Map
    var id = ModalRoute.of(context)!.settings.arguments as Map;
    args = id["id"];

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    //var lessonDetail = ref.watch(lessonDetailControllerProvider(index: args.toInt()));
    var lessonData = ref.watch(lessonDataControllerProvider);
    print('---my lesson length: ${lessonData.value!.lessonItem.length}');

    return Scaffold(
        appBar: buildGlobalAppBar(text: "Lesson details"),
        body: Center(
          child: lessonData.value == null
              ? Container(
                  child: const CircularProgressIndicator(),
                )
              : Column(
                  children: [
                    lessonData.when(
                        //FutureBuilder is required when we need to load any data that might be required loading for a while
                        data: (data) => Column(
                              children: [
                                Container(
                                  width: 325.w,
                                  height: 200.h,

                                  //here we encountered an issue that when data loading it faces 0 length of list value, so we need to wait for a while to get data
                                  decoration: data.lessonItem.isEmpty
                                      ? boxDecoration()
                                      : networkImageDecoration(
                                          imagePath:
                                              "${AppConstants.IMAGE_UPLOAD_PATH}${data.lessonItem[0].thumbnail}"),
                                  child: FutureBuilder(
                                      future: data.initializeVideoPlayer,
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.done) {
                                          return videoPlayerController == null
                                              ? Container()
                                              : Stack(
                                                  children: [
                                                    VideoPlayer(
                                                        videoPlayerController!)
                                                  ],
                                                );
                                        } else {
                                          return const Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        }
                                      }),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.w, right: 25.w, top: 10.h),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          videoIndex = videoIndex - 1;
                                          if (videoIndex < 0) {
                                            videoIndex = 0;
                                            print("No earlier video");
                                            return;
                                          }
                                          var videoUrl =
                                              data.lessonItem[videoIndex].url;
                                          ref
                                              .read(lessonDataControllerProvider
                                                  .notifier)
                                              .playNextVideo(videoUrl!);
                                        },
                                        child: AppImage(
                                          width: 24.w,
                                          height: 24.h,
                                          imagePath: ImageRes.left,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 20.w,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          if (data.isPlay) {
                                            //it means true
                                            videoPlayerController?.pause();
                                            ref
                                                .read(
                                                    lessonDataControllerProvider
                                                        .notifier)
                                                .playPause(
                                                    false); //so we need to toggle it true to false after pressing the pause button
                                          } else {
                                            videoPlayerController?.play();
                                            ref
                                                .read(
                                                    lessonDataControllerProvider
                                                        .notifier)
                                                .playPause(true);
                                          }
                                        },
                                        //toggling play-pause buttons with the logic
                                        child: data.isPlay
                                            ? AppImage(
                                                width: 24.w,
                                                height: 24.h,
                                                imagePath: ImageRes.pause,
                                              )
                                            : AppImage(
                                                width: 24.w,
                                                height: 24.h,
                                                imagePath: ImageRes.play,
                                              ),
                                      ),
                                      SizedBox(
                                        width: 20.w,
                                      ),
                                      GestureDetector(
                                        //after tapping on the next button, then current default 0 index would be 1
                                        //and checking if the current videoIndex is greater than the list length
                                        //if it is then executes or not, it would not execute the if block anymore
                                        //then go to out of the if block and insert the video url according to the
                                        //videoIndex from the list and then passing the playNextVideo method that is
                                        //available in the 'lesson_controller' class
                                        onTap: () {
                                          videoIndex = videoIndex + 1;
                                          if (videoIndex >=
                                              data.lessonItem.length) {
                                            //2>2 can't so we need to put here 2>=2
                                            videoIndex = data
                                                    .lessonItem.length -
                                                1; //after tapping next time after being the index value is 1 it would be 2(it can be any value,
                                            // this block is only valid while the videoIndex is greater than the list items), so we need to do minus 1 from the index value to make it valid
                                            return;
                                          }
                                          var videoUrl =
                                              data.lessonItem[videoIndex].url;
                                          //after getting the current video url after pressing the next button we need to play this url video
                                          //so we have to pass this url in the playNextVideo() method
                                          ref
                                              .read(lessonDataControllerProvider
                                                  .notifier)
                                              .playNextVideo(videoUrl!);
                                        },
                                        child: AppImage(
                                          width: 24.w,
                                          height: 24.h,
                                          imagePath: ImageRes.right,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.w, right: 25.w),
                                    child: LessonVideos(
                                        lessonVideoItem: data.lessonItem,
                                        ref: ref,
                                        syncVideoIndex: syncVideoIndex))
                              ],
                            ),
                        error: (error, traceStack) =>
                            const Text("Error occurred."),
                        loading: () => const Center(
                              child: CircularProgressIndicator(),
                            )),
                  ],
                ),
        ) /*Center(
        child: Container(
          //child: Text(args.toString()),//here printing id as String
          child: lessonDetail.when(data: (data)=>Column(
            children: [
              Text(data!.elementAt(0).name.toString()),
              AppBoxDecorationImage(
                width: 325.w,
                height: 200.h,
                fit: BoxFit.fitWidth,
                imgPath: '${AppConstants.IMAGE_UPLOAD_PATH}${data.elementAt(0).thumbnail}',
              )
            ],
          ), error: (error,traceStack)=>Text(error.toString()), loading: ()=>const Center(child: CircularProgressIndicator(),)),
        ),
      ),*/
        );
  }

  void syncVideoIndex(int index) {
    videoIndex = index;
  }
}

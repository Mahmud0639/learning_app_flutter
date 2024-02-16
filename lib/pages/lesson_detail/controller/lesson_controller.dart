import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shop_app_flutter_udemy/common/models/lesson_entities.dart';
import 'package:shop_app_flutter_udemy/common/utils/constants.dart';
import 'package:shop_app_flutter_udemy/pages/lesson_detail/repo/lesson_repo.dart';
import 'package:video_player/video_player.dart';
part 'lesson_controller.g.dart';


//whenever we do click on one of the items(lesson_details_widgets) then it would take an id and pass it to the
// lessonDataControllerProvider(in this class) and
//based on the id we will be able to load our api data from the server and pass it to the LessonVideo class and then
//make it sharable with the help of LessonDataController class

//it is available globally all around the project, so we can access it directly
VideoPlayerController? videoPlayerController;

@riverpod
Future<void> lessonDetailController(LessonDetailControllerRef ref,{required int index}) async{
    LessonRequestEntity lessonRequestEntity = LessonRequestEntity();
    lessonRequestEntity.id = index;
   final response = await LessonRepo.courseLessonDetail(params: lessonRequestEntity);

   if(response.code==200){
       //return response.data;
     //var url = AppConstants.IMAGE_UPLOAD_PATH+response.data!.elementAt(0).url!;
     //we can also like this
     var url = "${AppConstants.IMAGE_UPLOAD_PATH}${response.data!.elementAt(0).url}";
     print('Video url is: $url');//it would show the clicked video url
     videoPlayerController = VideoPlayerController.network(url);
     var initializeVideoPlayer = videoPlayerController?.initialize();

     //we made an object and want to make it stateful, and want to make it also shared memory so that we can access
     //it from everywhere we need so creating riverpod LessonDataController class and build method to make it sharable
     //and to access it and pass it we need the help of "ref" object and notifier to make all the method under the
     //lessonDataControllerProvider available

     LessonVideo lessonVideo = LessonVideo(
       lessonItem: response.data!,
       isPlay: false,
       initializeVideoPlayer: initializeVideoPlayer,
       url: url
     );

     //it would be the main reason of playing video after calling the play() method
     videoPlayerController?.play();

     //to access riverpod annotation type class(like in this class LessonDataController class) and pass object we need to call 'ref' object and read method
     ref.read(lessonDataControllerProvider.notifier).updateData(lessonVideo);
     //notifier needs to be able to access all the method inside the 'LessonDataController' class


   }else{
       if (kDebugMode) {
         print('Request failed: ${response.data}');
       }
   }

   //return null;
}

@riverpod
class LessonDataController extends _$LessonDataController{
  @override
  FutureOr<LessonVideo> build(){
    return LessonVideo();//it will call the LessonVideo constructor and won't crash because at least will return empty at first time
  }
  //here riverpod gives us another override method, it helps us to get updated state info
  /*@override
  set state(AsyncValue<LessonVideo> newState) {
    print('------${newState.value!.lessonItem.first.url-------}');//when we click then it will give us the latest url that is coming to play the video
    // TODO: implement state
    super.state = newState;
  }*/

  //copyWith() method is used to get old object while we don't have any data and we can update with the new value and get new object when need
  //if we pass data it gets new value, if not pass then get old value
  void updateData(LessonVideo lessons){
    //we can also like this instead of using copyWith() method but it is possible only in the riverpod
    //update((data) => lessons);
    update((data) => data.copyWith(
      lessonItem: lessons.lessonItem,initializeVideoPlayer: lessons.initializeVideoPlayer,url: lessons.url,isPlay:lessons.isPlay//we don't want to pass isPlay because it is by default false right now
    ));//data object can find the copyWith method because we have LessonVideo class object as argument data
  }

  void playPause(bool isPlay){
    update((data) => data.copyWith(isPlay: isPlay));
  }

  //at first reset
  Future<void> playNextVideo(String url) async {
      if(videoPlayerController != null){
        videoPlayerController?.pause();
        videoPlayerController?.dispose();
      }
      //then restart again
      update((data) =>data.copyWith(
        isPlay:false,
        initializeVideoPlayer: null,
      ));
      var videoUrl = "${AppConstants.IMAGE_UPLOAD_PATH}$url";
      videoPlayerController = VideoPlayerController.network(videoUrl);
      var initVideoPlayerFuture = videoPlayerController?.initialize().then((value){
        videoPlayerController?.seekTo(const Duration(seconds: 0));

        videoPlayerController?.play();
      });

      update((data) => data.copyWith(
        initializeVideoPlayer: initVideoPlayerFuture,
        isPlay: true,
        url: videoUrl
      ));

      //videoPlayerController?.play();
  }

}
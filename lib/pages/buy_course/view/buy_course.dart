import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app_flutter_udemy/pages/buy_course/controller/buy_course_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BuyCourse extends ConsumerStatefulWidget {
  const BuyCourse({super.key});

  @override
  ConsumerState<BuyCourse> createState() => _BuyCourseState();
}

class _BuyCourseState extends ConsumerState<BuyCourse> {

  late var args;
  late WebViewController webViewController;

  @override
  void didChangeDependencies() {
    var id = ModalRoute.of(context)!.settings.arguments as Map;
    args = id["id"];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var courseBuy = ref.watch(buyCourseControllerProvider(index: args.toInt()));
    return Scaffold(
      appBar: AppBar(),
      body: courseBuy.when(data: (data){
        if(data == null){
          return Center(child: Text("Order exists or something went wrong!",textAlign:TextAlign.center,style: TextStyle(fontSize: 20.sp),),);
        }
        return WebView(
          initialUrl: data,
          javascriptMode: JavascriptMode.unrestricted,
          javascriptChannels: {
            //onMessageReceived() will be called at the last.When we go back from here
            JavascriptChannel(name: "Payment", onMessageReceived: (JavascriptMessage message){
              print(message.message);
              //we want to go back to our earlier page
              Navigator.of(context).pop(message.message);
            })
          },
          //at first it would called
          onWebViewCreated: (WebViewController web){
            webViewController = web;
          },
        );
      }, error: (error,traceStack)=>const Text("Error occurred."), loading: ()=>const Center(child: CircularProgressIndicator(),)),
    );
  }
}

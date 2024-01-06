import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shop_app_flutter_udemy/common/app_pages.dart';
import 'package:shop_app_flutter_udemy/common/utils/app_styles.dart';
import 'package:shop_app_flutter_udemy/global.dart';
import 'package:shop_app_flutter_udemy/pages/application/application.dart';
import 'package:shop_app_flutter_udemy/pages/sign_in/sign_in.dart';
import 'package:shop_app_flutter_udemy/pages/sign_up/sign_up.dart';
import 'package:shop_app_flutter_udemy/pages/welcome/welcome.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

Future<void> main() async {
  await Global.init();//many initialization is required so we need to write 'await' before Global.init()..because many files need to be initialized at a time.
  runApp(const ProviderScope(child: MyApp()));
}

var routesMap = {
  "/":(context)=>Welcome(),
  "/signIn":(context)=>SignIn(),
  "/signUp":(context)=>SignUp(),
  "/application":(context)=>Application()
};

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      builder: (context,child)=>MaterialApp(
        title: 'Flutter Demo',
        theme: AppTheme.appThemeData,
        initialRoute: "/",
        //routes: routesMap,
        //onGenerateRoute: (settings)=>AppPages.generateRouteSettings(settings),//we can also like this
        onGenerateRoute: AppPages.generateRouteSettings,
        //home:  Welcome(),
      ),

    );
  }
}


final appCount = StateProvider<int>((ref){
  return 1;
});



class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key, });



  @override
  Widget build(BuildContext context, WidgetRef ref) {

    var count = ref.watch(appCount);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text("Riverpod App"),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$count',
              //count.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            heroTag: "one",//to prevent the heroTag issue in runtime in the console
            onPressed:(){
              Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>SecondPage()));

            },
            tooltip: 'Increment',
            child: const Icon(Icons.arrow_right_rounded),
          ),
          FloatingActionButton(
            heroTag: "two",
            onPressed:(){
              count++;
              print(count.toString());
              ref.read(appCount.notifier).state++;
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


class SecondPage extends ConsumerWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    int count = ref.watch(appCount);
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          "$count",style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}


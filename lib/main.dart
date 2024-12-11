import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:movies/constant.dart';
import 'package:movies/view/HomeScreen/HomeScreen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Movies',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: AnimatedSplashScreen( nextScreen: HomeScreen(),
        backgroundColor: Colors.black,
        duration: 4000,
        splash: Image.asset("assets/images/net.gif",
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.cover,),
        splashIconSize: double.infinity,
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.topToBottom,
      )
    );
  }
}

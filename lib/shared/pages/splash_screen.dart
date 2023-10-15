import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/meal/presentation/pages/controller_page.dart';
import 'package:page_transition/page_transition.dart';

// class SplashScreen extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedSplashScreen(
//         duration: 3000,
//         splash: Icons.home,
//         nextScreen: ControllerPage(),
//         splashTransition: SplashTransition.fadeTransition,
//         pageTransitionType: PageTransitionType.scale,
//         backgroundColor: Colors.blue);
//   }
// }
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(children: [Icon(Icons.home)],),
    );
  }
}
// ignore_for_file: unnecessary_null_comparison

import 'dart:async';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:water_monster/Screens/home.dart';
import 'package:water_monster/Screens/login.dart';
import 'package:page_transition/page_transition.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
        child: Column(
          children: [
            SvgPicture.asset(
              'Assets/svg/Logo.svg',
              width: 110,
              height: 110,
            ),
            const SizedBox(
              height: 10,
            ),
            SvgPicture.asset(
              'Assets/svg/Loading.svg',
              width: 90,
              height: 90,
            ),
          ],
        ),
      ),
      nextScreen: const Login(),
      splashIconSize: 250,
      duration: 4000,
      backgroundColor: const Color.fromRGBO(40, 140, 255, 60),
      splashTransition: SplashTransition.slideTransition,
      pageTransitionType: PageTransitionType.leftToRightWithFade,
      animationDuration: const Duration(seconds: 1),
    );
  }
}

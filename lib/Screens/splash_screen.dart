import 'dart:async';

import 'package:flutter/material.dart';
import 'package:laundry_app/Routes/route.dart';
import 'package:laundry_app/Screens/Onboarding%20Screen/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  // late Animation<Offset> _animation1, _animation2;
  // late AnimationController _animationController;
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    // _animationController =
    //     AnimationController(vsync: this, duration: Duration(milliseconds: 800));

    // _animation1 = Tween<Offset>(begin: Offset(0.0, -2.0), end: Offset.zero)
    //     .animate(_animationController);
    // _animation2 = Tween<Offset>(begin: Offset(0.0, 3.0), end: Offset.zero)
    //     .animate(_animationController);
    // _animationController.forward();
    // _animation1.addListener(() {
    //   setState(() {});
    // });
    // _animation2.addListener(() {
    //   setState(() {});
    // });

    _timer = Timer(Duration(seconds: 4), () {
      Navigator.of(context).push(
        RouteToPage(
          OnBoardingScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(237, 240, 255, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SlideTransition(
          //   position: _animation1,
          //   child: Container(
          //     height: size.height / 4.5,
          //     width: size.width,
          //     decoration: BoxDecoration(
          //         // image: DecorationImage(
          //         //   image: AssetImage("assets/p1.png"),
          //         // ),
          //         ),
          //   ),
          // ),
          // SlideTransition(
          //   position: _animation2,
          //   child: Container(
          //     height: size.height / 14,
          //     width: size.width,
          //     // decoration: BoxDecoration(
          //     //   image: DecorationImage(
          //     //     image: AssetImage("assets/p2.png"),
          //     //   ),
          //     // ),
          //   ),
          // ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

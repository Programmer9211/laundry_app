import 'dart:async';

import 'package:flutter/material.dart';
import 'package:laundry_app/Routes/route.dart';
import 'package:laundry_app/Screens/Onboarding%20Screen/screen_1.dart';
import 'package:laundry_app/Screens/login_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  final PageController _controller = PageController();

  late Animation<Offset> _animation;
  late AnimationController _animationController;
  bool but1 = false;
  bool but2 = false;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    _animation = Tween<Offset>(begin: Offset(1.5, 0.0), end: Offset.zero)
        .animate(_animationController);

    _animation.addListener(() {
      setState(() {});
    });

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: _controller,
        onPageChanged: (val) {
          setState(() {
            _currentIndex = val;
          });
          if (_currentIndex == 2) {
            _animationController.reset();
            _animationController.forward();
          }
        },
        children: [
          Screen1(
            imageUrl: "assets/1.png",
            title: "Laundry day is important",
            content:
                "If your Service is Deserving of good Quality and people accepting the same for their daily use.Then its Very Easy ways to expand your services.",
          ),
          Screen1(
            imageUrl: "assets/3.png",
            title: "Quality Work at Perfect Time",
            content:
                "If your Service is Deserving of good Quality and people accepting the same for their daily use.Then its Very Easy ways to expand your services.",
          ),
          Screen1(
            imageUrl: "assets/2.png",
            title: "Fresh Clothes, Fresh Life",
            content:
                "If your Service is Deserving of good Quality and people accepting the same for their daily use.Then its Very Easy ways to expand your services.",
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: size.height / 8,
        width: size.width,
        alignment: Alignment.center,
        child: _currentIndex == 2
            ? customButton(size)
            : Row(
                children: [
                  SizedBox(
                    width: size.width / 9,
                  ),
                  Container(
                    height: size.height / 15,
                    width: size.height / 15,
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        _controller.animateToPage(_currentIndex - 1,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.ease);
                        setState(() {
                          but1 = true;
                        });
                        Timer(Duration(milliseconds: 200), () {
                          setState(() {
                            but1 = false;
                          });
                        });
                      },
                      child: Material(
                        elevation: 5,
                        borderRadius: BorderRadius.circular(400),
                        color: Colors.grey[100],
                        child: AnimatedContainer(
                          height: but1 ? size.height / 15 : size.height / 17,
                          width: but1 ? size.height / 15 : size.height / 17,
                          duration: Duration(milliseconds: 200),
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.grey[700],
                            size: size.width / 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: size.width / 1.9,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < 3; i++)
                          buildIndicator(
                              size, i == _currentIndex ? true : false),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _controller.animateToPage(_currentIndex + 1,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.ease);
                      setState(() {
                        but2 = true;
                      });
                      Timer(Duration(milliseconds: 200), () {
                        setState(() {
                          but2 = false;
                        });
                      });
                      if (_currentIndex == 2) {
                        _animationController.reset();
                        _animationController.forward();
                      }
                    },
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(400),
                      child: AnimatedContainer(
                        height: but2 ? size.height / 12 : size.height / 12.9,
                        width: but2 ? size.height / 12 : size.height / 12.9,
                        duration: Duration(milliseconds: 100),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(135, 165, 167, 1),
                        ),
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: size.width / 14,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget customButton(Size size) {
    return SlideTransition(
      position: _animation,
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(RouteToPage(LoginScreen())),
        child: Container(
          height: size.height / 18,
          width: size.width / 3.5,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromRGBO(135, 165, 167, 1),
          ),
          alignment: Alignment.center,
          child: Text(
            "Next",
            style: TextStyle(
              color: Colors.white,
              fontSize: size.width / 22,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildIndicator(Size size, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.all(2.2),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        height: isSelected ? size.height / 70 : size.height / 90,
        width: isSelected ? size.height / 70 : size.height / 90,
        decoration: BoxDecoration(
          color: isSelected ? Colors.orange : Colors.orange[200],
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

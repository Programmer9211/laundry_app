import 'package:flutter/material.dart';
import 'package:laundry_app/const/empty.dart';
import 'package:laundry_app/home_%20screen/Nearby_laundries.dart';
import 'package:laundry_app/home_%20screen/home/cart_screen/cart_screen.dart';

import 'home/home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  Color color = Colors.white;

  @override
  void initState() {
    super.initState();
  }

  static const List<Widget> _screens = [
    Home(),
    NearbyLaundries(),
    CartScreen(),
    Empty(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.redAccent,
      child: SafeArea(
        child: Scaffold(
          body: _screens[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              _currentIndex = index;
              if (_currentIndex == 1)
                color = Colors.white;
              else
                color = Colors.blue;
              setState(() {});
            },
            currentIndex: _currentIndex,
            selectedItemColor: Colors.redAccent,
            unselectedItemColor: Colors.black,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag),
                label: "Laundries",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: "Cart",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.food_bank),
                label: "Chat",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:laundry_app/const/const.dart';
import 'package:laundry_app/home_%20screen/home/laundry_details/laundry_item.dart';
import 'package:laundry_app/home_%20screen/home/laundry_details/show_categories.dart';

import '../../profile_screen.dart';
import '../avalible_services.dart';
import '../home.dart';

class LaundryDetails extends StatefulWidget {
  const LaundryDetails({Key? key}) : super(key: key);

  @override
  _LaundryDetailsState createState() => _LaundryDetailsState();
}

class _LaundryDetailsState extends State<LaundryDetails> {
  final PageController _controller = PageController();

  late Timer _time;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();

    _time = Timer.periodic(Duration(seconds: 2), (timer) {
      if (currentIndex != 1) {
        if (currentIndex < 3) {
          _controller.animateToPage(
            currentIndex + 1,
            duration: Duration(seconds: 1),
            curve: Curves.ease,
          );
        } else {
          _controller.animateToPage(
            0,
            duration: Duration(seconds: 1),
            curve: Curves.ease,
          );
        }
      }
    });
  }

  int currentIndex = 0;

  List<bool> _isEnabled = [
    true,
    false,
    false,
    false,
  ];

  List<bool> isSelected = [
    true,
    false,
    false,
    false,
  ];

  bool _ishidden = true;

  void change() {
    setState(() {
      _currentIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return _currentIndex == 1
        ? ShowCategories(
            function: () => change(),
          )
        : Container(
            color: Colors.redAccent,
            child: SafeArea(
              child: Scaffold(
                body: Container(
                  height: size.height,
                  width: size.width,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        //

                        Container(
                          height: size.height / 10,
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width / 40),
                                child: Icon(
                                  Icons.location_on,
                                  size: size.width / 18,
                                  color: Colors.red,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: size.width / 30),
                                  child: Text(
                                    "LaxmiNagar, Sec 78, New Delhi",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: size.width / 22,
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => ProfileScreen(),
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: size.width / 30),
                                  child: Icon(
                                    Icons.account_circle,
                                    size: size.width / 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        //Banner View...

                        Container(
                          height: size.height / 4,
                          width: size.width,
                          child: PageView.builder(
                            controller: _controller,
                            onPageChanged: (val) {
                              _isEnabled[currentIndex] = false;
                              currentIndex = val;
                              _isEnabled[val] = true;
                              setState(() {});
                            },
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: size.width / 35,
                                  vertical: size.width / 45,
                                ),
                                child: Material(
                                  elevation: 5,
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                    height: size.height / 4,
                                    width: size.width / 1.1,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          data[index].imageUrl,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),

                        //Build Indicator...

                        Container(
                          height: size.height / 25,
                          width: size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              for (int i = 0; i < 4; i++)
                                indicator(size, _isEnabled[i]),
                            ],
                          ),
                        ),

                        //

                        Container(
                          height: size.height / 11,
                          width: size.width / 1.1,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Laundry Name",
                            style: TextStyle(
                              fontSize: size.width / 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),

                        // Show or hide details...

                        InkWell(
                          onTap: () {
                            setState(() {
                              _ishidden = !_ishidden;
                            });
                          },
                          child: Container(
                            height: size.height / 15,
                            width: size.width / 1.1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  _ishidden ? "View Details" : "Hide Details",
                                  style: TextStyle(
                                    fontSize: size.width / 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  size: size.width / 15,
                                ),
                              ],
                            ),
                          ),
                        ),

                        // Description

                        _ishidden ? SizedBox() : Details(),

                        //

                        SizedBox(
                          height: size.height / 30,
                        ),

                        Flexible(
                          child: GridView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 4,
                            itemBuilder: (context, index) {
                              return AvalibleServicesItems(
                                data: Home.data[index],
                              );
                            },
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 0,
                              crossAxisSpacing: 0,
                              childAspectRatio: 1.28,
                            ),
                          ),
                        ),

                        Container(
                          height: size.height / 15,
                          width: size.width / 1.1,
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "Previous Orders",
                            style: TextStyle(
                              fontSize: size.width / 20,
                            ),
                          ),
                        ),

                        Flexible(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return LaundryItem(
                                add: () {},
                                sub: () {},
                              );
                            },
                          ),
                        ),

                        // Items List...

                        //Tab Bar View...
                      ],
                    ),
                  ),
                ),
                bottomNavigationBar: BottomNavigationBar(
                  currentIndex: _currentIndex,
                  onTap: (value) {
                    _currentIndex = value;
                    setState(() {});
                  },
                  selectedItemColor: Colors.redAccent,
                  unselectedItemColor: Colors.black,
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: "Home",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.list),
                      label: "Items",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.list),
                      label: "Items",
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.list),
                      label: "Items",
                    ),
                  ],
                ),
              ),
            ),
          );
  }

  Widget indicator(Size size, bool isSelected) {
    return Padding(
      padding: EdgeInsets.all(1.5),
      child: Container(
        height: isSelected ? size.height / 85 : size.height / 110,
        width: isSelected ? size.height / 85 : size.height / 110,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget button(Size size, String text, bool isSelect, int index) {
    return Expanded(
      flex: isSelected[index] ? 1 : 1,
      child: InkWell(
        onTap: () {
          for (int i = 0; i < 4; i++) {
            isSelected[i] = false;
          }
          isSelected[index] = true;
          setState(() {});
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: size.height / 100,
            horizontal: size.width / 50,
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: isSelected[index] ? Colors.redAccent : Colors.white,
            ),
            alignment: Alignment.center,
            child: Text(
              text,
              style: TextStyle(
                  color: isSelect ? Colors.white : Colors.redAccent,
                  fontSize: size.width / 25,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _time.cancel();
    _controller.dispose();
    super.dispose();
  }
}

class Details extends StatelessWidget {
  const Details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          width: size.width / 1.1,
          alignment: Alignment.centerLeft,
          child: Text(
            "We are professionals in the laundry and dry cleaning business, cleaning methods, and solutions for dealing with stains or delicate fabrics. \n",
            style: TextStyle(
              fontSize: size.width / 22,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),

        //Contact no.

        Container(
          height: size.height / 40,
          width: size.width / 1.1,
          alignment: Alignment.bottomLeft,
          child: Text(
            "Phone No",
            style: TextStyle(
              fontSize: size.width / 22,
            ),
          ),
        ),

        Container(
          width: size.width / 1.1,
          alignment: Alignment.centerLeft,
          child: Text(
            "9876543210\n",
            style: TextStyle(
              fontSize: size.width / 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),

        // Address

        Container(
          height: size.height / 40,
          width: size.width / 1.1,
          alignment: Alignment.bottomLeft,
          child: Text(
            "Address",
            style: TextStyle(
              fontSize: size.width / 20,
            ),
          ),
        ),

        Container(
          width: size.width / 1.1,
          alignment: Alignment.centerLeft,
          child: Text(
            "Gali No. 12, Locality : Near Something , LaxmiNagar, Sec 78, New Delhi",
            style: TextStyle(
              fontSize: size.width / 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

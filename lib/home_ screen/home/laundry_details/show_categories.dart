import 'package:flutter/material.dart';
import 'package:laundry_app/check_avaliblity/check_avaliblity.dart';
import 'package:laundry_app/const/custom_button.dart';
import 'package:laundry_app/home_%20screen/home/search_screen/search_scree.dart';
import 'package:laundry_app/home_%20screen/profile_screen.dart';

import 'laundry_item.dart';

class ShowCategories extends StatefulWidget {
  final Function function;
  const ShowCategories({required this.function, Key? key}) : super(key: key);

  @override
  _ShowCategoriesState createState() => _ShowCategoriesState();
}

class _ShowCategoriesState extends State<ShowCategories> {
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

  bool _isAdded = false;

  void add() {
    setState(() {
      _isAdded = true;
    });
  }

  void sub() {
    setState(() {
      _isAdded = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
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
                  Container(
                    height: size.height / 10,
                    width: size.width / 1.1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () => widget.function(),
                          icon: Icon(
                            Icons.arrow_back,
                            size: size.width / 14,
                          ),
                        ),
                        IconButton(
                          onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => ProfileScreen(),
                            ),
                          ),
                          icon: Icon(
                            Icons.account_circle,
                            size: size.width / 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () => showSearch(
                      context: context,
                      delegate: SearchScreen(),
                    ),
                    child: Material(
                      elevation: 6,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: size.height / 15,
                        width: size.width / 1.1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey, width: 1.5),
                        ),
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: size.width / 30),
                          child: Row(
                            children: [
                              Icon(
                                Icons.search,
                                size: size.width / 15,
                                color: Colors.redAccent,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: size.width / 30),
                                child: Text(
                                  "Search Laundries...",
                                  style: TextStyle(
                                    fontSize: size.width / 24,
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: size.height / 50),
                    child: Container(
                      height: size.height / 16,
                      width: size.width,
                      // decoration: BoxDecoration(
                      //   //borderRadius: BorderRadius.circular(15),
                      //   color: Color.fromRGBO(4, 41, 250, 0.58),
                      // ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          button(size, "Men", isSelected[0], 0),
                          button(size, "Women", isSelected[1], 1),
                          button(size, "Others", isSelected[2], 2),
                          button(size, "Reviews", isSelected[3], 3),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    child: Builder(
                      builder: (context) {
                        if (isSelected[0]) {
                          return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 20,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return LaundryItem(
                                add: () => add(),
                                sub: () => sub(),
                              );
                            },
                          );
                        } else if (isSelected[1]) {
                          return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 20,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return LaundryItem(
                                add: () => add(),
                                sub: () => sub(),
                              );
                            },
                          );
                        } else if (isSelected[2]) {
                          return ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 20,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return LaundryItem(
                                add: () => add(),
                                sub: () => sub(),
                              );
                            },
                          );
                        } else {
                          return Container(
                            height: size.height / 2,
                            width: size.width,
                            alignment: Alignment.center,
                            child: Text(
                              "No Reviews Yet!",
                              style: TextStyle(
                                fontSize: size.width / 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          bottomNavigationBar: _isAdded
              ? Container(
                  height: size.width / 7,
                  width: size.width,
                  alignment: Alignment.center,
                  child: CustomButton(
                    text: "Proceed To Cart",
                    color: Colors.black,
                    function: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => ScheduleBookingScreen(),
                      ),
                    ),
                    width: 2,
                  ),
                )
              : null,
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
              borderRadius: BorderRadius.circular(5),
              border: Border.all(),
              color: isSelected[index] ? Colors.red[100] : Colors.white,
            ),
            alignment: Alignment.center,
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: size.width / 25,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}

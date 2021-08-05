import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:laundry_app/const/const.dart';
import 'package:laundry_app/home_%20screen/home/search_screen/search_scree.dart';
import 'package:laundry_app/home_%20screen/profile_screen.dart';

import 'avalible_services.dart';
import 'nearby_laundry.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  static final List<AvalibleServicesItemsData> data = [
    AvalibleServicesItemsData(text: "Stream Press", imageUrl: ""),
    AvalibleServicesItemsData(text: "Dry Cleaning", imageUrl: ""),
    AvalibleServicesItemsData(text: "Commercial Laundry", imageUrl: ""),
    AvalibleServicesItemsData(text: "Service 4", imageUrl: ""),
    AvalibleServicesItemsData(text: "Service 5", imageUrl: ""),
    AvalibleServicesItemsData(text: "Service 6", imageUrl: ""),
    AvalibleServicesItemsData(text: "Service 7", imageUrl: ""),
    AvalibleServicesItemsData(text: "Service 8", imageUrl: ""),
  ];

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController _scrollController = ScrollController();
  PageController _controller = PageController();
  bool _isExpanded = false;
  bool _isAttach = false;
  late Size size;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >= size.height / 11) {
        if (_isAttach) {
        } else {
          _isAttach = true;
          setState(() {});
        }
      } else {
        if (_isAttach) {
          _isAttach = false;
          setState(() {});
        } else {}
      }
      print(_isAttach);
    });

    // _timer = Timer.periodic(Duration(seconds: 2), (timer) {
    //   if (currentIndex < 4) {
    //     _controller.animateToPage(
    //       currentIndex + 1,
    //       duration: Duration(seconds: 1),
    //       curve: Curves.ease,
    //     );
    //   } else {
    //     _controller.animateToPage(
    //       0,
    //       duration: Duration(seconds: 1),
    //       curve: Curves.ease,
    //     );
    //   }
    // });
  }

  int currentIndex = 0;

  List<bool> _isEnabled = [
    true,
    false,
    false,
    false,
    false,
  ];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
          child: _isAttach
              ? Container(
                  height: size.height / 11,
                  width: size.width,
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () =>
                        showSearch(context: context, delegate: SearchScreen()),
                    child: Material(
                      elevation: 6,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: size.height / 15,
                        width: size.width / 1.1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border:
                              Border.all(color: Colors.grey[400]!, width: 2.2),
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
                )
              : SizedBox(),
          preferredSize: size),
      body: Container(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Top Box...

              Container(
                height: size.height / 11,
                width: size.width,
                child: Row(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width / 40),
                      child: Icon(
                        Icons.location_on,
                        size: size.width / 18,
                        color: Colors.red,
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () => sheet(),
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: size.width / 30),
                          child: Text(
                            "LaxmiNagar, Sec 78, New Delhi",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: size.width / 22,
                            ),
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
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width / 30),
                        child: Icon(
                          Icons.account_circle,
                          size: size.width / 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Search Bar

              _isAttach
                  ? SizedBox()
                  : InkWell(
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
                            border: Border.all(
                                color: Colors.grey[400]!, width: 2.2),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: size.width / 30),
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

              SizedBox(
                height: size.height / 50,
              ),

              // Card View Screen...

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Cards(),
                  Cards(),
                ],
              ),

              SizedBox(
                height: size.height / 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Cards(),
                  Cards(),
                ],
              ),
              //Banner View...

              // Container(
              //   height: size.height / 4,
              //   width: size.width,
              //   child: PageView.builder(
              //     controller: _controller,
              //     onPageChanged: (val) {
              //       _isEnabled[currentIndex] = false;
              //       currentIndex = val;
              //       _isEnabled[val] = true;
              //       setState(() {});
              //     },
              //     itemCount: 5,
              //     itemBuilder: (context, index) {
              //       return Padding(
              //         padding: EdgeInsets.symmetric(
              //           horizontal: size.width / 35,
              //           vertical: size.width / 45,
              //         ),
              //         child: Material(
              //           elevation: 5,
              //           borderRadius: BorderRadius.circular(10),
              //           child: Container(
              //             height: size.height / 4,
              //             width: size.width / 1.1,
              //             decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(10),
              //               image: DecorationImage(
              //                 image: NetworkImage(
              //                   data[index].imageUrl,
              //                 ),
              //                 fit: BoxFit.cover,
              //               ),
              //             ),
              //           ),
              //         ),
              //       );
              //     },
              //   ),
              // ),

              // //Build Indicator...

              // Container(
              //   height: size.height / 25,
              //   width: size.width,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       for (int i = 0; i < 5; i++) indicator(size, _isEnabled[i]),
              //     ],
              //   ),
              // ),

              // Services Avalible...

              Container(
                height: size.height / 19,
                width: size.width / 1.1,
                alignment: Alignment.centerLeft,
                child: Text(
                  "Available Services",
                  style: TextStyle(
                    fontSize: size.width / 20,
                    color: Colors.grey[900],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              // List View Builder...

              Flexible(
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: _isExpanded ? Home.data.length : 3,
                  itemBuilder: (context, index) {
                    return AvalibleServicesItems(
                      data: Home.data[index],
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 0,
                    crossAxisSpacing: 0,
                  ),
                ),
              ),

              // View More...

              Padding(
                padding: EdgeInsets.symmetric(vertical: size.height / 40),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                  },
                  child: Container(
                    height: size.height / 25,
                    width: size.width / 3.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 1),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          _isExpanded ? "View Less" : "View More",
                          style: TextStyle(
                            fontSize: size.width / 26,
                          ),
                        ),
                        _isExpanded
                            ? Icon(
                                Icons.arrow_drop_up,
                                size: size.width / 18,
                              )
                            : Icon(
                                Icons.arrow_drop_down,
                                size: size.width / 18,
                              ),
                      ],
                    ),
                  ),
                ),
              ),

              //

              Container(
                height: size.height / 18,
                width: size.width / 1.1,
                alignment: Alignment.centerLeft,
                child: Text(
                  "Nearby Laundry",
                  style: TextStyle(
                    fontSize: size.width / 22,
                    color: Colors.grey[900],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              //

              Flexible(
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return NearbyLaundryList(
                      data: data[index],
                    );
                  },
                ),
              ),

              //
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

  @override
  void dispose() {
    _controller.dispose();
    //_timer.cancel();
    super.dispose();
  }

  void sheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Bottomsheet();
      },
    );
  }
}

class Cards extends StatelessWidget {
  const Cards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height / 5.8,
      width: size.width / 2.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.redAccent,
      ),
    );
  }
}

class Bottomsheet extends StatelessWidget {
  const Bottomsheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height / 1.2,
      width: size.width,
      child: Column(
        children: [
          Container(
            height: size.height / 10,
            width: size.width / 1.1,
            alignment: Alignment.bottomRight,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    child: Text(
                      "Search Locations",
                      style: TextStyle(
                        fontSize: size.width / 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: size.height / 11,
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
          ),

          //

          InkWell(
            onTap: () => showSearch(context: context, delegate: SearchScreen()),
            child: Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: size.height / 15,
                width: size.width / 1.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey[400]!, width: 2.2),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width / 30),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        size: size.width / 15,
                        color: Colors.redAccent,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width / 30),
                        child: Text(
                          "Search for your location",
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

          //

          Container(
            height: size.height / 11,
            child: Row(
              children: [
                SizedBox(
                  width: size.width / 20,
                ),
                Icon(
                  Icons.location_searching,
                  size: size.width / 17,
                  color: Colors.redAccent,
                ),
                SizedBox(
                  width: size.width / 20,
                ),
                Text(
                  "Use Current Location",
                  style: TextStyle(
                      fontSize: size.width / 23,
                      fontWeight: FontWeight.w500,
                      color: Colors.redAccent),
                ),
              ],
            ),
          ),

          //

          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width / 18,
              vertical: size.height / 150,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Saved Address",
                style: TextStyle(
                  fontSize: size.width / 19,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),

          //

          Container(
            height: size.height / 10,
            width: size.width,
            padding: EdgeInsets.symmetric(horizontal: size.width / 18),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: size.width / 50),
                  child: Icon(
                    Icons.home,
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: "Home",
                    style: TextStyle(
                      fontSize: size.width / 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    children: [
                      TextSpan(
                        text: "\nLaxmiNagar, Sec 78, New Delhi",
                        style: TextStyle(
                          fontSize: size.width / 24,
                          color: Colors.grey[700],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

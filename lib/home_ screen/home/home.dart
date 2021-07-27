import 'dart:async';

import 'package:flutter/material.dart';
import 'package:laundry_app/const/const.dart';
import 'package:laundry_app/home_%20screen/home/search_screen/search_scree.dart';

import 'avalible_services.dart';
import 'nearby_laundry.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  static final List<AvalibleServicesItemsData> data = [
    AvalibleServicesItemsData(text: "Stream Press", imageUrl: ""),
    AvalibleServicesItemsData(text: "Dry Cleaning", imageUrl: ""),
    AvalibleServicesItemsData(text: "Commercial Laundry", imageUrl: ""),
  ];

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Timer _timer;
  PageController _controller = PageController();

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(Duration(seconds: 2), (timer) {
      if (currentIndex < 4) {
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
    });
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
    final Size size = MediaQuery.of(context).size;

    return Container(
      child: SingleChildScrollView(
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
                    padding: EdgeInsets.symmetric(horizontal: size.width / 40),
                    child: Icon(
                      Icons.location_on,
                      size: size.width / 18,
                      color: Colors.red,
                    ),
                  ),
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: size.width / 30),
                      child: Text(
                        "LaxmiNagar, Sec 78, New Delhi",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: size.width / 22,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Search Bar

            InkWell(
              onTap: () =>
                  showSearch(context: context, delegate: SearchScreen()),
              child: Container(
                height: size.height / 17,
                width: size.width / 1.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Search Laundries...",
                        style: TextStyle(
                          fontSize: size.width / 24,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Icon(
                        Icons.search,
                        size: size.width / 15,
                        color: Color.fromRGBO(4, 41, 250, 0.7),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SizedBox(
              height: size.height / 50,
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
                itemCount: 5,
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
                  for (int i = 0; i < 5; i++) indicator(size, _isEnabled[i]),
                ],
              ),
            ),

            // Services Avalible...

            Container(
              height: size.height / 19,
              width: size.width / 1.1,
              alignment: Alignment.centerLeft,
              child: Text(
                "Avalibe Services",
                style: TextStyle(
                  fontSize: size.width / 20,
                  color: Colors.grey[900],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            // List View Builder...

            Container(
              height: size.height / 4.6,
              width: size.width,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return AvalibleServicesItems(
                    data: Home.data[index],
                  );
                },
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
    _timer.cancel();
    super.dispose();
  }
}

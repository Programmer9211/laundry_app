import 'package:flutter/material.dart';
import 'package:laundry_app/home_%20screen/home/cart_screen/cart_screen.dart';

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
  int currentIndex = 0;

  List<bool> _isEnabled = [
    true,
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
              color: Color.fromRGBO(4, 41, 250, 0.58),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width / 40),
                    child: Icon(
                      Icons.location_on,
                      size: size.width / 18,
                      color: Colors.white,
                    ),
                  ),
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: size.width / 30),
                      child: Text(
                        "LaxmiNagar, Sec 78, New Delhi, Haryana",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: size.width / 22,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width / 40),
                    child: InkWell(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => CartScreen(),
                        ),
                      ),
                      child: Icon(
                        Icons.shopping_cart,
                        size: size.width / 18,
                        color: Colors.white,
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
                          image: DecorationImage(
                            image: AssetImage("assets/3.png"),
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
                  for (int i = 0; i < 4; i++) indicator(size, _isEnabled[i]),
                ],
              ),
            ),

            // Services Avalible...

            Container(
              height: size.height / 18,
              width: size.width / 1.1,
              alignment: Alignment.centerLeft,
              child: Text(
                "Avalible Services",
                style: TextStyle(
                  fontSize: size.width / 22,
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
                itemCount: 10,
                itemBuilder: (context, index) {
                  return NearbyLaundryList();
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
}

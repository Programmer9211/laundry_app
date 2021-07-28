import 'package:flutter/material.dart';
import 'package:laundry_app/check_avaliblity/check_avaliblity.dart';
import 'package:laundry_app/const/const.dart';
import 'package:laundry_app/home_%20screen/home/laundry_details/laundry_item.dart';
import 'package:laundry_app/home_%20screen/home/laundry_details/launndry_details.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: size.width,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //App Bar..

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
                  Expanded(
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
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width / 50),
                    child: Icon(
                      Icons.account_circle,
                      size: size.width / 16,
                    ),
                  ),
                ],
              ),
            ),

            InkWell(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => LaundryDetails(),
                ),
              ),
              child: Container(
                height: size.height / 2.4,
                width: size.width / 1.05,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    Container(
                      height: size.height / 4.5,
                      width: size.width / 1.05,
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        image: DecorationImage(
                          image: NetworkImage(
                            data[1].imageUrl,
                          ),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: size.height / 80,
                        left: size.width / 30,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Laundry Name",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: size.width / 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: size.height / 80,
                        horizontal: size.width / 30,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "LaxmiBihar New Delhi Sec 76, Galino. 29",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: size.width / 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: size.height / 12,
                      width: size.width,
                      child: Row(
                        children: [
                          SizedBox(
                            width: size.width / 20,
                          ),
                          Icon(
                            Icons.online_prediction_rounded,
                            color: Colors.white,
                            size: size.width / 16,
                          ),
                          SizedBox(
                            width: size.width / 30,
                          ),
                          Text(
                            "Rs. 500",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: size.width / 22,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 2,
                            ),
                          ),
                          SizedBox(
                            width: size.width / 3.2,
                          ),
                          InkWell(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => ScheduleBookingScreen(),
                              ),
                            ),
                            child: Material(
                              elevation: 5,
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                              child: Container(
                                  height: size.height / 24,
                                  width: size.width / 3.6,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Order now",
                                        style: TextStyle(
                                          color: Colors.redAccent,
                                          fontWeight: FontWeight.bold,
                                          fontSize: size.width / 24,
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.redAccent,
                                        size: size.width / 20,
                                      )
                                    ],
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Flexible(
              child: Container(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return LaundryItem();
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

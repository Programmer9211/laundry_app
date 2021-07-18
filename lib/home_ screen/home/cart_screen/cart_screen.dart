import 'package:flutter/material.dart';
import 'package:laundry_app/const/custom_app_bar.dart';
import 'package:laundry_app/home_%20screen/booking_details/booking_details.dart';
import 'package:laundry_app/home_%20screen/order_screen/order_screen_items.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Container(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              //App Bar..

              CustomAppBar(isbackButtonEnabled: true, title: "Cart"),

              //

              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return OrderListItems();
                  },
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: size.height / 12,
          width: size.width,
          color: Color.fromRGBO(4, 41, 250, 0.58),
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
                  MaterialPageRoute(builder: (_) => BookingDetails(),),
                ),
                child: Material(
                  elevation: 5,
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  child: Container(
                    height: size.height / 24,
                    width: size.width / 3.6,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Pay Now",
                          style: TextStyle(
                            color: Color.fromRGBO(4, 41, 250, 0.58),
                            fontWeight: FontWeight.bold,
                            fontSize: size.width / 24,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Color.fromRGBO(4, 41, 250, 0.58),
                          size: size.width / 20,
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

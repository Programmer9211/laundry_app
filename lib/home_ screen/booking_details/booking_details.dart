import 'package:flutter/material.dart';
import 'package:laundry_app/const/custom_button.dart';
import 'package:laundry_app/payment_methods/payment_gateway_selection.dart';

import 'address_box.dart';
import 'bill_details.dart';
import 'slot-details.dart';

class BookingDetails extends StatelessWidget {
  const BookingDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Container(
          height: size.height,
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Back Button...

                Padding(
                  padding: EdgeInsets.all(size.width / 30),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        height: size.height / 15,
                        width: size.height / 15,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(4, 41, 250, 0.48),
                        ),
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.arrow_back,
                          size: size.width / 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),

                // Box 1 Address Details...

                BookingAddressBox(),

                // Empty Box For Gap...

                SizedBox(
                  height: size.height / 20,
                ),

                // Box 2 Slot Details...

                SlotDetailsBox(),

                // Empty Box For Gap...

                SizedBox(
                  height: size.height / 20,
                ),

                // Bill Details Box...

                BillDetailsBox(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          height: size.height / 10,
          width: size.width,
          alignment: Alignment.topCenter,
          child: CustomButton(
            text: "Confirm Booking",
            width: 1.5,
            function: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => PaymentGatewaySelection(),
              ),
            ),
            color: Color.fromRGBO(4, 41, 250, 0.58),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class OrderListItems extends StatelessWidget {
  const OrderListItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: size.height / 100,
        horizontal: size.width / 50,
      ),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(5),
        child: Container(
          height: size.height / 9,
          width: size.width / 1.1,
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  right: size.width / 50,
                ),
                child: Container(
                  height: size.height / 7,
                  width: size.width / 3.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      bottomLeft: Radius.circular(5),
                    ),
                    color: Colors.redAccent,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "Image",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: size.width / 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: size.height / 8.5,
                  child: RichText(
                    text: TextSpan(
                      text: "Item Name.\n",
                      style: TextStyle(
                        fontSize: size.width / 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: "Quantity : 4 \nPrice : Rs. 240",
                          style: TextStyle(
                            fontSize: size.width / 25,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                        //
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

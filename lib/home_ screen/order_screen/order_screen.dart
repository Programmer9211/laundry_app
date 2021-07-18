import 'package:flutter/material.dart';
import 'package:laundry_app/const/custom_app_bar.dart';

import 'order_screen_items.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: size.width,
      child: Column(
        children: [
          CustomAppBar(isbackButtonEnabled: false, title: "Orders"),
          Expanded(
            child: Container(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return OrderListItems();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

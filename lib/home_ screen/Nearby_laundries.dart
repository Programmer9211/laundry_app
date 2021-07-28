import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:laundry_app/const/const.dart';
import 'package:laundry_app/home_%20screen/home/nearby_laundry.dart';

import 'home/search_screen/search_scree.dart';

class NearbyLaundries extends StatelessWidget {
  const NearbyLaundries({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: size.width,
      child: Column(
        children: [
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
            onTap: () => showSearch(context: context, delegate: SearchScreen()),
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
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return NearbyLaundryList1();
              },
            ),
          ),
        ],
      ),
    );
  }
}

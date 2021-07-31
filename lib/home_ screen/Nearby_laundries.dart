import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:laundry_app/const/const.dart';
import 'package:laundry_app/home_%20screen/home/nearby_laundry.dart';
import 'package:laundry_app/home_%20screen/profile_screen.dart';

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
                InkWell(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => ProfileScreen(),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width / 30),
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

          InkWell(
            onTap: () => showSearch(context: context, delegate: SearchScreen()),
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
          ),

          SizedBox(
            height: size.height / 30,
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

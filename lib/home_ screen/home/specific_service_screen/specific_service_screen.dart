import 'package:flutter/material.dart';
import 'package:laundry_app/const/const.dart';
import 'package:laundry_app/const/custom_app_bar.dart';
import 'package:laundry_app/home_%20screen/home/nearby_laundry.dart';

class SpecificServiceScreen extends StatelessWidget {
  final String categoryName;

  const SpecificServiceScreen({required this.categoryName, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      color: Colors.redAccent,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            height: size.height,
            width: size.width,
            child: Column(
              children: [
                //

                CustomAppBar(isbackButtonEnabled: true, title: categoryName),

                //

                Expanded(
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return NearbyLaundryList(
                        data: data[index],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

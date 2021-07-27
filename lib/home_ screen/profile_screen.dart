import 'package:flutter/material.dart';
import 'package:laundry_app/const/custom_app_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: size.width,
      child: Column(
        children: [
          // App Bar

          CustomAppBar(isbackButtonEnabled: false, title: "Profile"),

          //

          SizedBox(
            height: size.height / 20,
          ),

          Container(
            height: size.height / 5.5,
            width: size.height / 5.5,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromRGBO(4, 41, 250, 0.58),
            ),
            alignment: Alignment.center,
            child: Text(
              "U",
              style: TextStyle(
                color: Colors.white,
                fontSize: size.width / 5,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),

          SizedBox(
            height: size.height / 40,
          ),

          Container(
            height: size.height / 20,
            width: size.width,
            alignment: Alignment.center,
            child: Text(
              "Username",
              style: TextStyle(
                fontSize: size.width / 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          SizedBox(
            height: size.height / 20,
          ),

          header(size, "Name"),

          tile(size, "Username"),

          header(size, "Phone No."),

          tile(size, "9876543210"),

          // tile(size, "Name: Username"),
        ],
      ),
    );
  }

  Widget header(Size size, String title) {
    return Container(
      height: size.height / 40,
      width: size.width / 1.05,
      alignment: Alignment.bottomLeft,
      child: Text(
        title,
        style: TextStyle(
          fontSize: size.width / 26,
        ),
      ),
    );
  }

  Widget tile(Size size, String text, ) {
    return ListTile(
      onTap: () {},
      title: Text(
        text,
        style: TextStyle(
          fontSize: size.width / 22,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Icon(Icons.edit),
    );
  }
}

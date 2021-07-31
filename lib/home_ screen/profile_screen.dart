import 'package:flutter/material.dart';
import 'package:laundry_app/const/custom_app_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

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
                // App Bar

                Align(
                  alignment: Alignment.centerLeft,
                  child: BackButton(),
                ),

                //

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width / 22),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Username",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: size.width / 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: size.height / 8,
                        width: size.height / 8,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(4, 41, 250, 0.58),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "U",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: size.width / 10,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: size.height / 40,
                ),

                SizedBox(
                  height: size.height / 20,
                ),

                header(size, "Food Orders"),

                tile(size, "Your Orders", Icons.add_shopping_cart),

                tile(size, "Food Orders", Icons.add_comment),

                tile(size, "Adress Book", Icons.book),

                tile(size, "Online Order Help", Icons.help_center),

                // tile(size, "Name: Username"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget header(Size size, String title) {
    return Container(
      height: size.height / 25,
      width: size.width / 1.05,
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: TextStyle(
          fontSize: size.width / 23,
        ),
      ),
    );
  }

  Widget tile(Size size, String text, IconData icon) {
    return ListTile(
      onTap: () {},
      leading: Icon(icon),
      title: Text(
        text,
        style: TextStyle(
          fontSize: size.width / 22,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

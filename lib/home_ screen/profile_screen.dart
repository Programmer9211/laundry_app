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
                          child: RichText(
                            overflow: TextOverflow.ellipsis,
                            text: TextSpan(
                              text: "Username",
                              style: TextStyle(
                                fontSize: size.width / 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                              children: [
                                TextSpan(
                                  text: "\nemail@gmail.com",
                                  style: TextStyle(
                                    fontSize: size.width / 22,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
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

                Container(
                  height: size.height / 400,
                  width: size.width,
                  color: Colors.grey,
                ),

                Container(
                  height: size.height / 10,
                  child: Row(
                    children: [
                      tiles(size, "Noification", Icons.notifications_none),
                      tiles(size, "Settings", Icons.settings),
                      tiles(size, "Payments", Icons.payment),
                    ],
                  ),
                ),

                Container(
                  height: size.height / 400,
                  width: size.width,
                  color: Colors.grey,
                ),

                SizedBox(
                  height: size.height / 50,
                ),

                header(size, "Laundry Orders"),

                tile(size, "Your Orders", Icons.add_shopping_cart),

                tile(size, "Laundry Orders", Icons.add_comment),

                tile(size, "Adress Book", Icons.book),

                tile(size, "Online Order Help", Icons.help_center),

                header(size, "Options"),

                tile(size, "Rate Us", Icons.star),

                tile(size, "LogOut", Icons.logout),
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

  Widget tiles(Size size, String title, IconData icon) {
    return Expanded(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: size.width / 18,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: size.height / 200),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: size.width / 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

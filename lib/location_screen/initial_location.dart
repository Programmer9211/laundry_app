import 'package:flutter/material.dart';
import 'package:laundry_app/home_%20screen/home_screen.dart';

class InitialLocation extends StatelessWidget {
  const InitialLocation({Key? key}) : super(key: key);

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
                TopBoxForInitialLocation(
                  text: "Select\n Your Location",
                ),
                SizedBox(
                  height: size.height / 15,
                ),
                InkWell(
                  // onTap: () => showSearch(
                  //   context: context,
                  //   delegate: LocationSearch(),
                  // ),
                  child: Container(
                    height: size.height / 20,
                    width: size.width / 1.2,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color.fromRGBO(30, 62, 160, 1),
                          width: 2,
                        ),
                      ),
                    ),
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "Enter Your Location",
                      style: TextStyle(
                        fontSize: size.width / 22,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height / 20,
                ),
                Container(
                  height: size.height / 20,
                  width: size.width,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: size.height / 400,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        "OR",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: size.width / 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: size.height / 400,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height / 20,
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => HomeScreen(),
                    ),
                  ),
                  // onTap: () async {

                  // },
                  child: Container(
                    height: size.height / 14,
                    width: size.width / 1.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 2,
                        color: Colors.redAccent,
                      ),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: size.width / 20,
                        ),
                        Icon(
                          Icons.location_searching,
                          size: size.width / 17,
                        ),
                        SizedBox(
                          width: size.width / 20,
                        ),
                        Text(
                          "Use Current Location",
                          style: TextStyle(
                            fontSize: size.width / 23,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
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

class TopBoxForInitialLocation extends StatelessWidget {
  final String text;

  const TopBoxForInitialLocation({required this.text, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        height: size.height / 4.2,
        width: size.width / 1.15,
        decoration: BoxDecoration(
          color: Color.fromRGBO(230, 233, 250, 1),
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20),
          ),
        ),
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            SizedBox(
              width: size.width / 25,
            ),
            Container(
              height: size.height / 4.2,
              width: size.width / 1.5,
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.arrow_back,
                    size: size.width / 10,
                  ),
                  SizedBox(
                    height: size.height / 50,
                  ),
                  Text(
                    "\t$text",
                    style: TextStyle(
                      fontSize: size.width / 12,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

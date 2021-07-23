import 'package:flutter/material.dart';
import 'package:share/share.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final bool isbackButtonEnabled;

  const CustomAppBar(
      {required this.isbackButtonEnabled, required this.title, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height / 11,
      width: size.width,
      color: Color.fromRGBO(4, 41, 250, 0.58),
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          isbackButtonEnabled
              ? IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: size.width / 15,
                  ),
                )
              : SizedBox(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal:
                      isbackButtonEnabled ? size.width / 40 : size.width / 30),
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  letterSpacing: 1.1,
                  color: Colors.white,
                  fontSize: size.width / 16,
                ),
              ),
            ),
          ),
          isbackButtonEnabled
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width / 50),
                  child: IconButton(
                    onPressed: () {
                      Share.share("Laundry Name\nPhone No. 9876543210");
                    },
                    icon: Icon(
                      Icons.share,
                      color: Colors.white,
                      size: size.width / 15,
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}

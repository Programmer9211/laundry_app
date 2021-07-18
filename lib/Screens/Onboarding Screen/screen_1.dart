import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  final String imageUrl, title, content;

  Screen1(
      {required this.imageUrl,
      required this.title,
      required this.content,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: size.width,
      child: Column(
        children: [
          SizedBox(
            height: size.height / 10,
          ),
          Container(
            height: size.height / 3,
            width: size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imageUrl),
              ),
            ),
          ),
          SizedBox(
            height: size.height / 20,
          ),
          Container(
            width: size.width,
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: size.width / 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            height: size.height / 40,
          ),
          Container(
            width: size.width / 1.2,
            child: Text(
              content,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: size.width / 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

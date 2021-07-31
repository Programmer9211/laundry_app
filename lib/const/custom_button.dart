import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final BorderRadius? radius;
  final Function function;
  final double width;
  final Color color;

  CustomButton(
      {required this.text,
      this.radius,
      required this.color,
      required this.function,
      required this.width,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () => function(),
      child: Material(
        elevation: 5,
        color: color,
        borderRadius: radius ?? BorderRadius.circular(18),
        child: Container(
          height: size.height / 17,
          width: size.width / width,
          decoration: BoxDecoration(),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: size.width / 23,
              //fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

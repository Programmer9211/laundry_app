import 'package:flutter/material.dart';

class GatewayBoxes extends StatelessWidget {
  final Function function;
  final String text, imageUrl;
  const GatewayBoxes(
      {required this.function,
      required this.text,
      Key? key,
      required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return InkWell(
      onTap: () => function(),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 5,
        child: Container(
          height: size.height / 12,
          width: size.width / 1.1,
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: Colors.redAccent,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Icon(
                  Icons.payment,
                  size: size.width / 14,
                  color: Colors.black,
                ),
              ),
              Text(
                text,
                style: TextStyle(
                  fontSize: size.width / 17,
                  fontWeight: FontWeight.w500,
                  color: Colors.redAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

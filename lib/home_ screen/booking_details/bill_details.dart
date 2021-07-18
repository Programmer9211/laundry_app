import 'package:flutter/material.dart';

class BillDetailsBox extends StatelessWidget {
  const BillDetailsBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: size.height / 50,
        horizontal: size.width / 50,
      ),
      width: size.width / 1.05,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        //color: colorList[0],
      ),
      child: RichText(
        text: TextSpan(
          text: "Category Name\n\n",
          style: TextStyle(
            fontSize: size.width / 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          children: <TextSpan>[
            TextSpan(
              text:
                  "GST(%) :-\nOther Tax :-\nService Charge :-\nTotal Amount :-",
              style: TextStyle(
                fontSize: size.width / 24,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:laundry_app/home_%20screen/home/laundry_details/launndry_details.dart';

class NearbyLaundryList extends StatelessWidget {
  const NearbyLaundryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: size.height / 100,
        horizontal: size.width / 50,
      ),
      child: InkWell(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => LaundryDetails(),
          ),
        ),
        child: Material(
          elevation: 5,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: size.height / 8,
            width: size.width / 1.1,
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    right: size.width / 50,
                  ),
                  child: Container(
                    height: size.height / 7,
                    width: size.width / 3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                      color: Color.fromRGBO(4, 41, 250, 0.58),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Image",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: size.width / 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: size.height / 8.5,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          text: TextSpan(
                            text: "Laundry Name\n",
                            style: TextStyle(
                              fontSize: size.width / 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text:
                                    "Gali No. 12, Locality : Near Something , LaxmiNagar, Sec 78, New Delhi",
                                style: TextStyle(
                                  fontSize: size.width / 28,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ),
                            Text(
                              "4.2",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: size.width / 28,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
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

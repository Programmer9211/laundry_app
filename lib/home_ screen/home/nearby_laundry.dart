import 'package:flutter/material.dart';
import 'package:laundry_app/const/const.dart';
import 'package:laundry_app/home_%20screen/home/laundry_details/launndry_details.dart';

class NearbyLaundryList extends StatelessWidget {
  final LaundryItemsData data;

  const NearbyLaundryList({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: size.height / 100,
        horizontal: size.width / 22,
      ),
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => LaundryDetails(),
          ),
        ),
        child: Material(
          elevation: 3,
          borderRadius: BorderRadius.circular(18),
          child: Container(
            height: size.height / 2.6,
            width: size.width / 1.1,
            child: Column(
              children: [
                Container(
                  height: size.height / 4,
                  width: size.width / 1.1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18),
                      topRight: Radius.circular(18),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(
                        data.imageUrl,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  height: size.height / 15,
                  width: size.width / 1.2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          child: Text(
                            data.name,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: size.width / 19,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: size.height / 25,
                        width: size.width / 7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          data.ratings,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: size.width / 1.2,
                  child: Text(
                    data.location,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: size.width / 25,
                      fontWeight: FontWeight.w500,
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

class NearbyLaundryList1 extends StatelessWidget {
  const NearbyLaundryList1({Key? key}) : super(key: key);

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
                  padding: EdgeInsets.symmetric(
                    vertical: size.height / 500,
                    horizontal: size.width / 30,
                  ),
                  child: Container(
                    height: size.height / 7,
                    width: size.width / 5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
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
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width / 30),
                  child: Icon(
                    Icons.arrow_forward,
                    size: size.width / 17,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

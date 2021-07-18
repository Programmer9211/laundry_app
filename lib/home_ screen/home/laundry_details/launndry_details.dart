import 'package:flutter/material.dart';
import 'package:laundry_app/const/custom_app_bar.dart';
import 'package:laundry_app/home_%20screen/home/laundry_details/laundry_item.dart';

class LaundryDetails extends StatefulWidget {
  const LaundryDetails({Key? key}) : super(key: key);

  @override
  _LaundryDetailsState createState() => _LaundryDetailsState();
}

class _LaundryDetailsState extends State<LaundryDetails> {
  int currentIndex = 0;

  List<bool> _isEnabled = [
    true,
    false,
    false,
    false,
  ];

  List<bool> isSelected = [
    true,
    false,
    false,
    false,
  ];

  bool _ishidden = true;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            child:
                CustomAppBar(isbackButtonEnabled: true, title: "Laundry Name"),
            preferredSize: size),
        body: Container(
          height: size.height,
          width: size.width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //

                //Banner View...

                Container(
                  height: size.height / 4,
                  width: size.width,
                  child: PageView.builder(
                    onPageChanged: (val) {
                      _isEnabled[currentIndex] = false;
                      currentIndex = val;
                      _isEnabled[val] = true;
                      setState(() {});
                    },
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width / 35,
                          vertical: size.width / 45,
                        ),
                        child: Material(
                          elevation: 5,
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: size.height / 4,
                            width: size.width / 1.1,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/3.png"),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                //Build Indicator...

                Container(
                  height: size.height / 25,
                  width: size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i = 0; i < 4; i++)
                        indicator(size, _isEnabled[i]),
                    ],
                  ),
                ),

                //

                Container(
                  height: size.height / 11,
                  width: size.width / 1.1,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Laundry Name",
                    style: TextStyle(
                      fontSize: size.width / 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                // Show or hide details...

                InkWell(
                  onTap: () {
                    setState(() {
                      _ishidden = !_ishidden;
                    });
                  },
                  child: Container(
                    height: size.height / 15,
                    width: size.width / 1.1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          _ishidden ? "View Details" : "Hide Details",
                          style: TextStyle(
                            fontSize: size.width / 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          size: size.width / 15,
                        ),
                      ],
                    ),
                  ),
                ),

                // Description

                _ishidden ? SizedBox() : Details(),

                //

                SizedBox(
                  height: size.height / 30,
                ),

                Container(
                  height: size.height / 40,
                  width: size.width / 1.1,
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Items Avalible",
                    style: TextStyle(
                      fontSize: size.width / 20,
                    ),
                  ),
                ),

                // Items List...

                //Tab Bar View...

                Padding(
                  padding: EdgeInsets.symmetric(vertical: size.height / 50),
                  child: Container(
                    height: size.height / 16,
                    width: size.width,
                    // decoration: BoxDecoration(
                    //   //borderRadius: BorderRadius.circular(15),
                    //   color: Color.fromRGBO(4, 41, 250, 0.58),
                    // ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        button(size, "Men", isSelected[0], 0),
                        button(size, "Women", isSelected[1], 1),
                        button(size, "Others", isSelected[2], 2),
                        button(size, "Reviews", isSelected[3], 3),
                      ],
                    ),
                  ),
                ),

                Flexible(
                  child: Builder(
                    builder: (context) {
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 20,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return LaundryItem();
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget indicator(Size size, bool isSelected) {
    return Padding(
      padding: EdgeInsets.all(1.5),
      child: Container(
        height: isSelected ? size.height / 85 : size.height / 110,
        width: isSelected ? size.height / 85 : size.height / 110,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget button(Size size, String text, bool isSelect, int index) {
    return Expanded(
      flex: isSelected[index] ? 1 : 1,
      child: InkWell(
        onTap: () {
          for (int i = 0; i < 4; i++) {
            isSelected[i] = false;
          }
          isSelected[index] = true;
          setState(() {});
        },
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: size.height / 100,
            horizontal: size.width / 50,
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: isSelected[index]
                  ? Color.fromRGBO(4, 41, 250, 0.58)
                  : Colors.white,
            ),
            alignment: Alignment.center,
            child: Text(
              text,
              style: TextStyle(
                  color: isSelect
                      ? Colors.white
                      : Color.fromRGBO(4, 41, 250, 0.58),
                  fontSize: size.width / 25,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}

class Details extends StatelessWidget {
  const Details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          width: size.width / 1.1,
          alignment: Alignment.centerLeft,
          child: Text(
            "We are professionals in the laundry and dry cleaning business, cleaning methods, and solutions for dealing with stains or delicate fabrics. \n",
            style: TextStyle(
              fontSize: size.width / 22,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),

        //Contact no.

        Container(
          height: size.height / 40,
          width: size.width / 1.1,
          alignment: Alignment.bottomLeft,
          child: Text(
            "Phone No",
            style: TextStyle(
              fontSize: size.width / 22,
            ),
          ),
        ),

        Container(
          width: size.width / 1.1,
          alignment: Alignment.centerLeft,
          child: Text(
            "9876543210\n",
            style: TextStyle(
              fontSize: size.width / 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),

        // Address

        Container(
          height: size.height / 40,
          width: size.width / 1.1,
          alignment: Alignment.bottomLeft,
          child: Text(
            "Address",
            style: TextStyle(
              fontSize: size.width / 20,
            ),
          ),
        ),

        Container(
          width: size.width / 1.1,
          alignment: Alignment.centerLeft,
          child: Text(
            "Gali No. 12, Locality : Near Something , LaxmiNagar, Sec 78, New Delhi",
            style: TextStyle(
              fontSize: size.width / 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

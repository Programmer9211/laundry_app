import 'package:flutter/material.dart';

class LaundryItem extends StatelessWidget {
  final Function add, sub;

  const LaundryItem({required this.add, required this.sub, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height / 8,
      width: size.width,
      alignment: Alignment.bottomCenter,
      child: Material(
        elevation: 3,
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          height: size.height / 9,
          width: size.width / 1.05,
          child: Row(
            children: [
              SizedBox(
                width: size.width / 40,
              ),
              Container(
                height: size.height / 10.2,
                width: size.width / 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.redAccent,
                ),
                alignment: Alignment.center,
                child: Text(
                  "Image",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: size.width / 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                width: size.width / 30,
              ),
              Expanded(
                child: Container(
                  alignment: Alignment(-1, -0.85),
                  child: Text(
                    "Item Name",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: size.width / 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width / 60),
                child: Column(
                  children: [
                    SizedBox(
                      height: size.width / 50,
                    ),
                    // isAdded ?
                    Container(
                      height: size.height / 20,
                      width: size.width / 4.8,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () => sub(),
                            child: Container(
                              height: size.height / 30,
                              width: size.height / 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.redAccent,
                              ),
                              alignment: Alignment.topCenter,
                              child: Text(
                                "__",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: size.width / 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child: Text(
                              "1",
                              style: TextStyle(
                                fontSize: size.width / 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => add(),
                            child: Container(
                              height: size.height / 30,
                              width: size.height / 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.redAccent,
                              ),
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: size.width / 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // : Container(
                    //     height: size.height / 20,
                    //     width: size.width / 4.8,
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(8),
                    //       gradient: LinearGradient(
                    //         colors: [
                    //           Color.fromRGBO(57, 193, 169, 1),
                    //           Color.fromRGBO(21, 158, 130, 1)
                    //         ],
                    //       ),
                    //     ),
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       children: [
                    //         Icon(
                    //           Icons.add,
                    //           color: Colors.white,
                    //           size: size.width / 20,
                    //         ),
                    //         SizedBox(
                    //           width: size.width / 100,
                    //         ),
                    //         Text(
                    //           "Add",
                    //           style: TextStyle(
                    //             color: Colors.white,
                    //             fontWeight: FontWeight.w500,
                    //           ),
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    SizedBox(
                      height: size.width / 40,
                    ),
                    Text(
                      "Rs. 500",
                      style: TextStyle(
                        fontSize: size.width / 26,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:laundry_app/home_%20screen/home/specific_service_screen/specific_service_screen.dart';

class AvalibleServicesItems extends StatelessWidget {
  final AvalibleServicesItemsData data;
  const AvalibleServicesItems({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.width / 70,
        vertical: size.height / 400,
      ),
      child: InkWell(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => SpecificServiceScreen(categoryName: data.text),
          ),
        ),
        child: Container(
          height: size.height / 4.6,
          width: size.width / 2.5,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: size.height / 100,
                  horizontal: size.width / 50,
                ),
                child: Container(
                  height: size.height / 8,
                  width: size.width / 3,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(4, 41, 250, 0.58),
                    shape: BoxShape.circle,
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
                  width: size.width / 3,
                  alignment: Alignment.topCenter,
                  child: Text(
                    data.text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: size.width / 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AvalibleServicesItemsData {
  final String text, imageUrl;

  AvalibleServicesItemsData({required this.text, required this.imageUrl});
}

import 'package:flutter/material.dart';
import 'package:laundry_app/const/custom_button.dart';
import 'package:laundry_app/home_%20screen/booking_details/booking_details.dart';

class ScheduleBookingScreen extends StatefulWidget {
  const ScheduleBookingScreen({Key? key}) : super(key: key);

  @override
  _ScheduleBookingScreenState createState() => _ScheduleBookingScreenState();
}

class _ScheduleBookingScreenState extends State<ScheduleBookingScreen> {
  void showCalender() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2030),
    );
    if (date != null) {
      showTimer();
    }
  }

  void showTimer() async {
    await showTimePicker(context: context, initialTime: TimeOfDay.now());
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Container(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              Container(
                height: size.height / 11,
                width: size.width,
                color: Color.fromRGBO(4, 41, 250, 0.58),
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height / 80,
                    ),
                    Container(
                      height: size.height / 20,
                      width: size.width / 1.1,
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_back,
                            size: size.width / 16,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: size.width / 30,
                          ),
                          Text(
                            "App Name",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: size.width / 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Sized Box...

              SizedBox(
                height: size.height / 10,
              ),

              // Line...

              Container(
                height: size.height / 20,
                width: size.width / 1.07,
                child: Row(
                  children: [
                    Text(
                      "Book a Slot",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: size.width / 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: size.width / 60),
                      child: Container(
                        height: size.height / 400,
                        width: size.width / 1.6,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),

              // Sized Box...

              SizedBox(
                height: size.height / 20,
              ),

              // Schedule Button...

              InkWell(
                onTap: () => showCalender(),
                child: Center(
                  child: Container(
                    height: size.height / 10,
                    width: size.width / 1.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 2,
                        color: Color.fromRGBO(4, 41, 250, 0.58),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Schedule Time For Booking",
                      style: TextStyle(
                        fontSize: size.width / 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(
                height: size.height / 8,
              ),

              // Confitmation Button...

              CustomButton(
                text: "Confirm",
                color: Color.fromRGBO(4, 41, 250, 0.58),
                function: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => BookingDetails()),
                ),
                width: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

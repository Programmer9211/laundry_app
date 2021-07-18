import 'package:flutter/material.dart';
import 'package:laundry_app/const/custom_button.dart';
import 'package:laundry_app/location_screen/initial_location.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPVerification extends StatelessWidget {
  final int opt;
  const OTPVerification({required this.opt, Key? key}) : super(key: key);

  static const String _verify = "Verify your\n Phone Number\n";
  static const String _details =
      "Enter the OTP that you have\nrecieved through SMS";

  static final TextEditingController _controller = TextEditingController();

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
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  height: size.height / 7,
                  width: size.width / 3,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(230, 233, 250, 1),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(1000),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.arrow_back,
                      size: size.width / 12,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height / 20,
              ),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: _verify,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: size.width / 12,
                  ),
                  children: [
                    TextSpan(
                      text: _details,
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: size.width / 22,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height / 15,
              ),
              Container(
                height: size.height / 18,
                width: size.width / 1.2,
                child: PinCodeTextField(
                  appContext: context,
                  controller: _controller,
                  length: 4,
                  onChanged: (String value) {},
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.circle,
                    fieldHeight: size.height / 18,
                    fieldWidth: size.width / 5,
                    activeFillColor: Colors.blue.shade100,
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(
                height: size.height / 10,
              ),
              CustomButton(
                text: "Submit",
                function: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => InitialLocation(),
                )),
                width: 2.5,
                color: Color.fromRGBO(192, 88, 63, 1),
              )
            ],
          ),
        ),
      ),
    );
  }
}

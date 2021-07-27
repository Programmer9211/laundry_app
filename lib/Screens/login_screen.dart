import 'package:flutter/material.dart';
import 'package:laundry_app/Screens/otp_verification_screen.dart';
import 'package:laundry_app/const/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      color: Colors.blue,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            height: size.height,
            width: size.width,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height / 16,
                  ),
                  Container(
                    width: size.width / 1.1,
                    child: Text(
                      "Login Account",
                      style: TextStyle(
                        fontSize: size.width / 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height / 140,
                  ),
                  Container(
                    width: size.width / 1.1,
                    child: Text(
                      "Hello, Welcome back to out account",
                      style: TextStyle(
                        fontSize: size.width / 24,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height / 12,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: size.width / 1.1,
                      child: Text(
                        "Phone Number",
                        style: TextStyle(
                          fontSize: size.width / 25,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: size.height / 16,
                    width: size.width / 1.1,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        hintText: "Phone Number",
                        suffixIcon: Icon(
                          Icons.verified,
                          color: Colors.green,
                        ),
                        prefixIcon: Icon(Icons.countertops),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height / 20,
                  ),
                  CustomButton(
                    text: "Request OTP",
                    color: Color.fromRGBO(192, 88, 63, 1),
                    function: () =>
                        Navigator.of(context).push(MaterialPageRoute(
                      builder: (_) => OTPVerification(opt: 50),
                    )),
                    width: 1.1,
                  ),
                  SizedBox(
                    height: size.height / 12,
                  ),
                  orSignInWithGoogle(size),
                  SizedBox(
                    height: size.height / 18,
                  ),
                  CustomButton(
                    text: "Google",
                    color: Color.fromRGBO(135, 165, 167, 1),
                    function: () {},
                    width: 1.1,
                  ),
                  SizedBox(
                    height: size.height / 18,
                  ),
                  Container(
                    width: size.width / 1.1,
                    child: RichText(
                      text: TextSpan(
                        text: "Not Registered Yet? ",
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: size.width / 24,
                          fontWeight: FontWeight.w500,
                        ),
                        children: [
                          TextSpan(
                            text: "Create an account.",
                            style: TextStyle(
                              color: Color.fromRGBO(192, 88, 63, 1),
                              fontSize: size.width / 24,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget orSignInWithGoogle(Size size) {
    return Container(
      height: size.height / 20,
      width: size.width / 1.1,
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: size.height / 700,
              color: Colors.grey[500],
            ),
          ),
          Text(
            "   or Sign in with Google   ",
            style: TextStyle(fontSize: size.width / 32),
          ),
          Expanded(
            child: Container(
              height: size.height / 700,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }
}

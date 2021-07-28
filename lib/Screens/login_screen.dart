import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:laundry_app/Screens/otp_verification_screen.dart';
// import 'package:laundry_app/Screens/otp_verification_screen.dart';
// import 'package:laundry_app/const/custom_button.dart';
import 'package:laundry_app/home_%20screen/home_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  CountryCode? _code;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color.fromRGBO(226, 56, 70, 1),
              Color.fromRGBO(217, 39, 79, 1),
            ],
          )),
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => HomeScreen(),
                    ),
                  ),
                  child: Container(
                    height: size.height / 3,
                    width: size.width,
                    decoration: BoxDecoration(
                        // image: DecorationImage(
                        //     image: AssetImage("assets/log.png"), fit: BoxFit.cover),
                        ),
                  ),
                ),
                SizedBox(
                  height: size.height / 40,
                ),
                field(size),
                SizedBox(
                  height: size.height / 40,
                ),
                InkWell(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => OTPVerification(opt: 10),
                    ),
                  ),
                  child: Container(
                    height: size.height / 14,
                    width: size.width / 1.12,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Send OTP",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: size.height / 8,
                  width: size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 1,
                        width: size.width / 3,
                        color: Color.fromRGBO(239, 79, 95, 1),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "OR",
                          style:
                              TextStyle(color: Color.fromRGBO(239, 79, 95, 1)),
                        ),
                      ),
                      Container(
                        height: 1,
                        width: size.width / 3,
                        color: Color.fromRGBO(239, 79, 95, 1),
                      ),
                    ],
                  ),
                ),
                loginWithEmailButton(size),
                SizedBox(
                  height: size.height / 30,
                ),
                Container(
                  height: size.height / 15,
                  width: size.width / 1.12,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      customButton(size, "Facebook", "assets/facebook.png"),
                      customButton(size, "Google", "assets/google.png"),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height / 25,
                ),
                Text(
                  "By continuing, you agree to our",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    "Term of Services Privacy Policy Content Policy",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget customButton(Size size, String title, String path) {
    return Container(
      height: size.height / 14,
      width: size.width / 2.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: size.height / 25,
            width: size.height / 25,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(path),
              fit: BoxFit.cover,
            )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget loginWithEmailButton(Size size) {
    return Container(
      height: size.height / 14,
      width: size.width / 1.12,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        children: [
          SizedBox(
            width: size.width / 14,
          ),
          Container(
            height: size.height / 25,
            width: size.width / 15,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/email.png"),
              fit: BoxFit.cover,
            )),
          ),
          SizedBox(
            width: size.width / 8,
          ),
          Text(
            "Continue with Email",
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }

  Widget field(Size size) {
    return Container(
      height: size.height / 15,
      width: size.width / 1.12,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Flexible(
            flex: 1,
            child: CountryCodePicker(
              initialSelection: "+91",
              onInit: (code) {
                _code = code;
              },
              onChanged: (code) {
                _code = code;
                setState(() {});
              },
            ),
          ),
          Expanded(
            flex: 2,
            child: TextField(
              //controller: _controller,
              maxLength: 10,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Phone Number",
                counterText: "",
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({Key? key}) : super(key: key);

//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   @override
//   Widget build(BuildContext context) {
//     final Size size = MediaQuery.of(context).size;

//     return Container(
//       color: Colors.blue,
//       child: SafeArea(
//         child: Scaffold(
//           body: Container(
//             height: size.height,
//             width: size.width,
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: size.height / 16,
//                   ),
//                   Container(
//                     width: size.width / 1.1,
//                     child: Text(
//                       "Login Account",
//                       style: TextStyle(
//                         fontSize: size.width / 17,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: size.height / 140,
//                   ),
//                   Container(
//                     width: size.width / 1.1,
//                     child: Text(
//                       "Hello, Welcome back to out account",
//                       style: TextStyle(
//                         fontSize: size.width / 24,
//                         fontWeight: FontWeight.w500,
//                         color: Colors.grey,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: size.height / 12,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Container(
//                       width: size.width / 1.1,
//                       child: Text(
//                         "Phone Number",
//                         style: TextStyle(
//                           fontSize: size.width / 25,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Container(
//                     height: size.height / 16,
//                     width: size.width / 1.1,
//                     child: TextField(
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(25),
//                         ),
//                         hintText: "Phone Number",
//                         suffixIcon: Icon(
//                           Icons.verified,
//                           color: Colors.green,
//                         ),
//                         prefixIcon: Icon(Icons.countertops),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: size.height / 20,
//                   ),
//                   CustomButton(
//                     text: "Request OTP",
//                     color: Color.fromRGBO(192, 88, 63, 1),
//                     function: () =>
//                         Navigator.of(context).push(MaterialPageRoute(
//                       builder: (_) => OTPVerification(opt: 50),
//                     )),
//                     width: 1.1,
//                   ),
//                   SizedBox(
//                     height: size.height / 12,
//                   ),
//                   orSignInWithGoogle(size),
//                   SizedBox(
//                     height: size.height / 18,
//                   ),
//                   CustomButton(
//                     text: "Google",
//                     color: Color.fromRGBO(135, 165, 167, 1),
//                     function: () {},
//                     width: 1.1,
//                   ),
//                   SizedBox(
//                     height: size.height / 18,
//                   ),
//                   Container(
//                     width: size.width / 1.1,
//                     child: RichText(
//                       text: TextSpan(
//                         text: "Not Registered Yet? ",
//                         style: TextStyle(
//                           color: Colors.grey[700],
//                           fontSize: size.width / 24,
//                           fontWeight: FontWeight.w500,
//                         ),
//                         children: [
//                           TextSpan(
//                             text: "Create an account.",
//                             style: TextStyle(
//                               color: Color.fromRGBO(192, 88, 63, 1),
//                               fontSize: size.width / 24,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget orSignInWithGoogle(Size size) {
//     return Container(
//       height: size.height / 20,
//       width: size.width / 1.1,
//       child: Row(
//         children: [
//           Expanded(
//             child: Container(
//               height: size.height / 700,
//               color: Colors.grey[500],
//             ),
//           ),
//           Text(
//             "   or Sign in with Google   ",
//             style: TextStyle(fontSize: size.width / 32),
//           ),
//           Expanded(
//             child: Container(
//               height: size.height / 700,
//               color: Colors.grey[500],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

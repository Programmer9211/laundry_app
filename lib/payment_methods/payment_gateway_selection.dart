import 'package:flutter/material.dart';
import 'package:laundry_app/home_%20screen/home_screen.dart';
import 'package:laundry_app/location_screen/initial_location.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import 'showing_gateways.dart';

class PaymentGatewaySelection extends StatefulWidget {
  const PaymentGatewaySelection({Key? key}) : super(key: key);

  @override
  _PaymentGatewaySelectionState createState() =>
      _PaymentGatewaySelectionState();
}

class _PaymentGatewaySelectionState extends State<PaymentGatewaySelection> {
  late Razorpay _razorpay;

  void openRazorPayPortal(int amount) {
    Map<String, dynamic> options = {
      'key': "rzp_test_hF79eXQ3gTIzol",
      'amount': amount * 100,
      'name': 'Sughandha Dc',
      'description': 'Fine T-Shirt',
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'}
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print("Payment Sucessfull +_______________+");

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => HomeScreen(),
      ),
    );
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    print("Payment Failed");
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    print("Payment Failed");
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
              TopBoxForInitialLocation(text: "Select a\n Payment Method"),

              //Sized Box For Gap...

              SizedBox(
                height: size.height / 15,
              ),

              //

              GatewayBoxes(
                text: "Cash Payment",
                imageUrl: "",
                function: () {},
              ),

              //

              SizedBox(
                height: size.height / 20,
              ),

              //

              GatewayBoxes(
                text: "Razor Pay",
                imageUrl: "",
                function: () {
                  openRazorPayPortal(500);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _razorpay.clear();
    super.dispose();
  }
}

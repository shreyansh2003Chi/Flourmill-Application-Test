import 'package:flourmill_testing/UIComponents/CustomButton.dart';
import 'package:flourmill_testing/pages/OTPVerification.dart';
import 'package:flutter/material.dart';
import 'package:flourmill_testing/UIComponents/CustomTextField.dart';

void main() {
  runApp(PhoneVerification());
}

class PhoneVerification extends StatelessWidget {
  TextEditingController phoneController = TextEditingController();

  PhoneVerification({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text('Phone Verification'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30.0, 80, 30.0, 5.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 150,
                  width: 150,
                  child: Image(
                    image: AssetImage('assets/phoneverification.png'),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Enter the Mobile Number',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 10),
                const Text(
                  'We will send you a verification code',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 40),
                CustomTextField(
                  label: "Phone Number",
                  hintText: "Enter Phone Number",
                  controller: phoneController,
                  prefixIcon: Icons.phone,
                  isPassword: false,
                ),
                const SizedBox(height: 20),
                CustomButton(
                    label: "Send OTP",
                    icon: Icons.send,
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OTPVerification()));
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../UIComponents/CustomButton.dart';

void main() {
  runApp(const OTPVerification());
}

class OTPVerification extends StatelessWidget {
  const OTPVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Verify Your OTP Here'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 250.0, 30.0, 0.0),
          child: Form(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomOTPTextField(),
                CustomOTPTextField(),
                CustomOTPTextField(),
                CustomOTPTextField(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomOTPTextField extends StatefulWidget {
  @override
  _CustomOTPTextFieldState createState() => _CustomOTPTextFieldState();
}

class _CustomOTPTextFieldState extends State<CustomOTPTextField> {
  final FocusNode _focusNode = FocusNode();
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.text.isEmpty) {
        _focusNode.previousFocus();
      } else if (_controller.text.length == 1) {
        _focusNode.nextFocus();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 68,
      height: 64,
      child: TextFormField(
        controller: _controller,
        focusNode: _focusNode,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline6,
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }
}

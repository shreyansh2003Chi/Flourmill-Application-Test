// import 'package:flutter/material.dart';
// import 'package:flourmill_testing/UIComponents/CustomTextField.dart';

// void main() {
//   runApp(PhoneVerification());
// }

// class PhoneVerification extends StatelessWidget {
//   static const TextEditingController phoneController =TextEditingController();

//   const PhoneVerification({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: Scaffold(
//           appBar: AppBar(
//             leading: IconButton(
//               icon: const Icon(Icons.arrow_back),
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//             ),
//             title: const Text('Phone Verification'),
//           ),
//           body: const Center(
//               child: Padding(
//             padding: EdgeInsets.fromLTRB(30.0, 90, 30.0, 5.0),
//             child: Column(
//               children: [
//                 SizedBox(
//                     height: 150,
//                     width: 150,
//                     child: Image(
//                         image: AssetImage('assets/phoneverification.png'))),
//                 SizedBox(height: 20),
//                 Text(
//                   'Enter the Mobile Number',
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(width: 10),
//                 Text(
//                   'We will send you a verification code',
//                   style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 20),
//                 CustomTextField(
//                   label: "Password",
//                   hintText: "Enter Password",
//                   controller: phoneController,
//                   prefixIcon: Icons.phone,
//                   isPassword: false,
//                 ),
//                 // Row(
//                 //   children: [
//                 //     SizedBox(
//                 //         height: 50,
//                 //         width: 50,
//                 //         child: TextField(
//                 //           decoration: InputDecoration(
//                 //             prefix: Container(
//                 //               width: 50, // Adjusted width to make it square
//                 //               alignment: Alignment.center,
//                 //               child: const Text('+92'),
//                 //             ),
//                 //             border: const OutlineInputBorder(
//                 //                 borderRadius: BorderRadius.all(Radius.circular(10))
//                 //             ),
//                 //           ),
//                 //         ),
//                 //       ),
//                 //
//                 //
//                 //   ],
//                 // ),
//               ],
//             ),
//           )),
//         ));
//   }
// }
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

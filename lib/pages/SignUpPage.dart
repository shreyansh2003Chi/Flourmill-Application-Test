import 'package:flourmill_testing/pages/successfull_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flourmill_testing/pages/honmepage.dart';
import 'package:flourmill_testing/UIComponents/CustomButton.dart';
import 'package:flourmill_testing/UIComponents/CustomTextField.dart';
import 'package:flourmill_testing/UIComponents/CustomToast.dart';
import 'package:flourmill_testing/pages/LoginPage.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String dynamicURL = "";
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _companyEmailController = TextEditingController();
  final TextEditingController _companyPasswordController =
      TextEditingController();
  final TextEditingController _companyNameController = TextEditingController();

  int _selectedTabIndex = 0;
  final List<String> _tabTitles = ['Customer', 'Provider'];

  final bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Sign Up',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 60.0, 15.0, 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage('assets/profile_image.jpg'),
                ),
                const SizedBox(height: 40),
                DefaultTabController(
                  length: _tabTitles.length,
                  initialIndex: _selectedTabIndex,
                  child: Column(
                    children: [
                      TabBar(
                        onTap: (index) {
                          setState(() {
                            _selectedTabIndex = index;
                          });
                        },
                        tabs: _tabTitles
                            .map((title) => Tab(text: title))
                            .toList(),
                        indicatorColor: Colors.blue,
                        labelColor: Colors.blue,
                        unselectedLabelColor: Colors.black,
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      SizedBox(
                        height: 240.0,
                        child: TabBarView(
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            buildCustomerFields(),
                            buildProviderFields(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomButton(
                    label: 'Sign Up',
                    icon: Icons.check,
                    onPressed: () {
                      _handleSignUp(context);
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?'),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
                      child: const Text('Login'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCustomerFields() {
    return SizedBox(
      height: 300,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(
              label: 'Email',
              hintText: 'Enter your email',
              controller: _emailController,
              prefixIcon: Icons.mail,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextField(
              label: 'Password',
              hintText: 'Enter a strong password',
              controller: _passwordController,
              prefixIcon: Icons.lock,
              isPassword: true,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomTextField(
                    label: 'Name',
                    hintText: 'Enter your name',
                    controller: _nameController,
                    prefixIcon: Icons.person,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildProviderFields() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomTextField(
            label: 'Provider Email',
            hintText: 'Enter Provider Email',
            controller: _companyEmailController,
            prefixIcon: Icons.mail,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomTextField(
            label: 'Provider Password',
            hintText: 'Enter Provider password',
            controller: _companyPasswordController,
            prefixIcon: Icons.lock,
            isPassword: true,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextField(
                  label: 'Provider Name',
                  hintText: 'Enter Provider name',
                  controller: _companyNameController,
                  prefixIcon: Icons.business,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _handleSignUp(BuildContext context) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(
          color: Colors.blueAccent,
          strokeWidth: 2,
        ),
      ),
    );

    final String email;
    final String password;
    final String name;
    if (_selectedTabIndex == 0) {
      dynamicURL =
          "https://zany-jade-wombat-wrap.cyclic.app/customers/signupcustomer";
      email = _emailController.text;
      password = _passwordController.text;
      name = _nameController.text;
    } else {
      dynamicURL =
          "https://zany-jade-wombat-wrap.cyclic.app/providers/signupprovider";
      email = _companyEmailController.text;
      password = _companyPasswordController.text;
      name = _companyNameController.text;
    }

    if (email.isEmpty || password.isEmpty || name.isEmpty) {
      Navigator.pop(context); // Dismiss the dialog
      return;
    }
    final success = await signUp(context, email, password, name);
    if (success) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const AnimatedAcknowledge(),
        ),
      );
    } else {
      Navigator.pop(context); // Dismiss the dialog
    }
  }

  Future<bool> signUp(
      BuildContext context, String email, String password, String name) async {
    String apiUrl = dynamicURL;

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email, 'password': password, 'name': name}),
      );

      if (response.statusCode == 200) {
        showCustomToast(context, "Successfully Signed Up");
        print('Signup successful!');
        // print('Response: ${response.body}');
        return true;
      } else {
        showCustomToast(context, "Failed to Signed Up !!!");
        print('Signup failed. Error code: ${response.statusCode}');
        print('Error message: ${response.body}');
        return false;
      }
    } catch (error) {
      print('Error during signup: $error');
      return false;
    }
  }

  void showCustomToast(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: CustomToast(message: message),
        duration: const Duration(seconds: 2), // Adjust duration as needed
      ),
    );
  }
}

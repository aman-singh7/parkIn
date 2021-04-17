import 'package:flutter/material.dart';
import 'package:login_app/net/firebase.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatefulWidget {
  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController displayNameController = TextEditingController();
  final TextEditingController phoneNoController = TextEditingController();
  final TextEditingController vehicleNoController = TextEditingController();
  final TextEditingController aadharNoController = TextEditingController();
  final TextEditingController licenseNoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: displayNameController,
                decoration: InputDecoration(
                  labelText: "Full Name",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: phoneNoController,
                decoration: InputDecoration(
                  labelText: "Phone Number",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: vehicleNoController,
                decoration: InputDecoration(
                  labelText: "Vehicle Number",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: aadharNoController,
                decoration: InputDecoration(
                  labelText: "Aadhar Number",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: licenseNoController,
                decoration: InputDecoration(
                  labelText: "License Number",
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height / 50.0),
            Container(
              width: MediaQuery.of(context).size.width / 1.4,
              height: 44,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.blue,
              ),
              child: MaterialButton(
                onPressed: () {
                  context.read<FlutterFireAuthService>().signUp(
                        emailController.text.trim(),
                        passwordController.text.trim(),
                        displayNameController.text.trim(),
                        phoneNoController.text.trim(),
                        aadharNoController.text.trim(),
                        vehicleNoController.text.trim(),
                        licenseNoController.text.trim(),
                        context,
                      );
                },
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

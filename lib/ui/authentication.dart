import 'package:flutter/material.dart';
import 'package:login_app/net/flutterfire.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_app/ui/home_view.dart';

class Authentication extends StatefulWidget {
  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  TextEditingController _emailTF = TextEditingController();
  TextEditingController _passwordTF = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            TextFormField(
              controller: _emailTF,
              decoration: InputDecoration(
                hintText: 'Email',
                labelText: 'Email',
              ),
            ),
            TextFormField(
              controller: _passwordTF,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                labelText: 'Password',
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: MaterialButton(
                onPressed: () async {
                  bool shouldNavigate =
                      await signIn(_emailTF.text, _passwordTF.text);
                  if (shouldNavigate) {
                    // navigate
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeVeiw(),
                      ),
                    );
                  }
                },
                child: Text('Sign In'),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: MaterialButton(
                onPressed: () async {
                  bool shouldNavigate =
                      await register(_emailTF.text, _passwordTF.text);
                  if (shouldNavigate) {
                    // navigate
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeVeiw(),
                      ),
                    );
                  }
                },
                child: Text('Sign Up'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

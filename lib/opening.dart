import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'ui/home_view.dart';
import 'ui/register.dart';
import 'ui/login.dart';

class OpeningView extends StatefulWidget {
  @override
  _OpeningViewState createState() => _OpeningViewState();
}

class _OpeningViewState extends State<OpeningView> {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      print('User is currently signed in');
      return HomeVeiw();
    }

    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Center(
                child: RichText(
                  text: TextSpan(
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                          fontSize: 80,
                          fontStyle: FontStyle.italic
                      ),
                      children: <TextSpan>[
                        TextSpan(
                            text: "Park",
                            style: TextStyle(
                                color: Colors.blue[900])),
                        TextSpan(
                            text: "In",
                            style: TextStyle(
                              color: Colors.white,
                            )
                        )
                      ]),
                ),
              ),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.blue[900], Colors.white],
                  )),
            ),
          ),
          Container(
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 5.0,
                ),
                Expanded(
                  child: FloatingActionButton(
                    heroTag: "btn1",
                    focusElevation: 5.0,
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                          fontSize: 20.0),
                    ),
                    onPressed: (){
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) => LoginView(),
                      ),
                      );
                    },
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 2.0,
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  ),
                ),
                SizedBox(
                  width: 5.0,
                ),
                Expanded(
                  child: FloatingActionButton(
                    heroTag: "btn2",
                    focusElevation: 5.0,
                    onPressed: (){
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                      builder: (context) => RegisterView(),
                      ),
                      );
                    },
                    child: Text(
                      "Register",
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0),
                    ),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 2.0,
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  ),
                )
              ],
            ),
            height: 80.0,
            decoration: BoxDecoration(color: Colors.white),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

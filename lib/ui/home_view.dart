import 'package:flutter/material.dart';
import 'package:login_app/net/firebase.dart';
import 'package:provider/provider.dart';

class HomeVeiw extends StatefulWidget {
  @override
  _HomeVeiwState createState() => _HomeVeiwState();
}

class _HomeVeiwState extends State<HomeVeiw> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //title: Text('Drawer in App Bar'),
          ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'User Name',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.car_rental),
              title: Text("My Vehicle"),
            ),
            ListTile(
              leading: Icon(Icons.book_outlined),
              title: Text('My Booking'),
            ),
            ListTile(
              leading: Icon(Icons.star_border),
              title: Text("Favourites"),
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Sign Out"),
            ),
          ],
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Home View'),
            IconButton(
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.black,
                size: 35,
              ),
              onPressed: () {
                print('Sign Out Pressed');
                context.read<FlutterFireAuthService>().signOut();
                if (Navigator.of(context).canPop()) {
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app/model/userInfo.dart';
import 'package:login_app/net/retrieveUserInfo.dart';
import 'package:login_app/ui/home_view.dart';
import '../opening.dart';
import '../net/userInfoDatabase.dart';

class FlutterFireAuthService {
  final FirebaseAuth _firebaseAuth;

  FlutterFireAuthService(this._firebaseAuth);

  Stream<User> get authStateChanges => _firebaseAuth.idTokenChanges();

  Future<String> signIn(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      UserInformation infoUser = await retrieveInfo();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeVeiw(
            displayname: infoUser.displayname,
            email: infoUser.email,
          ),
        ),
      );
      return 'Success';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<void> signOut(BuildContext context) async {
    await _firebaseAuth.signOut();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OpeningView(),
      ),
    );
  }

  Future<String> signUp(
    String email,
    String password,
    String displayName,
    String phoneNo,
    String address,
    String type,
    String vehicleNo,
    String licenseNo,
    BuildContext context,
  ) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      FirebaseAuth auth = FirebaseAuth.instance;
      UpdateUserInfo(
              uid: auth.currentUser.uid.toString(),
              email: auth.currentUser.email.toString())
          .userSetup(displayName, phoneNo, address, licenseNo);
      addVehicle(vehicleNo, type);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeVeiw(
            displayname: displayName,
            email: email,
          ),
        ),
      );
      return 'Success';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}

Future<void> addVehicle(String id, String type) async {
  String uid = FirebaseAuth.instance.currentUser.uid;
  CollectionReference vehicles = FirebaseFirestore.instance
      .collection('Users')
      .doc(uid)
      .collection('Vehicles');
  vehicles
      .doc(id)
      .set({'VehicleNo': id, 'type': type})
      .then((value) => print('Sucessfully Added'))
      .catchError((error) => print('failed to add $error'));
}

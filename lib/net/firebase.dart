import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app/ui/home_view.dart';

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
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeVeiw(),
        ),
      );
      return 'Success';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
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
      userSetup(displayName, phoneNo, address, licenseNo);
      addVehicle(vehicleNo, type);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeVeiw(),
        ),
      );
      return 'Success';
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}

Future<void> userSetup(
  String displayName,
  String phoneNo,
  String address,
  String licenseNo,
) async {
  CollectionReference users = FirebaseFirestore.instance.collection('Users');
  FirebaseAuth _auth = FirebaseAuth.instance;
  String uid = _auth.currentUser.uid.toString();
  users
      .doc(uid)
      .set({
        'displayname': displayName,
        'uid': uid,
        'phone': phoneNo,
        'address': address,
        'license': licenseNo,
      })
      .then((value) => print('User Added'))
      .catchError((error) => print('falied to add user: $error'));
  return;
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

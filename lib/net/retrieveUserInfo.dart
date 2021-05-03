import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_app/model/userInfo.dart';

Future<UserInformation> retrieveInfo() async {
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser.uid;
  UserInformation userInformation;
  await FirebaseFirestore.instance
      .collection("Users")
      .doc(uid)
      .get()
      .then((DocumentSnapshot documentSnapshot) {
    Map<String, dynamic> info = documentSnapshot.data();
    userInformation =
        UserInformation(info['displayname'], auth.currentUser.email);
  });
  return userInformation;
}

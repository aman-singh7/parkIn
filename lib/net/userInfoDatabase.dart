import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:login_app/model/userInfo.dart';
import 'package:provider/provider.dart';

class UpdateUserInfo {
  String uid;
  String email;

  UpdateUserInfo({this.uid, this.email});

  final CollectionReference users =
      FirebaseFirestore.instance.collection('Users');
  Future<void> userSetup(
    String displayName,
    String phoneNo,
    String address,
    String licenseNo,
  ) async {
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

  UserInformation userInfo;
  Future<void> getUserInfo() async {
    try {
      await users.doc(uid).get().then((DocumentSnapshot documentSnapshot) {
        dynamic displayName = documentSnapshot.get(FieldPath(['displayname']));
        userInfo = UserInformation(displayName, email);
      });
    } catch (e) {
      print(e.toString());
    }
  }
}

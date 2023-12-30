import 'package:cloud_firestore/cloud_firestore.dart';

class UserData {
  String name;
  String email;
  String uid;
  String profilePhoto;
  String age;
  bool gender;
  String phoneNo;
  String country;

  UserData(
      {required this.name,
      required this.email,
      required this.uid,
      required this.profilePhoto,
      required this.age,
      required this.gender,
      required this.phoneNo,
      required this.country});

  Map<String, dynamic> toMap() => {
        "name": name,
        "email": email,
        "uid": uid,
        "profilePhoto": profilePhoto,
        "age": age,
        "gender": gender,
        "phoneNo": phoneNo,
        "country": country
      };

  static UserData fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserData(
        name: snapshot['name'],
        email: snapshot['email'],
        uid: snapshot['uid'],
        profilePhoto: snapshot['profilePhoto'],
        age: snapshot['age'],
        gender: snapshot['gender'],
        phoneNo: snapshot['phoneNo'],
        country: snapshot['country']);
  }
}

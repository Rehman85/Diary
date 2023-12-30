import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary/util/custamWidget/custamContainer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// Custam Colors
Color yellow = Color(0xffFFB347);
Color gray = Color(0xff808D9E);
Color black = Color(0xff252D31);
Color lightgray = Color(0xffE2E8F0);
Color ofwhite = Color(0xffF9F9F9);
Color white = Color(0xffFFFFFF);

Color Runningcol = Color(0xff24CAFF);
Color Upcommingcol = Color(0xffE964FF);
Color Incompletecol = Color(0xffFF9A24);
Color Completedcol = Color(0xff00B61D);

// Line Container to Show Coloue Line
Widget linecon(Color col) {
  return CustamContainer(wigth: 6, hight: 58, cir: 4, col: col);
}

final currentUid = auth.currentUser!.uid;
final auth = FirebaseAuth.instance;
final firestore = FirebaseFirestore.instance.collection("User");

// Get Data t Firbase

Future<String>? fetchUser(String link, String id) async {
  DocumentSnapshot snapshot =
      await FirebaseFirestore.instance.collection('User').doc(id).get();

  if (snapshot.exists) {
    return snapshot[link];
  }
  return Future.value(link);
}

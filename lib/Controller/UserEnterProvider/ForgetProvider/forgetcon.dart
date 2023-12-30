import 'package:diary/util/toastmessage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgetController extends ChangeNotifier {
  TextEditingController forgetEmail = TextEditingController();

  final auth = FirebaseAuth.instance;
  void forget(BuildContext context) {
    auth.sendPasswordResetEmail(email: forgetEmail.text).then((value) {
      Navigator.pushNamed(context, '/LoginScreen');
      Utils.toastMessage('Link Send to your mail to change Password');
    });
  }
}

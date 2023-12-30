import 'package:diary/util/appCustam.dart';
import 'package:diary/util/toastmessage.dart';
import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool loading = false;
  void lodings(bool value) {
    loading = value;
    notifyListeners();
  }

  void loginUser(BuildContext context) {
    try {
      if (email.text != '' && password.text != '') {
        lodings(true);
        auth
            .signInWithEmailAndPassword(
                email: email.text, password: password.text)
            .then((value) {
          lodings(false);
          Navigator.of(context).pushNamedAndRemoveUntil(
              '/HomeList', (Route<dynamic> route) => false);
        }).onError((error, stackTrace) {
          lodings(false);
          Utils.toastMessage('Invalid User Name And Password');
        });
      } else {
        lodings(false);
        Utils.toastMessage('Invalid User Name And Password');
      }
    } catch (e) {
      lodings(false);
    }
  }
}

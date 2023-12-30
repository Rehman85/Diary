import 'package:diary/Model/UserModel/user.dart';
import 'package:diary/util/appCustam.dart';
import 'package:diary/util/toastmessage.dart';
import 'package:flutter/material.dart';

class SignupController extends ChangeNotifier {
  bool _checkbox = true;
  bool get checkbox => _checkbox;
  void termsCondition(bool value) {
    _checkbox = value;
    notifyListeners();
  }

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  var loading = false;
  void loadings(bool value) {
    loading = value;
    notifyListeners();
  }

  void signupEmail(BuildContext context) {
    try {
      if (email.text != '' && password.text != '' && name.text != '') {
        loadings(true);
        auth
            .createUserWithEmailAndPassword(
                email: email.text, password: password.text)
            .then((value) {
          saveData(context);
          loadings(false);
        }).onError((error, stackTrace) {
          loadings(false);
          Utils.toastMessage('Invalid User Name And Password');
        });
      } else {
        Utils.toastMessage('Invalid User Name And Password ');
      }
    } catch (e) {
      Utils.toastMessage('Invalid User Name And Password ');
    }
  }

  void saveData(BuildContext context) {
    String uid = auth.currentUser!.uid;

    UserData userData = UserData(
        name: name.text,
        email: email.text,
        uid: uid,
        profilePhoto: '',
        age: '',
        gender: true,
        phoneNo: '',
        country: 'us');
    firestore.doc(uid).set(userData.toMap()).then((value) {
      Navigator.of(context).pushNamedAndRemoveUntil(
          '/HomeList', (Route<dynamic> route) => false);
    });
  }
}

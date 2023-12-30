import 'package:diary/util/appCustam.dart';
import 'package:diary/util/custamWidget/textcustam.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class DrawersProviders extends ChangeNotifier {
  void logoutfun(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: yellow, width: 3)),
          title: Textcustam(
            text: 'Confirmed to Logout',
            col: gray,
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Textcustam(
                  text: 'Cancle',
                  size: 17,
                  col: Colors.green,
                )),
            TextButton(
                onPressed: () {
                  GoogleSignIn().signOut();
                  auth.signOut().then((value) {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/LoginScreen', (Route<dynamic> route) => false);
                  }).onError((error, stackTrace) {
                    /// Get.snackbar('Error', stackTrace.toString());
                  });
                },
                child: Textcustam(
                  text: 'Logout',
                  col: Colors.red,
                  size: 17,
                )),
          ],
        );
      },
    );
  }
}

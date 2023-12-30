import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary/Model/UserModel/user.dart';
import 'package:diary/util/appCustam.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleFacebookProvider extends ChangeNotifier {
  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleuser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleuser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      final UserCredential userCredential =
          await auth.signInWithCredential(credential);

      final User user = userCredential.user!;

      String uid = user.uid;
      String displayname = user.displayName ?? '';
      String poto = user.photoURL ?? '';
      String email = user.email ?? '';

      // DocumentSnapshot snapShot= FirebaseFirestore.instance.collection("Users").doc(user.uid).get();
      UserData? userData;
      FirebaseFirestore.instance
          .collection("User")
          .doc(user.uid)
          .get()
          .then((DocumentSnapshot<Map<String, dynamic>> snapshot) {
        //
        // AllRed User Exitex Data Give Privacy

        if (snapshot.exists) {
          userData = UserData.fromSnap(snapshot);
          // print(userData!.name);
          // print(userData!.email);
          Navigator.of(context).pushNamedAndRemoveUntil(
              '/HomeList', (Route<dynamic> route) => false);
        }

        // New User Save

        else {
          userData = UserData(
              name: displayname,
              email: email,
              uid: uid,
              profilePhoto: poto,
              age: '',
              gender: true,
              phoneNo: '',
              country: 'us');

          firestore.doc(uid).set(userData!.toMap()).then((value) {
            Navigator.of(context).pushNamedAndRemoveUntil(
                '/HomeList', (Route<dynamic> route) => false);
          });
          print('Document does not exist');
        }
      });
    } catch (e) {
      //  print(e.toString());
      // Utils.toastMessage(e.toString());
    }
  }

//
//  Facebook Logi
//

  // Future<void> handleFacebookLogin(BuildContext context) async {
  //   try {
  //     final LoginResult result = await FacebookAuth.instance.login();
  //     if (result.status == LoginStatus.success) {
  //       final AuthCredential credential =
  //           FacebookAuthProvider.credential(result.accessToken!.token);
  //       final UserCredential authResult =
  //           await FirebaseAuth.instance.signInWithCredential(credential);
  //       User? user = authResult.user;
  //       if (user != null) {
  //         // User is logged in. Save user data to Firestore.
  //         UserData userData = UserData(
  //             name: user.displayName ?? '',
  //             email: user.email ?? '',
  //             uid: user.uid,
  //             profilePhoto: user.photoURL ?? '',
  //             age: '',
  //             gender: true,
  //             phoneNo: '',
  //             country: 'us');
  //         firestore.doc(user.uid).set(userData.toMap());
  //         // Navigate to the home screen
  //         Navigator.of(context).pushNamedAndRemoveUntil(
  //           '/HomeList',
  //           (Route<dynamic> route) => false,
  //         );
  //       } else {
  //         // Handle the case where the user is null after successful login
  //       }
  //     } else {
  //       // Handle Facebook login failure
  //       Utils.toastMessage('Facebook login failed');
  //       print('Facebook login failed');
  //     }
  //   } catch (e) {
  //     // Handle any exceptions
  //     Utils.toastMessage(e.toString());
  //     // print('Error during Facebook login: $e');
  //   }
  // }
}

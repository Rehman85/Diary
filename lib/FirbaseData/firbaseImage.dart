import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary/util/appCustam.dart';
import 'package:diary/util/images.dart';
import 'package:flutter/material.dart';

class GetImageData extends StatelessWidget {
  // String data;
  double height;
  double width;
  GetImageData({required this.height, required this.width});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('User')
          .doc(auth.currentUser!.uid.toString())
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data!.exists) {
          final userData = snapshot.data!.data() as Map<String, dynamic>;
          final foundValue = userData['profilePhoto'] ?? "";

          return snapshot.data != null && foundValue.isNotEmpty
              ? CircleAvatar(
                  radius: width / 2, // Adjust the radius as needed
                  backgroundColor: lightgray,
                  // backgroundImage: AssetImage(
                  //   Images.person,
                  // ),
                  foregroundImage: NetworkImage(foundValue),
                )
              : CircleAvatar(
                  radius: width / 2, // Adjust the radius as needed
                  backgroundColor: lightgray,
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: gray,
                  ),
                );
        } else if (snapshot.hasError) {
          return Center(
            child: Text("Error: ${snapshot.error}"),
          );
        }
        return Center(
          child: CircleAvatar(
            radius: width / 2, // Adjust the radius as needed
            backgroundColor: lightgray,
            child: Icon(
              Icons.person,
              size: 50,
              color: gray,
            ),
          ),
        );
      },
    );
  }
}

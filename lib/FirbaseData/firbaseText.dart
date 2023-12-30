import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:diary/util/appCustam.dart';
import 'package:flutter/material.dart';

class GetTextData extends StatelessWidget {
  final double? textFontSize;
  final String fieldd;
  final FontWeight? fontWeight;
  final Color? col;

  GetTextData({
    required this.fieldd,
    this.textFontSize,
    this.fontWeight,
    this.col,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('User')
          .doc(auth.currentUser!.uid)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data!.exists) {
          final userData = snapshot.data!.data() as Map<String, dynamic>;
          final foundValue = userData[fieldd] ?? "";

          return Text(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            '$foundValue',
            style: TextStyle(
                fontSize: textFontSize,
                fontWeight: FontWeight.w700,
                color: col),
          );
        } else if (snapshot.hasError) {
          return Center(
            child: Text("Error: ${snapshot.error}"),
          );
        }
        return SizedBox();
      },
    );
  }
}

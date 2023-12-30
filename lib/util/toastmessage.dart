import 'package:diary/util/appCustam.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class Utils {
  static void toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: lightgray, // Color(0xffE2E8F0),
        textColor: Color(0xff252D31),
        fontSize: 16.0);
  }
}

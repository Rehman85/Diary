import 'package:diary/util/appCustam.dart';
import 'package:flutter/material.dart';

class Textfiledcustam extends StatelessWidget {
  // final formKey = GlobalKey<FormState>();

  final String? hinttext;
  final String? labeltext;
  final Widget? starticon;
  final Widget? lasticon;
  final bool? obscur;
  final VoidCallback? fun;
  final bool? focus;
  final double? height;
  final double? width;

  final TextInputType? keyboardType;
  final TextEditingController? controller;

  Textfiledcustam(
      {this.hinttext,
      this.controller,
      this.labeltext,
      this.lasticon,
      this.obscur = false,
      this.starticon,
      this.keyboardType,
      this.fun,
      this.focus = false,
      this.height,
      this.width});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: lightgray)),
      child: Center(
        child: TextFormField(
          autofocus: focus!,
          // key: formKey,
          obscureText: obscur!,
          keyboardType: keyboardType,
          style: TextStyle(
            fontSize: 14,
          ),
          controller: controller,
          cursorColor: yellow,
          decoration: InputDecoration(
            hintText: hinttext,
            hintStyle: TextStyle(color: gray),
            labelText: labeltext,
            prefixIcon: starticon,
            suffixIcon: lasticon,

            border: InputBorder.none,

            // border: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(10),
            //   borderSide: BorderSide(color: lightgray),
            // ),

            // focusedBorder: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(10),
            //   borderSide: BorderSide(color: yellow), // Focus border color
            // ),
            // isCollapsed: false,
            // contentPadding: EdgeInsets.symmetric(vertical: 10.0),
            prefixText: '    ',
          ),

          validator: (value) {
            if (value!.isEmpty) {
              return ' ';
            } else
              return null;
          },
          onChanged: (value) {
            fun;
          },
        ),
      ),
    );
  }
}

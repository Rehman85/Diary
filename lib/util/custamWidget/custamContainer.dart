import 'package:flutter/material.dart';

class CustamContainer extends StatelessWidget {
  final double? hight;
  final double wigth;
  final Color? col;
  final Widget? child;
  final double? cir;
  final bool? borders;
  final Color? bordercol;

  CustamContainer(
      {this.hight,
      required this.wigth,
      this.child,
      this.col,
      this.borders = false,
      this.cir = 1,
      this.bordercol = Colors.grey});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: hight,
      width: wigth,
      decoration: BoxDecoration(
        color: col,
        border: borders == true ? Border.all(color: bordercol!) : null,
        borderRadius: BorderRadius.circular(cir!),
      ),
      child: Center(child: child),
    );
  }
}

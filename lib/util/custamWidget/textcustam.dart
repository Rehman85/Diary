import 'package:flutter/cupertino.dart';

class Textcustam extends StatelessWidget {
  final String text;
  final Color? col;
  final FontWeight? weight;
  final bool? underlines;

  final double? size;
  final TextAlign? align;
  Textcustam({
    required this.text,
    this.weight,
    this.col,
    this.size,
    this.align,
    this.underlines = false,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: align,
      '$text',
      style: TextStyle(
        color: col,
        fontSize: size,
        fontWeight: weight,
        decoration: underlines == true ? TextDecoration.underline : null,
        decorationColor: col,
        decorationThickness: 1.0,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Imageontab extends StatelessWidget {
  final VoidCallback fun;
  final String image;
  final Color col;
  Imageontab({required this.fun, required this.image, required this.col});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: fun,
        child: SvgPicture.asset(
          image,
          color: col,
        ));
  }
}

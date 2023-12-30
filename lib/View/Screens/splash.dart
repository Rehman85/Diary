import 'dart:async';
import 'package:diary/Controller/onboardingProvider/onboardingpro.dart';
import 'package:diary/util/appCustam.dart';
import 'package:diary/util/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SplishScreen extends StatefulWidget {
  @override
  State<SplishScreen> createState() => _SplishScreenState();
}

class _SplishScreenState extends State<SplishScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), () {
      moveScreen(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OnBboardingProviders>(context, listen: false);
    return Scaffold(
      backgroundColor: yellow,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
              alignment: Alignment.topLeft,
              child: SvgPicture.asset(Images.Frame2)),
          SvgPicture.asset(Images.Frame),
          Align(
              alignment: Alignment.bottomRight,
              child: SvgPicture.asset(Images.Frame1)),
        ],
      ),
    );
  }

  void moveScreen(BuildContext context) {
    var user = auth.currentUser;
    if (user != null) {
      Navigator.pushNamed(context, '/HomeList');
    } else {
      Navigator.pushNamed(context, '/OnboardingScreen');
    }
  }
}

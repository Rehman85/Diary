import 'package:diary/Controller/onboardingProvider/onboardingpro.dart';
import 'package:diary/util/appCustam.dart';
import 'package:diary/util/custamWidget/Buttoncustam.dart';
import 'package:diary/util/custamWidget/Textcustam.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OnBboardingProviders>(context, listen: false);
    return Scaffold(
      backgroundColor: white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
              //height: 100,
            ),
            Container(
              height: 430,
              //   color: Colors.amber,
              child: PageView.builder(
                controller: provider.pagecon,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: SvgPicture.asset(
                          provider.pagelist[index].image,
                          height: 310,
                          width: 310,
                        ),
                      ),
                      SizedBox(
                        height: 55,
                      ),
                      Textcustam(
                        text: provider.pagelist[index].data,
                        size: 20,
                        weight: FontWeight.w500,
                      ),
                      Textcustam(
                        text: provider.pagelist[index].text,
                        size: 14,
                      )
                    ],
                  );
                },
                itemCount: 2,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            SmoothPageIndicator(
              controller: provider.pagecon,
              count: 2,
              effect: WormEffect(
                  spacing: 8.0,
                  radius: 4.0,
                  dotWidth: 17.0,
                  dotHeight: 8.0,
                  dotColor: lightgray,
                  activeDotColor: yellow),
            ),
            SizedBox(
              height: 91,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: RoundButton(
                title: 'Next',
                fun: () {
                  Navigator.pushReplacementNamed(context, '/LoginScreen');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

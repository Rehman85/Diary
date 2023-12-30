import 'package:diary/Controller/UserEnterProvider/LoginProvider/googlefackbook.dart';
import 'package:diary/Controller/UserEnterProvider/LoginProvider/logincon.dart';
import 'package:diary/util/appCustam.dart';
import 'package:diary/util/custamWidget/Buttoncustam.dart';
import 'package:diary/util/custamWidget/custamContainer.dart';
import 'package:diary/util/custamWidget/textcustam.dart';
import 'package:diary/util/custamWidget/textfiledcustam.dart';
import 'package:diary/util/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  ValueNotifier<bool> toggle = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginController>(context, listen: false);
    final GoogleFacebook =
        Provider.of<GoogleFacebookProvider>(context, listen: false);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 122,
              ),
              Textcustam(
                text: 'Login',
                size: 20,
                weight: FontWeight.w600,
              ),
              SizedBox(
                height: 5,
              ),
              Textcustam(
                text: 'Please enter email & password',
                size: 12,
                weight: FontWeight.w500,
                col: gray,
              ),
              SizedBox(
                height: 18,
              ),
              Textcustam(
                text: ' Email',
                size: 14,
                weight: FontWeight.w500,
              ),
              SizedBox(
                height: 8,
              ),
              Textfiledcustam(
                controller: provider.email,
                height: 54,
                width: 350,
                hinttext: 'Enter Your Email',
              ),
              SizedBox(
                height: 28,
              ),
              Textcustam(
                text: ' Password',
                size: 14,
                weight: FontWeight.w500,
              ),
              SizedBox(
                height: 8,
              ),
              ValueListenableBuilder(
                valueListenable: toggle,
                builder: (context, value, child) => Textfiledcustam(
                  controller: provider.password,
                  height: 54,
                  width: 350,
                  hinttext: 'Enter Your Password',
                  lasticon: GestureDetector(
                      onTap: () {
                        toggle.value = !toggle.value;
                      },
                      child: Icon(
                        toggle.value ? Icons.visibility_off : Icons.visibility,
                        color: gray,
                      )),
                  obscur: toggle.value,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/ForgetPassword');
                  },
                  child: Textcustam(
                    text: 'Forgot Password?',
                    col: yellow,
                    size: 14,
                    weight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Consumer<LoginController>(
                builder: (context, value, child) => RoundButton(
                  title: 'Login',
                  loading: value.loading,
                  fun: () {
                    value.loginUser(context);
                  },
                  textcolor: white,
                ),
              ),
              SizedBox(
                height: 0,
              ),
              // Row(
              //   children: [
              //     Expanded(
              //       child: Divider(
              //         color: lightgray,
              //       ),
              //     ),
              //     Textcustam(
              //       text: '   OR continue with   ',
              //       col: gray,
              //     ),
              //     Expanded(
              //       child: Divider(
              //         color: lightgray,
              //       ),
              //     ),
              //   ],
              // ),
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Textcustam(
                    text: 'Dont have an account? ',
                    size: 16,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/SignUpScreen');
                    },
                    child: Textcustam(
                      text: ' Sign Up',
                      size: 16,
                      col: yellow,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // GestureDetector(
                  //   onTap: () {
                  //     GoogleFacebook.handleFacebookLogin(context);
                  //   },
                  //   child: CustamContainer(
                  //     wigth: 80,
                  //     hight: 60,
                  //     cir: 20,
                  //     borders: true,
                  //     bordercol: lightgray,
                  //     child: SvgPicture.asset(
                  //       Images.gogal,
                  //       height: 30,
                  //       width: 30,
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   width: 24,
                  // ),
                  GestureDetector(
                    onTap: () {
                      GoogleFacebook.signInWithGoogle(context);
                    },
                    child: CustamContainer(
                        wigth: 250,
                        hight: 50,
                        cir: 10,
                        borders: true,
                        bordercol: lightgray,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              Images.facbook,
                              height: 20,
                              width: 20,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Textcustam(
                              text: 'Continue with google',
                              col: gray,
                              size: 17,
                            ),
                          ],
                        )),
                  )
                ],
              ),
              SizedBox(
                height: 34,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:diary/Controller/UserEnterProvider/ForgetProvider/forgetcon.dart';
import 'package:diary/util/appCustam.dart';
import 'package:diary/util/custamWidget/Buttoncustam.dart';
import 'package:diary/util/custamWidget/textcustam.dart';
import 'package:diary/util/custamWidget/textfiledcustam.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ForgetController>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 70,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back_ios_new_outlined)),
              SizedBox(
                height: 33,
              ),
              Textcustam(
                text: 'Forget Password',
                size: 20,
                weight: FontWeight.w600,
              ),
              SizedBox(
                height: 10,
              ),
              Textcustam(
                text:
                    'Enter your registered email address to get verification code',
                size: 11,
                weight: FontWeight.w500,
                col: gray,
              ),
              SizedBox(
                height: 28,
              ),
              Textcustam(
                text: ' Email',
                size: 14,
                weight: FontWeight.w500,
              ),
              SizedBox(
                height: 5,
              ),
              Textfiledcustam(
                controller: provider.forgetEmail,
                height: 54,
                width: 350,
                hinttext: 'Enter Your Email',
              ),
              SizedBox(
                height: 24,
              ),
              RoundButton(
                title: 'Send',
                textcolor: white,
                fun: () {
                  provider.forget(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

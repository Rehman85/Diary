import 'package:diary/Controller/UserEnterProvider/signupProvider/signupcon.dart';
import 'package:diary/util/appCustam.dart';
import 'package:diary/util/custamWidget/Buttoncustam.dart';
import 'package:diary/util/custamWidget/Textcustam.dart';
import 'package:diary/util/custamWidget/textfiledcustam.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatelessWidget {
  ValueNotifier<bool> toggle = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SignupController>(context, listen: false);
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
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios_new_outlined)),
              SizedBox(
                height: 30,
              ),
              Textcustam(
                text: 'Signup',
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
                text: ' Name',
                size: 14,
                weight: FontWeight.w500,
              ),
              SizedBox(
                height: 8,
              ),
              Textfiledcustam(
                controller: provider.name,
                height: 54,
                width: 350,
                hinttext: 'Enter Your Full Name',
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
                height: 5,
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
              // SizedBox(
              //   height: 24,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Consumer<SignupController>(
                    builder: (context, value, child) => Checkbox(
                      side: BorderSide(color: lightgray),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      activeColor: yellow,
                      value: provider.checkbox,
                      onChanged: (values) {
                        provider.termsCondition(values!);
                      },
                    ),
                  ),
                  Textcustam(
                    text: 'I agree with the ',
                    size: 12,
                  ),
                  Text(
                    'Terms & Conditions',
                    style: TextStyle(
                      color: yellow,
                      fontSize: 12,
                      decoration: TextDecoration.underline,
                      decorationColor: yellow,
                      decorationThickness: 1.0,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 4,
              ),
              Consumer<SignupController>(
                builder: (context, value, child) => RoundButton(
                  title: 'Register',
                  loading: provider.loading,
                  fun: () {
                    provider.signupEmail(context);
                  },
                  textcolor: white,
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Textcustam(
                    text: 'Already have an account? ',
                    size: 16,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Textcustam(
                      text: 'Login',
                      size: 16,
                      col: yellow,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

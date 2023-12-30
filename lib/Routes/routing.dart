import 'package:diary/View/Screens/AddnewNote/enternote.dart';
import 'package:diary/View/Screens/AddnewNote/newnode.dart';
import 'package:diary/View/Screens/Home/home.dart';
import 'package:diary/View/Screens/Profile/profile.dart';
import 'package:diary/View/Screens/UserEnterApp/Forget/forgetpassword.dart';
import 'package:diary/View/Screens/UserEnterApp/Login/login.dart';
import 'package:diary/View/Screens/Onboarding/onboardings.dart';
import 'package:diary/View/Screens/UserEnterApp/Signup/sigup.dart';
import 'package:diary/View/Screens/splash.dart';
import 'package:flutter/material.dart';

class Rout {
  Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/SplishScreen':
        return MaterialPageRoute(
          builder: (context) => SplishScreen(),
        );
      case '/OnboardingScreen':
        return MaterialPageRoute(
          builder: (context) => OnboardingScreen(),
        );
      case '/LoginScreen':
        return MaterialPageRoute(
          builder: (context) => LoginScreen(),
        );
      case '/ForgetPassword':
        return MaterialPageRoute(
          builder: (context) => ForgetPassword(),
        );
      case '/SignUpScreen':
        return MaterialPageRoute(
          builder: (context) => SignUpScreen(),
        );

      // case '/Consol2Light':
      //   return MaterialPageRoute(
      //     builder: (context) => Consol2Light(),
      //   );

      case '/HomeList':
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
        );

      case '/ProfileScreen':
        return MaterialPageRoute(
          builder: (context) => ProfileScreen(),
        );
      case '/AddNewNodes':
        return MaterialPageRoute(
          builder: (context) => AddNewNodes(),
        );
      case '/EnterNoteText':
        return MaterialPageRoute(
          builder: (context) => EnterNoteText(),
        );
      // case '/ReadTextData':
      //   return MaterialPageRoute(
      //     builder: (context) => ReadTextData(),
      //   );

      // case '/ThemDark':
      //   return MaterialPageRoute(
      //     builder: (context) => ThemDark(),
      //   );
      // case '/MyDropdownButton':
      //   return MaterialPageRoute(
      //     builder: (context) => MyDropdownButton(),
      //   );
    }
  }
}

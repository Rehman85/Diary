import 'package:diary/Controller/AddNewNoteProvider/newnotecon.dart';
import 'package:diary/Controller/HomeProvider/drawersProvider.dart';
import 'package:diary/Controller/HomeProvider/homepovider.dart';
import 'package:diary/Controller/ProfileProvider/Profilecon.dart';
import 'package:diary/Controller/ProfileProvider/imageEdit.dart';
import 'package:diary/Controller/UserEnterProvider/ForgetProvider/forgetcon.dart';
import 'package:diary/Controller/UserEnterProvider/LoginProvider/googlefackbook.dart';
import 'package:diary/Controller/UserEnterProvider/LoginProvider/logincon.dart';
import 'package:diary/Controller/UserEnterProvider/signupProvider/signupcon.dart';
import 'package:diary/Controller/onboardingProvider/onboardingpro.dart';
import 'package:diary/View/Screens/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:device_preview/device_preview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  final Rout NameRoute = Rout();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => OnBboardingProviders(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeController(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginController(),
        ),
        ChangeNotifierProvider(
          create: (context) => SignupController(),
        ),
        ChangeNotifierProvider(
          create: (context) => ForgetController(),
        ),
        ChangeNotifierProvider(
          create: (context) => GoogleFacebookProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DrawersProviders(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProfileProviders(),
        ),
        ChangeNotifierProvider(
          create: (context) => NewNoteProviders(),
        ),
        ChangeNotifierProvider(
          create: (context) => ChangeProfilePoto(),
        ),
        //   ChangeNotifierProvider(
        //   create: (context) => OnBboardingProviders(),
        // ),
        //   ChangeNotifierProvider(
        //   create: (context) => OnBboardingProviders(),
        // ),
        //   ChangeNotifierProvider(
        //   create: (context) => OnBboardingProviders(),
        // ),
        //   ChangeNotifierProvider(
        //   create: (context) => OnBboardingProviders(),
        // ),
        //   ChangeNotifierProvider(
        //   create: (context) => OnBboardingProviders(),
        // ),
        //   ChangeNotifierProvider(
        //   create: (context) => OnBboardingProviders(),
        // ),
        //   ChangeNotifierProvider(
        //   create: (context) => OnBboardingProviders(),
        // ),
      ],
      child: MaterialApp(
        title: 'Diary App',
        theme: ThemeData(
          primarySwatch: Colors.amber, // Set the primary color to yellow

          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
          useMaterial3: true,
        ),
        home: SplishScreen(),
        onGenerateRoute: NameRoute.onGenerateRoute,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

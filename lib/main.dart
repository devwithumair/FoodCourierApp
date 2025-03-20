import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:foodcourier/firebase_options.dart';
import 'package:foodcourier/login_screen.dart';
import 'package:foodcourier/onboarding1.dart';
import 'package:foodcourier/onboarding2.dart';
import 'package:foodcourier/signup_screen.dart';
import 'package:foodcourier/splash_screen.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Food Courier',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Signup(),
      // getPages: [
      //   GetPage(name: '/', page: () => SplashScreen()),
      //   GetPage(name: '/onboarding1', page: () => OnBoardingOne()),
      //   GetPage(name: '/onboarding2', page: () => OnboardingScreenTwo()),
      //   GetPage(name: '/Login', page: () => Login()),
      //   GetPage(name: '/Signup', page: () => Signup()),
      // ],
    );
  }
}

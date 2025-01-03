import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cots_wahyuisnantiaqodrighozali/modules/onboarding/views/onboarding_page.dart';
import 'package:cots_wahyuisnantiaqodrighozali/modules/onboarding/bindings/onboarding_binding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: 'SFPro',
      ),
      initialBinding: OnboardingBinding(), // Pastikan binding controller dimasukkan di sini
      home: OnboardingPage(),
    );
  }
}

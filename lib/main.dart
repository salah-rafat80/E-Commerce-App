import 'package:ecommerce_app/core/resources_manager/shared_styles/colors.dart';
import 'package:ecommerce_app/features/Onboarding/splash_screen_start.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

// import 'features/Onboarding/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Montserrat',
        primaryColor: AppColors.white,
      ),
      home: SplashScreen(),
    );
  }
}

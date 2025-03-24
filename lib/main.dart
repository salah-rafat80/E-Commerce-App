import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'features/Home/views/screens/main_screen.dart';
import 'features/Onboarding/get_start_screen.dart';
import 'features/Onboarding/splash_screen_start.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home:SplashScreen() ,
    );
  }
}
class start extends StatelessWidget {
  const start({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

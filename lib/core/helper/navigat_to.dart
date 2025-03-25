import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class MyNavigator {
  static void navigatTo({
    required Widget screen,
    Transition? transition,
  }) {
    Get.to(screen,
        duration: Duration(seconds: 2),
        curve: Curves.easeIn,
        transition: transition);
  }
}
abstract class AppNavigatorPage {
  static void navigateToPage({required BuildContext context,required Widget route}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return route;
        },
      ),
    );
  }
}
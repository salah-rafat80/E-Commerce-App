import 'package:flutter/material.dart';
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
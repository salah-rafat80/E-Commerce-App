import 'package:ecommerce_app/core/resources_manager/shared_styles/colors.dart';
import 'package:flutter/material.dart';

abstract class Notify {
  static SnackBar snackBar({required String text}) =>
      SnackBar(
        dismissDirection: DismissDirection.startToEnd,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
        shape: BeveledRectangleBorder(
          side: const BorderSide(color: Colors.transparent, width: 1.5),
          borderRadius: BorderRadius.circular(20),
        ),
        margin: const EdgeInsetsDirectional.only(start: 10, end: 10, bottom: 2),
        backgroundColor: AppColors.white,
        content:  Text(text),
      );
  static Widget circularProgress() {
    return CircularProgressIndicator(
      backgroundColor: AppColors.white,
      color: AppColors.amberColor,
    );
  }
}
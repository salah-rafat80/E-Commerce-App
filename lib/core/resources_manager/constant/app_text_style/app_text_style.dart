import 'package:ecommerce_app/core/resources_manager/shared_styles/colors.dart';
import 'package:flutter/material.dart';

abstract class AppTextStyle {
  static TextStyle onBordingBodyModel = TextStyle(
    color: AppColors.grey,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );
  static TextStyle onBordingtitleModel =
      TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700);

  static TextStyle styleNextandDoneOnBording =
      TextStyle(fontWeight: FontWeight.w600, color: AppColors.ParadisePink);
}

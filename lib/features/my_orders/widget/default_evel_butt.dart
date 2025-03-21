import 'package:flutter/material.dart';
import '../../../core/resources_manager/shared_styles/colors.dart';
import '../../../core/resources_manager/text_style.dart';

Widget defaultEvelButt({required String title,required Function() onPress}){ {
  return  SizedBox(
    height: 21,
    width: 116,
    child: ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.containColCateSelect,
      ),
      child: Text(
        textAlign: TextAlign.center,
        title,
        style:  AppTextStyles.elevatedButton,
      ),
    ),
  );
}
}
import 'package:ecommerce_app/core/resources_manager/shared_styles/colors.dart';
import 'package:flutter/material.dart';

class DefultButton extends StatelessWidget {
  const DefultButton({
    super.key,
    required this.text,
    required this.ontap,
  });
  final String text;
  final void Function() ontap;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: ontap,
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          backgroundColor: AppColors.ParadisePink,
        ),
      ),
    );
  }
}

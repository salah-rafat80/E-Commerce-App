import 'package:ecommerce_app/features/my_orders/resource/AppConst.dart';
import 'package:flutter/material.dart';

import '../../../core/resources_manager/shared_styles/colors.dart';

class DefaultElevatedButton extends StatelessWidget {
  const DefaultElevatedButton({
    super.key,
    required this.title,
    required this.onPressed,
    required this.containerColor,
    required this.textColor,
    this.heightCont = 30,
    this.width = 109,
  });
  final String title;
  final Function() onPressed;
  final Color containerColor;
  final Color textColor;
  final double heightCont;
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*0.05,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 1, vertical: MediaQuery.of(context).size.height*0.001),
          alignment: AlignmentDirectional.center,
          disabledBackgroundColor: AppColors.black,
          backgroundColor: containerColor,
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
            color: textColor,
            fontSize: 17,
            fontWeight: FontWeight.w500,
            fontFamily: AppConst.fontFamilyLeague,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}

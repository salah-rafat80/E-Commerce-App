import 'package:ecommerce_app/core/localization/app_text.dart';
import 'package:ecommerce_app/core/resources_manager/constant/icons/icons.dart';
import 'package:ecommerce_app/core/resources_manager/constant/padding/padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DefultTextFormFIled extends StatelessWidget {
  const DefultTextFormFIled(
      {super.key,
      required this.lable,
      required this.prefixicon,
      this.sufxIcon,
      required this.controller,
      this.obScure = false});
  final String lable;
  final String prefixicon;
  final Widget? sufxIcon;
  final TextEditingController controller;
  final bool obScure;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obScure,
      decoration: InputDecoration(
        label: Text(
          lable,
          style: TextStyle(color: Color(0xff676767)),
        ),
        prefixIcon: Padding(
          padding: AppPadding.padsyh14,
          child: SvgPicture.asset(
            prefixicon,
          ),
        ),
        suffixIcon: Padding(
          padding: AppPadding.padsyh14,
          child: sufxIcon,
        ),
        prefixIconColor: Color(0xff626262),
        fillColor: Color(0xffF3F3F3),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey, width: 1)),
      ),
    );
  }
}

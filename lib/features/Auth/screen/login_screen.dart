import 'package:ecommerce_app/core/localization/app_text.dart';
import 'package:ecommerce_app/core/resources_manager/constant/icons/icons.dart';
import 'package:ecommerce_app/core/resources_manager/constant/padding/padding.dart';
import 'package:ecommerce_app/core/resources_manager/constant/sizbox/sizbox.dart';
import 'package:ecommerce_app/core/resources_manager/shared_styles/colors.dart';
import 'package:ecommerce_app/core/widget/defult_button.dart';
import 'package:ecommerce_app/core/widget/defult_tetx_form_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: AppPadding.padsyh14,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppText.welcomBack,
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: AppSizBox.sizh30,
            ),
            DefultTextFormFIled(
              controller: _emailController,
              lable: AppText.email,
              prefixicon: AppIcons.email,
            ),
            SizedBox(
              height: AppSizBox.sizh30,
            ),
            DefultTextFormFIled(
              obScure: _isPasswordVisible,
              controller: _passwordController,
              lable: AppText.password,
              prefixicon: AppIcons.lock,
              sufxIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                  icon: _isPasswordVisible
                      ? Icon(Icons.lock)
                      : SvgPicture.asset(AppIcons.eye)),
            ),
            SizedBox(
              height: AppSizBox.sizh30,
            ),
            DefultButton(text: AppText.login, ontap: () {}),
          ],
        ),
      ),
    );
  }
}

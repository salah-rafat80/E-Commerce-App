import 'package:ecommerce_app/core/localization/app_text.dart';
import 'package:ecommerce_app/core/resources_manager/constant/icons/icons.dart';
import 'package:ecommerce_app/core/resources_manager/constant/padding/padding.dart';
import 'package:ecommerce_app/core/resources_manager/constant/sizbox/sizbox.dart';
import 'package:ecommerce_app/core/widget/defult_button.dart';
import 'package:ecommerce_app/core/widget/defult_tetx_form_filed.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confirmPassword = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isPasswordVisibleconfirm = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: AppPadding.padsyh20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppText.creatAnAccount,
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: AppSizBox.sizh30,
              ),
              DefultTextFormFIled(
                controller: _nameController,
                lable: AppText.fullName,
                prefixicon: AppIcons.user,
              ),
              SizedBox(
                height: AppSizBox.sizh10,
              ),
              DefultTextFormFIled(
                controller: _phoneController,
                lable: AppText.phone,
                prefixicon: AppIcons.call,
              ),
              SizedBox(
                height: AppSizBox.sizh10,
              ),
              DefultTextFormFIled(
                controller: _emailController,
                lable: AppText.email,
                prefixicon: AppIcons.email,
              ),
              SizedBox(
                height: AppSizBox.sizh10,
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
                height: AppSizBox.sizh10,
              ),
              DefultTextFormFIled(
                obScure: _isPasswordVisibleconfirm,
                controller: _confirmPassword,
                lable: AppText.password,
                prefixicon: AppIcons.lock,
                sufxIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isPasswordVisibleconfirm = !_isPasswordVisibleconfirm;
                      });
                    },
                    icon: _isPasswordVisibleconfirm
                        ? Icon(Icons.lock)
                        : SvgPicture.asset(AppIcons.eye)),
              ),
              SizedBox(
                height: AppSizBox.sizh10,
              ),
              RichText(
                  text: TextSpan(
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                      children: [
                    TextSpan(text: "By clicking the "),
                    TextSpan(
                      text: "Register",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Add your navigation or action here
                          print("Register clicked!");
                        },
                    ),
                    TextSpan(text: " button, you agree to the public offer"),
                  ])),
              SizedBox(
                height: AppSizBox.sizh10,
              ),
              DefultButton(text: AppText.creatanaccount, ontap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}

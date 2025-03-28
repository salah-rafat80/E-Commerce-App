import 'package:ecommerce_app/core/helper/navigat_to.dart';
import 'package:ecommerce_app/core/resources_manager/constant/icons/icons.dart';
import 'package:ecommerce_app/core/resources_manager/constant/padding/padding.dart';
import 'package:ecommerce_app/core/resources_manager/constant/sizbox/sizbox.dart';
import 'package:ecommerce_app/core/widget/defult_button.dart';
import 'package:ecommerce_app/core/widget/defult_tetx_form_filed.dart';
import 'package:ecommerce_app/features/Auth/manger/cubit.dart';
import 'package:ecommerce_app/features/Auth/manger/state.dart';
import 'package:ecommerce_app/features/Auth/screen/login_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/resources_manager/localization/app_text.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Builder(builder: (context) {
        // var registercubit = AuthCubit.get(context);

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
                    controller: AuthCubit.get(context).nameController,
                    lable: AppText.fullName,
                    prefixicon: AppIcons.user,
                  ),
                  SizedBox(
                    height: AppSizBox.sizh10,
                  ),
                  DefultTextFormFIled(
                    controller: AuthCubit.get(context).phoneController,
                    lable: AppText.phone,
                    prefixicon: AppIcons.call,
                  ),
                  SizedBox(
                    height: AppSizBox.sizh10,
                  ),
                  DefultTextFormFIled(
                    controller: AuthCubit.get(context).emailController,
                    lable: AppText.email,
                    prefixicon: AppIcons.email,
                  ),
                  SizedBox(
                    height: AppSizBox.sizh10,
                  ),
                  DefultTextFormFIled(
                    obScure: AuthCubit.get(context).isPasswordVisible,
                    controller: AuthCubit.get(context).passwordController,
                    lable: AppText.password,
                    prefixicon: AppIcons.lock,
                    sufxIcon: IconButton(
                        onPressed: () {},
                        icon: AuthCubit.get(context).isPasswordVisible
                            ? Icon(Icons.lock)
                            : SvgPicture.asset(AppIcons.eye)),
                  ),
                  SizedBox(
                    height: AppSizBox.sizh10,
                  ),
                  DefultTextFormFIled(
                    obScure: AuthCubit.get(context).isPasswordVisibleconfirm,
                    controller: AuthCubit.get(context).confirmPassword,
                    lable: AppText.password,
                    prefixicon: AppIcons.lock,
                    sufxIcon: IconButton(
                        onPressed: () {},
                        icon: AuthCubit.get(context).isPasswordVisibleconfirm
                            ? Icon(Icons.lock)
                            : SvgPicture.asset(AppIcons.eye)),
                  ),
                  SizedBox(
                    height: AppSizBox.sizh10,
                  ),
                  RichText(
                      text: TextSpan(
                          style:
                              TextStyle(fontSize: 14, color: Colors.grey[700]),
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
                        TextSpan(
                            text: " button, you agree to the public offer"),
                      ])),
                  SizedBox(
                    height: AppSizBox.sizh10,
                  ),
                  BlocConsumer<AuthCubit, AuthState>(
                    listener: (context, state) {
                      if (state is RegisterScuessState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${state.message}'),
                          ),
                        );
                        MyNavigator.navigatTo(
                          screen: LoginScreen(),
                        );
                      } else if (state is RegisterErorrState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${state.error}'),
                          ),
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is RegisterLodinState) {
                        return Center(child: CircularProgressIndicator());
                      } else {
                        return DefultButton(
                            text: AppText.creatanaccount,
                            ontap: () {
                              AuthCubit.get(context).register();
                              if (state is RegisterScuessState) {
                                MyNavigator.navigatTo(
                                  screen: LoginScreen(),
                                );
                              }
                            });
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

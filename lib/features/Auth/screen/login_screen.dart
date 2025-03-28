
import 'package:ecommerce_app/core/resources_manager/constant/icons/icons.dart';
import 'package:ecommerce_app/core/resources_manager/constant/padding/padding.dart';
import 'package:ecommerce_app/core/resources_manager/constant/sizbox/sizbox.dart';
import 'package:ecommerce_app/core/resources_manager/shared_styles/colors.dart';
import 'package:ecommerce_app/features/Auth/manger/cubit.dart';
import 'package:ecommerce_app/features/Auth/manger/state.dart';
import 'package:ecommerce_app/features/Auth/screen/home_test.dart';
import 'package:ecommerce_app/features/Home/views/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/helper/navigat_to.dart';
import '../../../core/resources_manager/localization/app_text.dart';
import '../../../core/widget/defult_button.dart';
import '../../../core/widget/defult_tetx_form_filed.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Builder(builder: (context) {
        // var cubit = AuthCubit.get(context);
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
                  controller: AuthCubit.get(context).emailLoginController,
                  lable: AppText.email,
                  prefixicon: AppIcons.email,
                ),
                SizedBox(
                  height: AppSizBox.sizh30,
                ),
                DefultTextFormFIled(
                  obScure: AuthCubit.getinstance().isPasswordVisible,
                  controller: AuthCubit.get(context).passwordLoginController,
                  lable: AppText.password,
                  prefixicon: AppIcons.lock,
                  sufxIcon: IconButton(
                      onPressed: () {},
                      icon: AuthCubit.getinstance().isPasswordVisible
                          ? Icon(Icons.lock)
                          : SvgPicture.asset(AppIcons.eye)),
                ),
                SizedBox(
                  height: AppSizBox.sizh30,
                ),
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is LoginScuessState) {
                      MyNavigator.navigatTo(screen: MainScreen());

                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('sucess Register')));
                    } else if (state is LoginErorrState) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(state.error)));
                    }
                  },
                  builder: (context, state) {
                    if (state is LoginLodinState) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return DefultButton(
                        text: 'Login',
                        ontap: () {
                          AuthCubit.get(context).login();
                        },
                      );
                    }
                  },
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}

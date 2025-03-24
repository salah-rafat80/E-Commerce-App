import 'package:ecommerce_app/core/helper/navigat_to.dart';
import 'package:ecommerce_app/core/resources_manager/constant/images/images.dart';
import 'package:ecommerce_app/features/Onboarding/on_bording_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../core/resources_manager/shared_styles/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      MyNavigator.navigatTo(
          screen: OnBoardingScreen(), transition: Transition.circularReveal);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.123,
            width: MediaQuery.of(context).size.width * 0.75,
            child: SvgPicture.asset(
              AppImages.splashLogo,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}

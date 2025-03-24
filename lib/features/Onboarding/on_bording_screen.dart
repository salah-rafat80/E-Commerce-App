import 'package:ecommerce_app/core/resources_manager/constant/app_text_style/app_text_style.dart';
import 'package:ecommerce_app/core/resources_manager/constant/images/images.dart';
import 'package:ecommerce_app/core/resources_manager/shared_styles/colors.dart';
import 'package:ecommerce_app/features/Onboarding/get_start_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../core/resources_manager/localization/app_text.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(
      context,
    ).pushReplacement(
        MaterialPageRoute(builder: (_) => const GetStartScreen()));
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SvgPicture.asset(assetName, width: width),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bodyStyle = AppTextStyle.onBordingBodyModel;
    final titleStyle = AppTextStyle.onBordingtitleModel;

    var pageDecoration = PageDecoration(
      titleTextStyle: titleStyle,
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.125,
      ),
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      allowImplicitScrolling: true,
      autoScrollDuration: 3000,
      infiniteAutoScroll: true,
      globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 16, right: 16),
            child: TextButton(
              onPressed: () {
                _onIntroEnd(context);
              },
              child: Text(
                AppText.skip,
                style: TextStyle(color: AppColors.black),
              ),
            ),
          ),
        ),
      ),
      pages: [
        PageViewModel(
          title: AppText.titleOnBordingModel1,
          body: AppText.bodyOnBordingModel1,
          image: _buildImage(AppImages.onboarding1),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: AppText.titleOnBordingModel2,
          body: AppText.bodyOnBordingModel2,
          image: _buildImage(AppImages.onboarding2),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: AppText.titleOnBordingModel3,
          body: (AppText.bodyOnBordingModel3),
          image: _buildImage(AppImages.onboarding3),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () {}, // You can override onSkip callback
      showSkipButton: false,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: true,

      //rtl: true, // Display as right-to-left
      back: const Text(AppText.prev,
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey)),
      //skip:
      next: Text(AppText.next, style: AppTextStyle.styleNextandDoneOnBording),
      done: Text(AppText.done, style: AppTextStyle.styleNextandDoneOnBording),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: AppColors.grey,
        activeSize: Size(40.0, 8.0),
        activeColor: AppColors.black,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  void _onBackToIntro(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const OnBoardingScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("This is the screen after Introduction"),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _onBackToIntro(context),
              child: const Text('Back to Introduction'),
            ),
          ],
        ),
      ),
    );
  }
}

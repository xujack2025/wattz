import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:wattz/core/constants/app_colors.dart';
import 'package:wattz/core/constants/app_media.dart';
import 'package:wattz/core/constants/app_text_styles.dart';
import 'package:wattz/presentation/widgets/navigation_bar/custom_bottom_nav_bar.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(BuildContext context) {
    debugPrint("Navigate to Home");
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (_) => const CustomBottomNavBar()));
  }

  Widget _buildImage(String assetName, [double height = 350]) {
    return Container(
      height: height,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
      child: Image.asset(assetName, height: height, fit: BoxFit.cover),
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    var pageDecoration = PageDecoration(
      titleTextStyle: AppTextStyles.titleLarge,
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.symmetric(horizontal: 16),
      imagePadding: EdgeInsets.only(top: 6),
      imageAlignment: Alignment.bottomCenter,
      pageColor: AppColors.bgColor,
      bodyAlignment: Alignment.topCenter,
      imageFlex: 7,
      bodyFlex: 4,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: AppColors.bgColor,
      autoScrollDuration: 3000,
      infiniteAutoScroll: true,
      animationDuration: 2000,
      globalHeader: AppBar(
        backgroundColor: AppColors.bgColor,
        title: Text("Wattz", style: AppTextStyles.headlineLarge),
        centerTitle: false,
        titleSpacing: 24,
      ),
      pages: [
        PageViewModel(
          title: "Smart Charging, Zero Waiting",
          body: "Search, reserve, and power up. No more queueing at the station.",
          image: _buildImage(AppMedia.welcome1),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Seamless Multi-Payment",
          body: "Pay your way. Supporting cards, \ne-wallets, and quick checkout.",
          image: _buildImage(AppMedia.welcome2),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Charge & Get Rewarded",
          body:
              "Earn points with every session. Turn your kilometers into cashback and perks.",
          image: _buildImage(AppMedia.welcome3),
          decoration: pageDecoration.copyWith(bodyFlex: 3, footerFlex: 1),
          useScrollView: false,
          footer: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.deepDarkBlue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(8),
                    ),
                    textStyle: bodyStyle,
                  ),
                  onPressed: () {
                    _onIntroEnd(context);
                  },
                  child: Text("Done"),
                ),
              ),
            ),
          ),
        ),
      ],
      dotsFlex: 1,
      nextFlex: 0,
      skipOrBackFlex: 0,
      showNextButton: false,
      showDoneButton: false,
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.only(bottom: 32),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        activeSize: Size(30.0, 12.0),
        activeColor: AppColors.deepDarkBlue,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}

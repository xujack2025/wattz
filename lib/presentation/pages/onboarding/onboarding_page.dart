import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
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
    return Image.asset('assets/images/welcome/$assetName', height: height);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    var pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.all(16),
      imageAlignment: Alignment.bottomCenter,
      pageColor: Colors.white,
      bodyAlignment: Alignment.topCenter,
      imageFlex: 5,
      bodyFlex: 3,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      allowImplicitScrolling: true,
      // autoScrollDuration: 3000,
      // infiniteAutoScroll: true,
      // animationDuration: 1500,
      // bodyPadding: EdgeInsets.all(16),
      globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, right: 16),
            child: Text("EZCHARGE"),
          ),
        ),
      ),
      globalFooter: SizedBox(height: 40),
      pages: [
        PageViewModel(
          title: "Schedule your charging",
          body: "Check, Reserve and charge your EV.",
          image: _buildImage('schedule_charging1.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Pay for your charging",
          body: "Pay with any method you prefer.",
          image: _buildImage('schedule_charging2.png'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Earn for your charging",
          image: _buildImage('schedule_charging3.png'),
          decoration: pageDecoration,
          bodyWidget: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Earn points for every sustainable action.",
                style: bodyStyle,
                textAlign: TextAlign.center,
              ),
              Container(
                width: double.infinity,
                // alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(8),
                    ),
                  ),
                  onPressed: () {
                    _onIntroEnd(context);
                  },
                  child: Text("Done"),
                ),
              ),
            ],
          ),
        ),
      ],
      // onDone: () => _onIntroEnd(context),
      // onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      // showSkipButton: false,
      // showBackButton: true,
      showNextButton: false,
      showDoneButton: false,
      //rtl: true, // Display as right-to-left
      // skip: const Text('Skip'),
      // back: const Text('Back'),
      // next: const Icon(Icons.arrow_forward),
      // done: const Text('Done'),
      // curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.only(top: 100),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
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

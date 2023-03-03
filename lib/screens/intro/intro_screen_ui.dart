import 'package:digiyug/screens/category/category_screen.dart';
import 'package:digiyug/util/theme/theme_manager.dart';
import 'package:dx_generator/dx_generator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

@GenerateDxRoute()
class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  OnBoardingPageState createState() => OnBoardingPageState();
}

class OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => CategoryScreen()),
    );
  }

  Widget _buildFullscreenImage() {
    return Image.asset(
      'asset/images/login_bg.png',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('asset/images/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      allowImplicitScrolling: true, autoScrollDuration: 3000,
      rawPages: const [
        IndividualOnboardPage(
            title: "Complete Your Information \nTo Explore",
            svgName: "onBoard1",
            description:
                "To explore us, complete your details to create, \ndownload or to share."),
        IndividualOnboardPage(
            title: "Choose the category you \nwant",
            svgName: "onBoard2",
            description:
                "Choose the specific category for better \nexperience."),
        IndividualOnboardPage(
            title: "Choose Template to design your photo",
            svgName: "onBoard3",
            description:
                "From the given templates available choose the \ntemplate that suits you well."),
        IndividualOnboardPage(
            title: "Share your photo to gain more followers.",
            svgName: "onBoard5",
            description:
                "Digiyug allows you to easily download and share \nphotos anywhere."),
      ],
      showDoneButton: true,
      onSkip: () => _onIntroEnd(context),
      // You can override onSkip callback
      onDone: () => _onIntroEnd(context),
      showSkipButton: true,
      skipOrBackFlex: 1,

      dotsFlex: 3,
      nextFlex: 0,

      rtl: false, // Display as right-to-left
      skip: const Text('Skip',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Color(0xffA21B31),
          )),
      showNextButton: false,
      done: const Text('Go',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Color(0xffA21B31),
          )),
      // showDoneButton: false,
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding:
          kIsWeb ? const EdgeInsets.all(12.0) : const EdgeInsets.all(12),
      dotsDecorator: const DotsDecorator(
        spacing: EdgeInsets.all(8),
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeColor: Color(0xffA21B31),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}

class IndividualOnboardPage extends StatelessWidget {
  const IndividualOnboardPage({
    super.key,
    required this.title,
    required this.svgName,
    required this.description,
  });
  final String title;
  final String svgName;
  final String description;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Get.height * 0.65,
              width: Get.width,
              child: Center(
                child: SvgPicture.asset(
                  'asset/images/$svgName.svg',
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            SizedBox(
              height: Get.height * 0.03,
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: Dimens.font_18sp,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
            Text(
              description,
              style: const TextStyle(
                fontSize: Dimens.font_12sp,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

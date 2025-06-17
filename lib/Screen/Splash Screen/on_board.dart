import 'package:cash_rocket/Screen/Constant%20Data/button_global.dart';
import 'package:cash_rocket/Screen/Constant%20Data/constant.dart';
import 'package:cash_rocket/constant%20app%20information/const_information.dart';
import 'package:cash_rocket/generated/l10n.dart' as lang;
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../Authentication/New Authentication/welcome_screen.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({super.key});

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  PageController pageController = PageController(initialPage: 0);
  int currentIndexPage = 0;
  List<Map<String, dynamic>> getSliderList({required BuildContext context}) {
    List<Map<String, dynamic>> sliderList = [
      {
        "title": lang.S.of(context).welcometoCashRocket,
        // "description": 'Amet minim mollit non deserunt ullamc est sit aliqua dolor amet Velit officia\nconsequat amet minim',
        "description": lang.S.of(context).amentMinim,
        "icon": onBoard1,
      },
      {
        "title": lang.S.of(context).redemYOurPoint,
        // "description": 'Amet minim mollit non deserunt ullamc est sit aliqua dolor amet Velit officia\nconsequat amet minim',
        "description": lang.S.of(context).amentMinim,
        "icon": onBoard2,
      },
      {
        "title": lang.S.of(context).secureYourMoney,
        // "description": 'Amet minim mollit non deserunt ullamc est sit aliqua dolor amet Velit officia\nconsequat amet minim',
        "description": lang.S.of(context).amentMinim,
        "icon": onBoard3,
      },
    ];
    return sliderList;
  }

  List<Map<String, dynamic>> sliderList = [];

  @override
  Widget build(BuildContext context) {
    sliderList = getSliderList(context: context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Stack(
          children: [
            Image(
              image: AssetImage(backgroundImage),
              width: context.width(),
              height: context.height(),
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: PageView.builder(
                itemCount: sliderList.length,
                controller: pageController,
                onPageChanged: (int index) => setState(() => currentIndexPage = index),
                itemBuilder: (_, i) {
                  return Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Container(
                          height: context.height() / 2,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                sliderList[i]['icon'],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 20.0,
                          right: 20.0,
                          top: context.height() / 2.5,
                        ),
                        child: Stack(
                          children: [
                            Image.asset(
                              'images/update/containerBg.png',
                              height: MediaQuery.of(context).size.height / 2.4,
                              width: double.infinity,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const SizedBox(height: 20.0),
                                    Text(
                                      sliderList[i]['title'].toString(),
                                      style: kTextStyle.copyWith(color: kWhite, fontSize: 24, fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 10.0),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 10, left: 10),
                                      child: Text(
                                        sliderList[i]['description'].toString(),
                                        style: kTextStyle.copyWith(color: kWhite.withOpacity(0.7)),
                                        maxLines: 5,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    const SizedBox(height: 30.0),
                                    SmoothPageIndicator(
                                      controller: pageController,
                                      count: 3,
                                      effect: ExpandingDotsEffect(
                                        dotHeight: 5.0,
                                        dotWidth: 5.0,
                                        activeDotColor: kMainColor,
                                        dotColor: kMainColor.withOpacity(0.2),
                                      ),
                                    ),
                                    const SizedBox(height: 25.0),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20, right: 20),
                                      child: ButtonGlobal(
                                          buttontext: lang.S.of(context).next,
                                          buttonDecoration: kButtonDecoration,
                                          onPressed: () {
                                            setState(() {
                                              currentIndexPage < 2;
                                              currentIndexPage < 2
                                                  ? pageController.nextPage(duration: const Duration(microseconds: 3000), curve: Curves.bounceInOut)
                                                  : Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) => const WelcomeScreen(),
                                                      ),
                                                    );
                                            });
                                          }),
                                    ),
                                    const SizedBox(height: 20.0),
                                    Text(
                                      lang.S.of(context).skipForNow,
                                      style: kTextStyle.copyWith(color: kWhite.withOpacity(0.7)),
                                    ).onTap(
                                      () async => const WelcomeScreen().launch(context),
                                    ),
                                    const SizedBox(height: 20.0),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

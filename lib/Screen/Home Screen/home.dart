import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:cash_rocket/Screen/History/mt_history.dart';
import 'package:cash_rocket/Screen/Home%20Screen/Features%20Screen/mt_quiz.dart';
import 'package:cash_rocket/Screen/Profile/mt_profile.dart';
import 'package:cash_rocket/generated/l10n.dart' as lang;
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../Constant Data/constant.dart';
import 'mt_home_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentPage = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    MtQuiz(),
    History(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: _widgetOptions.elementAt(_currentPage),

      ///----------------------------------
      bottomNavigationBar: Container(
        height: 70,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          border: Border(top: BorderSide(color: bottomButtonColor.withOpacity(0.3))),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    _currentPage = 0;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [BoxShadow(color: _currentPage == 0 ? kMainColor.withOpacity(0.2) : Colors.transparent, blurRadius: 12, spreadRadius: 0.0)]),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          FeatherIcons.home,
                          color: _currentPage == 0 ? kMainColor : bottomButtonColor,
                          size: 24,
                        ),
                        Text(lang.S.of(context).home, style: mediumTextStyle.copyWith(color: _currentPage == 0 ? kMainColor : bottomButtonColor)),
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    _currentPage = 1;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [BoxShadow(color: _currentPage == 1 ? kMainColor.withOpacity(0.2) : Colors.transparent, blurRadius: 12, spreadRadius: 2.0)]),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          BootstrapIcons.credit_card,
                          color: _currentPage == 1 ? kMainColor : bottomButtonColor,
                          size: 24,
                        ),
                        Text(lang.S.of(context).quizzes, style: mediumTextStyle.copyWith(color: _currentPage == 1 ? kMainColor : bottomButtonColor)),
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    _currentPage = 2;
                  });
                },
                child: Container(
                  decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [BoxShadow(color: _currentPage == 2 ? kMainColor.withOpacity(0.2) : Colors.transparent, blurRadius: 12, spreadRadius: 2.0)]),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          IconlyLight.document,
                          color: _currentPage == 2 ? kMainColor : bottomButtonColor,
                          size: 24,
                        ),
                        Text(lang.S.of(context).history, style: mediumTextStyle.copyWith(color: _currentPage == 2 ? kMainColor : bottomButtonColor)),
                      ],
                    ),
                  ),
                ),
              ),
              Flexible(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _currentPage = 3;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [BoxShadow(color: _currentPage == 3 ? kMainColor.withOpacity(0.2) : Colors.transparent, blurRadius: 12, spreadRadius: 2.0)]),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            IconlyLight.profile,
                            color: _currentPage == 3 ? kMainColor : bottomButtonColor,
                            size: 24,
                          ),
                          Text(
                            lang.S.of(context).profile,
                            style: mediumTextStyle.copyWith(color: _currentPage == 3 ? kMainColor : bottomButtonColor),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      ///-------------------separate--------------------
      // bottomNavigationBar: BottomBar(
      //   backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      //   items: [
      //     /// Home
      //     BottomBarItem(
      //       icon:  Icon(MdiIcons.home),
      //       title: Text(
      //         lang.S.of(context).home,
      //         style: kTextStyle.copyWith(color: kMainColor),
      //       ),
      //       activeColor: kMainColor,
      //       inactiveColor: kMainColor.withOpacity(0.5),
      //     ),
      //
      //     /// Orders
      //     BottomBarItem(
      //       backgroundColorOpacity: 0.1,
      //       icon: const Icon(BootstrapIcons.chat_dots),
      //       title: Text(lang.S.of(context).quizzes,
      //         style: kTextStyle.copyWith(color: kMainColor),
      //       ),
      //       activeColor: kMainColor,
      //       inactiveColor: kMainColor.withOpacity(0.5),
      //     ),
      //
      //     /// History
      //     BottomBarItem(
      //       icon:  Icon(MdiIcons.textBox),
      //       title: Text(
      //         lang.S.of(context).history,
      //         style: kTextStyle.copyWith(color: kMainColor),
      //       ),
      //       activeColor: kMainColor,
      //       inactiveColor: kMainColor.withOpacity(0.5),
      //     ),
      //
      //     /// Profile
      //     BottomBarItem(
      //       icon: const Icon(Icons.person_outline),
      //       title:  Text(lang.S.of(context).profile),
      //       activeColor: kMainColor,
      //       inactiveColor: kMainColor.withOpacity(0.5),
      //     ),
      //   ],
      //   onTap: (int index) {
      //     setState(() => _currentPage = index);
      //   },
      //   selectedIndex: _currentPage,
      // ),
    );
  }
}

class Style extends StyleHook {
  @override
  double get activeIconSize => 31;

  @override
  double get activeIconMargin => 15;

  @override
  double get iconSize => 25;
  @override
  TextStyle textStyle(Color color, fontFamily) {
    return TextStyle(fontSize: 14, color: color);
  }
}

// ignore_for_file: unused_result

import 'dart:async';

import 'package:cash_rocket/Model/user_profile_model.dart';
import 'package:cash_rocket/Provider/database_provider.dart';
import 'package:cash_rocket/Provider/profile_provider.dart';
import 'package:cash_rocket/Screen/Constant%20Data/main_button.dart';
import 'package:cash_rocket/constant%20app%20information/const_information.dart';
import 'package:cash_rocket/generated/l10n.dart' as lang;
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../Repositories/rewards_repo.dart';
import '../../../Videos/Admob/admob.dart';
import '../../../test/src/core/core.dart';
import '../../../test/src/indicators/indicators.dart';
import '../../../test/src/wheel/wheel.dart';
import '../../Constant Data/constant.dart';
import '../home.dart';
import '../no_internet_screen.dart';

class Wheel extends StatefulWidget {
  const Wheel({super.key});

  @override
  State<Wheel> createState() => _WheelState();
}

class _WheelState extends State<Wheel> {
  StreamController<int> selected = StreamController<int>();
  Future<void> checkInternet() async {
    bool result = await InternetConnection().hasInternetAccess;
    if (!result && mounted) {
      NoInternetScreen(screenName: widget).launch(context);
    }
  }

  @override
  void dispose() {
    selected.close();
    super.dispose();
  }

  @override
  void initState() {
    checkInternet();
    admob.createRewardedAd();
    admob.createInterstitialAd();
    super.initState();
  }

  bool isBalanceShow = false;
  Admob admob = Admob();

  void showRewardPopUp(String amount) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
              height: 135,
              decoration: BoxDecoration(
                border: Border.all(color: kWhite.withOpacity(0.3)),
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xff0E3E7B),
                  ),
                  BoxShadow(
                    color: Color(0xff262450),
                    spreadRadius: 0.0,
                    blurRadius: 16.0,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            lang.S.of(context).congratulations,
                            style: kTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14.0),
                          ),
                          const SizedBox(height: 5.0),
                          Text(
                            '$amount ${lang.S.of(context).pointRecived}',
                            style: kTextStyle.copyWith(color: Colors.white),
                            maxLines: 2,
                          ),
                          const SizedBox(height: 20.0),
                          Container(
                            padding: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              gradient: buttonGradiant,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                              child: Text(
                                lang.S.of(context).ok,
                                style: kTextStyle.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ).onTap(() => {
                                finish(context),
                                const Home().launch(context),
                              })
                        ],
                      ),
                    ),
                    Expanded(child: Image.asset('images/gotReward.png'))
                  ],
                ),
              ),
            ),
          );
        });
  }

  bool isChecked = true;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, watch) {
        AsyncValue<UserProfileModel> userInfo = ref.watch(personalProfileProvider);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              lang.S.of(context).wheel,
              // 'Wheel',
              style: mediumTextStyle.copyWith(fontSize: 18),
            ),
            toolbarHeight: 90,
            iconTheme: const IconThemeData(color: kWhite),
            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))),
            flexibleSpace: Container(
              decoration: BoxDecoration(gradient: containerGradiant, borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isBalanceShow = !isBalanceShow;
                    });
                  },
                  behavior: HitTestBehavior.translucent,
                  child: Container(
                    height: 32,
                    width: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Colors.white.withOpacity(0.3),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.4),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AnimatedOpacity(
                          opacity: !isBalanceShow ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 1000),
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: kBalanceGradiant,
                            ),
                            child: const Icon(
                              FeatherIcons.dollarSign,
                              size: 15.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(width: 5.0),
                        userInfo.when(data: (info) {
                          return Text(
                            isBalanceShow ? '\$${info.data?.user?.wallet?.balance ?? ''}' : lang.S.of(context).balance,
                            style: kTextStyle.copyWith(color: Colors.white),
                          );
                        }, error: (e, stack) {
                          return Text(
                            e.toString(),
                            style: kTextStyle.copyWith(color: Colors.white),
                          );
                        }, loading: () {
                          return Container();
                        }),
                        const SizedBox(width: 5.0),
                        AnimatedOpacity(
                          opacity: isBalanceShow ? 1.0 : 0.0,
                          duration: const Duration(milliseconds: 1000),
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: kBalanceGradiant,
                            ),
                            child: const Icon(
                              FeatherIcons.dollarSign,
                              size: 15.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xff0E3E7B),
                          ),
                          BoxShadow(
                            color: Color(0xff262450),
                            spreadRadius: 0.0,
                            blurRadius: 16.0,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            lang.S.of(context).spinTheWheel,
                            style: kTextStyle.copyWith(color: kWhite, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5.0),
                          Text(
                            lang.S.of(context).pressTheSpinWheel,
                            style: kTextStyle.copyWith(color: kLightTextColor),
                          ),
                          const SizedBox(height: 5.0),
                          Text(
                            //"Entry Fee: $spinFee",
                            "${lang.S.of(context).entryFee}: $spinFee",
                            style: kTextStyle.copyWith(color: kLightTextColor),
                          ),
                          Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Container(
                                height: context.height() / 2.2,
                                width: 340,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('images/wheelbanner.png'),
                                  ),
                                ),
                              ),
                              userInfo.when(data: (info) {
                                return GestureDetector(
                                  onTap: () async {
                                    if (spinFee.toInt() < (info.data?.user?.wallet?.balance ?? 0)) {
                                      // EasyLoading.show(status: "Charging Entry fee");
                                      EasyLoading.show(status: lang.S.of(context).chargingEntryFee);
                                      //await RewardRepo().removePoint(spinFee, 'Spin Wheel Entry fee');
                                      await RewardRepo().removePoint(spinFee, lang.S.of(context).spinWheelEntryFee);
                                      EasyLoading.dismiss();
                                      //DataBase().saveString('spinTime', DateTime.now().toString());
                                      DataBase().saveString(lang.S.of(context).spinTime, DateTime.now().toString());
                                      int se = Fortune.randomInt(0, spinData.length);
                                      selected.add(se);
                                      await Future.delayed(const Duration(seconds: 5));
                                      try {
                                        //EasyLoading.show(status: 'Getting rewards');
                                        EasyLoading.show(status: lang.S.of(context).gettingRewards);
                                        //var response = await RewardRepo().addPoint(spinData[se], 'Spin Wheel Video Ads');
                                        var response = await RewardRepo().addPoint(spinData[se], lang.S.of(context).spinWheelVideoAds);
                                        if (response) {
                                          showRewardPopUp(spinData[se]);
                                          //EasyLoading.showSuccess('You Have Earned ${spinData[se]} Coins');
                                          EasyLoading.showSuccess('${lang.S.of(context).youHaveEarned} ${spinData[se]} ${lang.S.of(context).coins}');
                                          admob.showInterstitialAd();
                                          ref.refresh(personalProfileProvider);
                                        } else {
                                          // EasyLoading.showError('Error Happened. Try Again');
                                          EasyLoading.showError(lang.S.of(context).errorHappenedTryAgain);
                                        }
                                      } catch (e) {
                                        EasyLoading.showError(e.toString());
                                      }
                                    } else {
                                      //EasyLoading.showError("Not enough Balance");
                                      EasyLoading.showError(lang.S.of(context).notEnoughBalance);
                                    }
                                  },
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 200,
                                        width: 200,
                                        child: FortuneWheel(
                                          animateFirst: false,
                                          selected: selected.stream,
                                          indicators: const <FortuneIndicator>[
                                            FortuneIndicator(
                                              alignment: Alignment.topCenter,
                                              // <-- changing the position of the indicator
                                              child: TriangleIndicator(
                                                color: Colors.yellow, // <-- changing the color of the indicator
                                              ),
                                            ),
                                          ],
                                          items: [
                                            for (var it in spinData)
                                              FortuneItem(
                                                child: Text(it),
                                                style: const FortuneItemStyle(
                                                  color: kMainColor,
                                                  borderColor: Colors.yellow,
                                                  borderWidth: 3,
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }, error: (e, stack) {
                                return Text(
                                  e.toString(),
                                  style: kTextStyle.copyWith(color: Colors.white),
                                );
                              }, loading: () {
                                return Container();
                              }),
                            ],
                          ),
                          const SizedBox(height: 50.0),
                          PrimaryButton(
                              buttonText: lang.S.of(context).watchVideoAndEarn,
                              onpressed: () {
                                admob.showRewardedAd(ref: ref);
                              }),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

import 'package:bitlabs/bitlabs.dart';
import 'package:cash_rocket/Model/user_profile_model.dart';
import 'package:cash_rocket/constant%20app%20information/const_information.dart';
import 'package:cash_rocket/generated/l10n.dart' as lang;
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_pollfish/flutter_pollfish.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Model/purchase_model.dart';
import '../../Repositories/rewards_repo.dart';
import '../Constant Data/constant.dart';

class SurveyScreen extends StatefulWidget {
  const SurveyScreen({super.key, required this.profile});
  final UserProfileModel profile;

  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  bool isBalanceShow = false;

  String _logText = '';

  bool _showButton = false;
  bool _completedSurvey = false;
  int _currentIndex = 0;
  int _cpa = 0;

  @override
  void initState() {
    super.initState();
    initPollfish();
    initBitlabs();
  }

  @override
  void dispose() {
    FlutterPollfish.instance.removeListeners();
    super.dispose();
  }

  //Bitlab Integration
  void initBitlabs() {
    BitLabs.instance.init(appToken, widget.profile.data?.user?.id.toString() ?? "user");

    BitLabs.instance.setOnReward((reward) async {
      if (reward > 0) {
        try {
          // EasyLoading.show(status: 'Getting rewards');
          EasyLoading.show(status: lang.S.of(context).gettingRewards);
          bool isValid = await PurchaseModel().isActiveBuyer();
          if (isValid) {
            //var response = await RewardRepo().addPoint(reward.toString(), 'Bitlabs Survey');
            var response = await RewardRepo().addPoint(reward.toString(), lang.S.of(context).bitlabsSurvey);
            if (response) {
              //EasyLoading.showSuccess('You Have Earned $reward Coins');
              EasyLoading.showSuccess('${lang.S.of(context).youHaveEarned} $reward ${lang.S.of(context).coins}');
            } else {
              //EasyLoading.showError('Error Happened. Try Again');
              EasyLoading.showError(lang.S.of(context).errorHappenedTryAgain);
            }
          } else {
            // EasyLoading.showError('Please check your purchase code');
            EasyLoading.showError(lang.S.of(context).pleaseCheckYourPurchaseCode);
          }
        } catch (e) {
          EasyLoading.showError(e.toString());
        }
      }
    });
  }

  Future<void> initPollfish() async {
    String logText = 'Initializing Pollfish...';

    _showButton = false;
    _completedSurvey = false;

    // Note: If you are targeting iOS 14+ devices please keep in mind that Pollfish surveys can work
    // with or without the IDFA permission on iOS 14+. If no permission is granted in the ATT popup,
    // the SDK will serve non personalized surveys to the user. In that scenario the conversion is expected to be lower.
    // Offerwall integrations perform better compared to single survey integrations when no IDFA permission is given
    // We recommend requesting IDFA usage permission prior to Pollfish initialization.

    FlutterPollfish.instance.init(androidApiKey: androidApiKey, iosApiKey: iOSApiKey, rewardMode: true, releaseMode: releaseMode);

    FlutterPollfish.instance.setPollfishSurveyReceivedListener(onPollfishSurveyReceived);

    FlutterPollfish.instance.setPollfishSurveyCompletedListener(onPollfishSurveyCompleted);

    FlutterPollfish.instance.setPollfishOpenedListener(onPollfishOpened);

    FlutterPollfish.instance.setPollfishClosedListener(onPollfishClosed);

    FlutterPollfish.instance.setPollfishSurveyNotAvailableListener(onPollfishSurveyNotAvailable);

    FlutterPollfish.instance.setPollfishUserRejectedSurveyListener(onPollfishUserRejectedSurvey);

    FlutterPollfish.instance.setPollfishUserNotEligibleListener(onPollfishUserNotEligible);

    setState(() {
      _logText = logText;
    });
  }

  // Pollfish notification functions

  void onPollfishSurveyReceived(SurveyInfo? surveyInfo) => setState(() {
        if (surveyInfo == null) {
          _logText = 'Offerwall Ready';
        } else {
          _logText = 'Survey Received: - ${surveyInfo.toString().replaceAll("\n", " ")}';
          _cpa = surveyInfo.surveyCPA ?? 0;
        }

        if (kDebugMode) {
          print(_logText);
        }

        _completedSurvey = false;
        _showButton = true;
      });

  void onPollfishSurveyCompleted(SurveyInfo? surveyInfo) => setState(() async {
        _logText = 'Survey Completed: - ${surveyInfo.toString()}';
        // EasyLoading.showSuccess("Survey Completed. Will be rewarded soon");
        EasyLoading.showSuccess(lang.S.of(context).surveyCompletedWillBeRewardedSoon);
        if (kDebugMode) {
          print(_logText);
        }
        _showButton = false;
        _completedSurvey = true;
        try {
          //EasyLoading.show(status: 'Getting rewards');
          EasyLoading.show(status: lang.S.of(context).gettingRewards);
          bool isValid = await PurchaseModel().isActiveBuyer();
          if (isValid) {
            //var response = await RewardRepo().addPoint(_cpa.toString(), 'Pollfish Survey');
            var response = await RewardRepo().addPoint(_cpa.toString(), lang.S.of(context).pollfishSurvey);
            if (response) {
              //EasyLoading.showSuccess('You Have Earned $_cpa Coins');
              EasyLoading.showSuccess('${lang.S.of(context).youHaveEarned} $_cpa ${lang.S.of(context).coins}');
            } else {
              // EasyLoading.showError('Error Happened. Try Again');
              EasyLoading.showError(lang.S.of(context).errorHappenedTryAgain);
            }
          } else {
            //EasyLoading.showError('Please check your purchase code');
            EasyLoading.showError(lang.S.of(context).pleaseCheckYourPurchaseCode);
          }
        } catch (e) {
          EasyLoading.showError(e.toString());
        }
      });

  void onPollfishOpened() => setState(() {
        _logText = 'Survey Panel Open';

        if (kDebugMode) {
          print(_logText);
        }
      });

  void onPollfishClosed() => setState(() {
        _logText = 'Survey Panel Closed';
        // EasyLoading.showError("Survey Panel Closed");
        EasyLoading.showError(lang.S.of(context).surveyPanelClosed);
        if (kDebugMode) {
          print(_logText);
        }
      });

  void onPollfishSurveyNotAvailable() => setState(() {
        _logText = 'Survey Not Available';
        //EasyLoading.showError("Survey Not Available");
        EasyLoading.showError(lang.S.of(context).surveyNotAvailable);
        if (kDebugMode) {
          print(_logText);
        }

        _showButton = false;
        _completedSurvey = false;
      });

  void onPollfishUserRejectedSurvey() => setState(() {
        _logText = 'User Rejected Survey';
        // EasyLoading.showError("You Rejected this survey");
        EasyLoading.showError(lang.S.of(context).userRejectedSurvey);
        if (kDebugMode) {
          print(_logText);
        }

        if (_currentIndex == 1) {
          _showButton = false;
          _completedSurvey = false;
        }
      });

  void onPollfishUserNotEligible() => setState(() {
        _logText = 'User Not Eligible';
        // EasyLoading.showError("You are not eligible for this survey");
        EasyLoading.showError(lang.S.of(context).youAreNotEligibleForThisSurvey);
        if (kDebugMode) {
          print(_logText);
        }

        if (_currentIndex == 1) {
          _showButton = false;
          _completedSurvey = false;
        }
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        toolbarHeight: 90,
        iconTheme: const IconThemeData(color: Colors.white),
        flexibleSpace: Container(
          decoration: BoxDecoration(borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)), gradient: containerGradiant),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30.0),
            bottomLeft: Radius.circular(30.0),
          ),
        ),
        backgroundColor: kMainColor,
        elevation: 0.0,
        title: Text(
          lang.S.of(context).survey,
          style: kTextStyle.copyWith(color: Colors.white),
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
                    Text(
                      isBalanceShow ? widget.profile.data?.user?.wallet?.balance.toString() ?? "user" : lang.S.of(context).balance,
                      style: kTextStyle.copyWith(color: Colors.white),
                    ),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: () async {
                  await launchUrl(Uri.parse("$inbrainUrl${widget.profile.data?.user?.id}"), mode: LaunchMode.inAppBrowserView);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xff0E3E7B),
                      ),
                      BoxShadow(
                        color: Color(0xff262450),
                        spreadRadius: 0.0,
                        blurRadius: 10.0,
                      ),
                    ],
                  ),
                  child: ListTile(
                    visualDensity: const VisualDensity(horizontal: -1),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    leading: Image.asset(
                      'images/b1.png',
                      height: 40,
                      width: 40,
                    ),
                    title: Text(
                      lang.S.of(context).inbrain,
                      //'Inbrain',
                      style: const TextStyle(fontWeight: FontWeight.w500, color: kWhite),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                      color: kLightTextColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  BitLabs.instance.launchOfferWall(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xff0E3E7B),
                      ),
                      BoxShadow(
                        color: Color(0xff262450),
                        spreadRadius: 0.0,
                        blurRadius: 10.0,
                      ),
                    ],
                  ),
                  child: ListTile(
                    visualDensity: const VisualDensity(horizontal: -1),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    leading: Image.asset(
                      'images/b2.png',
                      height: 40,
                      width: 40,
                    ),
                    title: Text(
                      lang.S.of(context).bitrise,
                      //'Bitrise',
                      style: const TextStyle(fontWeight: FontWeight.w500, color: kWhite),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                      color: kLightTextColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  if (_showButton && !_completedSurvey) {
                    FlutterPollfish.instance.show();
                  } else {
                    EasyLoading.showInfo(_logText);
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xff0E3E7B),
                      ),
                      BoxShadow(
                        color: Color(0xff262450),
                        spreadRadius: 0.0,
                        blurRadius: 10.0,
                      ),
                    ],
                  ),
                  child: ListTile(
                    visualDensity: const VisualDensity(horizontal: -1),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    leading: Image.asset(
                      'images/b3.png',
                      height: 40,
                      width: 40,
                    ),
                    title: Text(
                      lang.S.of(context).pollfish,
                      //'Pollfish',
                      style: const TextStyle(fontWeight: FontWeight.w500, color: kWhite),
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 18,
                      color: kLightTextColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

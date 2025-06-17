import 'package:cash_rocket/Model/quiz_model.dart';
import 'package:cash_rocket/Provider/profile_provider.dart';
import 'package:cash_rocket/Repositories/rewards_repo.dart';
import 'package:cash_rocket/Screen/Home%20Screen/Features%20Screen/Quiz/mt_football.dart';
import 'package:cash_rocket/constant%20app%20information/const_information.dart';
import 'package:cash_rocket/generated/l10n.dart' as lang;
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../Model/user_profile_model.dart';
import '../../../Provider/database_provider.dart';
import '../../../constant app information/const_commas.dart';
import '../../Authentication/log_in.dart';
import '../../Constant Data/constant.dart';
import '../no_internet_screen.dart';

class MtQuiz extends StatefulWidget {
  const MtQuiz({super.key});

  @override
  State<MtQuiz> createState() => _MtQuizState();
}

class _MtQuizState extends State<MtQuiz> {
  void showPopUp(String amount, Quizzes quizzes) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: Container(
            height: 305,
            decoration: BoxDecoration(
              // border: Border.all(color: kWhite.withOpacity(0.3)),
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
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    lang.S.of(context).areYouAgree,
                    style: kTextStyle.copyWith(color: kWhite, fontWeight: FontWeight.bold, fontSize: 18.0),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    //'If you play this quiz then $amount points will be deducted!',
                    '${lang.S.of(context).ifYouPlayThisQuizThen} $amount ${lang.S.of(context).pointsWillBeDeducted}',
                    style: kTextStyle.copyWith(color: kLightTextColor),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4.0),
                  Container(
                    height: 150,
                    width: 140,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/coin.png'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: kMainColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                lang.S.of(context).yes,
                                style: kTextStyle.copyWith(
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ).onTap(() async {
                            try {
                              //EasyLoading.show(status: 'Loading');
                              EasyLoading.show(status: lang.S.of(context).loading);
                              //bool status = await RewardRepo().removePoint(amount, 'Paid Quiz Play');
                              bool status = await RewardRepo().removePoint(amount, lang.S.of(context).paidQuizPlay);
                              if (status && mounted) {
                                //EasyLoading.showSuccess('Successful');
                                EasyLoading.showSuccess(lang.S.of(context).successful);
                                MtFootball(
                                  quizzes: quizzes,
                                ).launch(context);
                              } else {
                                //EasyLoading.showError('Not Enough Coin');
                                EasyLoading.showError(lang.S.of(context).notEnoughCoin);
                              }
                            } catch (e) {
                              EasyLoading.showError(e.toString());
                            }
                          }),
                        ),
                        const SizedBox(width: 5.0),
                        Expanded(
                          flex: 2,
                          child: Container(
                            decoration: BoxDecoration(border: Border.all(color: kGreyTextColor.withOpacity(0.5)), borderRadius: BorderRadius.circular(30.0), color: Colors.transparent),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                lang.S.of(context).No,
                                style: kTextStyle.copyWith(color: kGreyTextColor),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ).onTap(() => finish(context)),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void showRewardsPopUp() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
              height: 150,
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
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            lang.S.of(context).winner,
                            style: kTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18.0),
                          ),
                          const SizedBox(height: 10.0),
                          Text(
                            lang.S.of(context).youHaveAlreadyWonThisQuizTryPlayingOtherQuiz,
                            // 'You have already won this quiz. Try playing other quiz',
                            style: kTextStyle.copyWith(color: Colors.white, fontSize: 14.0),
                            maxLines: 2,
                          ),
                          const SizedBox(height: 10.0),
                          Container(
                            padding: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              gradient: buttonGradiant,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                              child: Text(
                                lang.S.of(context).ok,
                                style: kTextStyle.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ).onTap(() => {
                                finish(context),
                              })
                        ],
                      ),
                    ),
                    Expanded(
                        child: Image.asset(
                      'images/gotReward.png',
                      height: 125,
                    ))
                  ],
                ),
              ),
            ),
          );
        });
  }

  List<Color> colorList = [
    const Color(0xFFFF7288),
    const Color(0xFF8555EA),
    const Color(0xFF2F81E8),
    const Color(0xFFFF8244),
  ];

  bool isBalanceShow = false;

  Future<void> checkInternet() async {
    // bool result = await InternetConnectionChecker().hasConnection;
    bool result = await InternetConnection().hasInternetAccess;
    if (!result && mounted) {
      NoInternetScreen(screenName: widget).launch(context);
    }
  }

  @override
  void initState() {
    checkInternet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (_, ref, watch) {
      AsyncValue<UserProfileModel> userInfo = ref.watch(personalProfileProvider);
      AsyncValue<QuizModel> allQuiz = ref.watch(quizProvider);
      return userInfo.when(data: (info) {
        if (info.data?.user?.status == 0) {
          DataBase().deleteToken();
          // EasyLoading.showError('You Are Disable!');
          EasyLoading.showError(lang.S.of(context).youAreDisable);

          const LogIn().launch(context, isNewTask: true);
        }
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 90,
            iconTheme: const IconThemeData(color: Colors.white),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: containerGradiant,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
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
              lang.S.of(context).quiz,
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
                          isBalanceShow ? myFormat.format(info.data?.user?.wallet?.balance) : lang.S.of(context).balance,
                          style: mediumTextStyle,
                          textAlign: TextAlign.start,
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
          body: allQuiz.when(data: (quiz) {
            return quiz.data!.categoryQuiz!.isNotEmpty
                ? RefreshIndicator(
                    onRefresh: () async => ref.refresh(quizProvider),
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                        child: Column(
                          children: [
                            ListView.builder(
                                itemCount: quiz.data?.categoryQuiz?.length ?? 0,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (_, i) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 10.0),
                                    child: Theme(
                                      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                                      child: ExpansionTile(
                                        initiallyExpanded: i == 0 ? true : false,
                                        iconColor: Colors.white,
                                        tilePadding: const EdgeInsets.symmetric(horizontal: 10),
                                        collapsedIconColor: kWhite,
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                        collapsedBackgroundColor: colorList[i % 4],
                                        backgroundColor: colorList[i % 4],
                                        title: Text(
                                          quiz.data!.categoryQuiz![i].name ?? '',
                                          style: kTextStyle.copyWith(color: Colors.white),
                                        ),
                                        leading: CircleAvatar(
                                          radius: 20,
                                          backgroundColor: Colors.transparent,
                                          backgroundImage: NetworkImage(
                                            quiz.data!.categoryQuiz![i].image ?? '',
                                          ),
                                        ),
                                        children: [
                                          ListView.builder(
                                              itemCount: quiz.data?.categoryQuiz?[i].quizzes?.length ?? 0,
                                              shrinkWrap: true,
                                              physics: const NeverScrollableScrollPhysics(),
                                              itemBuilder: (_, index) {
                                                return Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius: const BorderRadius.only(bottomRight: Radius.circular(10), bottomLeft: Radius.circular(10)),
                                                    color: Theme.of(context).colorScheme.primaryContainer,
                                                  ),
                                                  child: ListTile(
                                                    onTap: () async {
                                                      try {
                                                        // EasyLoading.show(status: 'Loading...');
                                                        EasyLoading.show(status: '${lang.S.of(context).loading}...');
                                                        var status = await RewardRepo().checkQuiz(quiz.data!.categoryQuiz![i].quizzes![index].id.toString());
                                                        if (status.data!.userQuiz!.winStatus == '0' && status.data!.userQuiz!.resultStatus == '3') {
                                                          // EasyLoading.showError('You are retaking the quiz...');
                                                          EasyLoading.showError('${lang.S.of(context).youAreRetakingTheQuiz}...');
                                                          showPopUp(quiz.data!.categoryQuiz![i].quizzes![index].freeOrPaid.toString(), quiz.data!.categoryQuiz![i].quizzes![index]);
                                                        } else if (status.data!.userQuiz!.winStatus == '1' && status.data!.userQuiz!.resultStatus == '1') {
                                                          //EasyLoading.showError('Already Played...');
                                                          EasyLoading.showError('${lang.S.of(context).alreadyPlayed}...');
                                                          showRewardsPopUp();
                                                        }
                                                      } catch (e) {
                                                        // EasyLoading.showSuccess('Successful');
                                                        EasyLoading.showSuccess(lang.S.of(context).successful);
                                                        if (quiz.data!.categoryQuiz![i].quizzes![index].paidStatus == 0) {
                                                          MtFootball(
                                                            quizzes: quiz.data!.categoryQuiz![i].quizzes![index],
                                                          ).launch(context);
                                                        } else {
                                                          showPopUp(quiz.data!.categoryQuiz![i].quizzes![index].freeOrPaid.toString(), quiz.data!.categoryQuiz![i].quizzes![index]);
                                                        }
                                                      }
                                                    },
                                                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                                                    leading: CircleAvatar(
                                                      backgroundColor: kMainColor.withOpacity(0.1),
                                                      radius: 20,
                                                      backgroundImage: NetworkImage(
                                                        quiz.data!.categoryQuiz![i].quizzes![index].image ?? '',
                                                      ),
                                                    ),
                                                    title: Text(
                                                      quiz.data!.categoryQuiz![i].quizzes![index].name ?? '',
                                                      style: kTextStyle.copyWith(color: kWhite, fontWeight: FontWeight.bold),
                                                    ),
                                                    subtitle: Text(
                                                      '${lang.S.of(context).entryFee}: ${quiz.data!.categoryQuiz![i].quizzes![index].paidStatus == 0 ? lang.S.of(context).free : quiz.data!.categoryQuiz![i].quizzes![index].freeOrPaid.toString()} || ${lang.S.of(context).rewardPoint}: ${quiz.data!.categoryQuiz![i].quizzes![index].rewardPoint}',
                                                      style: kTextStyle.copyWith(color: kLightTextColor),
                                                    ),
                                                    trailing: Icon(FeatherIcons.chevronRight, color: kLightTextColor),
                                                  ),
                                                );
                                              })
                                        ],
                                      ),
                                    ),
                                  );
                                })
                          ],
                        ),
                      ),
                    ),
                  )
                : Center(
                    child: Text(lang.S.of(context).noQuizFound),
                  );
          }, error: (e, stack) {
            return Center(
              child: Text(e.toString()),
            );
          }, loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
        );
      }, error: (e, stack) {
        if (kDebugMode) {
          print(stack);
        }
        return Center(
          child: Text(stack.toString()),
        );
      }, loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      });
    });
  }
}

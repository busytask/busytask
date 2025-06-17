import 'package:cash_rocket/Model/quiz_model.dart';
import 'package:cash_rocket/Screen/Constant%20Data/global_contanier.dart';
import 'package:cash_rocket/Screen/Home%20Screen/Features%20Screen/Quiz/mt_football.dart';
import 'package:cash_rocket/constant%20app%20information/const_information.dart';
import 'package:cash_rocket/generated/l10n.dart' as lang;
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../Repositories/rewards_repo.dart';
import '../../../Constant Data/constant.dart';
import '../../home.dart';

class MtLoser extends StatefulWidget {
  const MtLoser({super.key, required this.quizzes, required this.score});
  final Quizzes quizzes;
  final String score;
  @override
  State<MtLoser> createState() => _MtLoserState();
}

class _MtLoserState extends State<MtLoser> {
  void showPopUp(String retakePoint) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: SizedBox(
            height: 320,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    lang.S.of(context).areYouAgree,
                    style: kTextStyle.copyWith(color: kWhite, fontWeight: FontWeight.bold, fontSize: 18.0),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    //'If you retake then $retakePoint points will be deducted!',
                    '${lang.S.of(context).ifYouRetakeThen} $retakePoint ${lang.S.of(context).pointsWillBeDeducted}',
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
                              // bool status = await RewardRepo().removePoint(retakePoint, 'Paid For Quiz Retake');
                              bool status = await RewardRepo().removePoint(retakePoint, lang.S.of(context).paidForQuizRetake);
                              if (status && mounted) {
                                // EasyLoading.showSuccess('Successful');
                                EasyLoading.showSuccess(lang.S.of(context).successful);
                                MtFootball(
                                  quizzes: widget.quizzes,
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

  final InAppReview _inAppReview = InAppReview.instance;
  String select = '';

  List<String> option = [
    'Share Score',
    'Rate Us',
    'Home',
  ];

  void review() async {
    if (await _inAppReview.isAvailable()) {
      _inAppReview.requestReview();
    } else {
      //toast('Review Not Available');
      toast(lang.S.of(context).reviewNotAvailable);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: GlobalContainer(
          column: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              Text(
                lang.S.of(context).sorry,
                style: kTextStyle.copyWith(color: kLightTextColor),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5.0),
              Text(
                lang.S.of(context).youLose,
                style: kTextStyle.copyWith(color: kWhite, fontWeight: FontWeight.bold, fontSize: 20.0),
                textAlign: TextAlign.center,
              ),
              Container(
                height: 170,
                width: 170,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/lose.png'),
                  ),
                ),
              ),
              Text(
                lang.S.of(context).loser,
                //'Loser',
                style: kTextStyle.copyWith(color: kWhite, fontSize: 18.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.0), gradient: const LinearGradient(colors: [Color(0xffF58592), Color(0xff7420E7)])),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(FeatherIcons.check, size: 16.0, color: Colors.white),
                              const SizedBox(width: 4.0),
                              Text(
                                '${widget.score}/${widget.quizzes.questions!.length}',
                                style: kTextStyle.copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.0), gradient: const LinearGradient(colors: [Color(0xffFF835B), Color(0xffFA3232)])),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(FeatherIcons.x, color: Colors.white, size: 16.0),
                              const SizedBox(width: 4.0),
                              Text(
                                '${widget.quizzes.questions!.length - widget.score.toInt()}/${widget.quizzes.questions!.length}',
                                style: kTextStyle.copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: CircularPercentIndicator(
                      radius: 40.0,
                      progressColor: kMainColor,
                      circularStrokeCap: CircularStrokeCap.round,
                      lineWidth: 5.0,
                      animation: true,
                      percent: (widget.score.toInt() / widget.quizzes.questions!.length),
                      center: Text(
                        "${((widget.score.toInt() / widget.quizzes.questions!.length) * 100).toInt()}%",
                        style: const TextStyle(color: kWhite, fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.0), gradient: const LinearGradient(colors: [Color(0xffFFCB72), Color(0xffFD5A08)])),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(FeatherIcons.award, color: Colors.white, size: 16.0),
                              const SizedBox(width: 4.0),
                              Text(
                                widget.quizzes.rewardPoint.toString(),
                                style: kTextStyle.copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.0), gradient: const LinearGradient(colors: [Color(0xff6CFF7E), Color(0xff02A315)])),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(FeatherIcons.database, color: Colors.white, size: 16.0),
                              const SizedBox(width: 4.0),
                              Text(
                                widget.quizzes.questions!.length.toString(),
                                style: kTextStyle.copyWith(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30.0),
              GestureDetector(
                onTap: (() => showPopUp(widget.quizzes.retakePoint.toString())),
                child: Container(
                  height: 48,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), gradient: buttonGradiant, border: Border.all(color: kWhite.withOpacity(0.5))),
                  child: Text(
                    lang.S.of(context).playAgain,
                    textAlign: TextAlign.center,
                    style: kTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: () {
                  Share.share('check out my website https://example.com', subject: 'Look what I made!');
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 48,
                  width: double.infinity,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: kWhite.withOpacity(0.1), border: Border.all(color: kWhite.withOpacity(0.5))),
                  child: Text(
                    lang.S.of(context).shareSqure,
                    textAlign: TextAlign.center,
                    style: kTextStyle.copyWith(color: kWhite, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: () => review(),
                child: Container(
                  alignment: Alignment.center,
                  height: 48,
                  width: double.infinity,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: kWhite.withOpacity(0.1), border: Border.all(color: kWhite.withOpacity(0.5))),
                  child: Text(
                    lang.S.of(context).rateUs,
                    textAlign: TextAlign.center,
                    style: kTextStyle.copyWith(color: kWhite, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    const Home().launch(context);
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 48,
                  width: double.infinity,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: kWhite.withOpacity(0.1), border: Border.all(color: kWhite.withOpacity(0.5))),
                  child: Text(
                    lang.S.of(context).home,
                    textAlign: TextAlign.center,
                    style: kTextStyle.copyWith(color: kWhite, fontWeight: FontWeight.bold),
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

import 'package:cash_rocket/Model/scratch_card_model.dart';
import 'package:cash_rocket/Screen/Scratch%20Card/use_scratch_card.dart';
import 'package:cash_rocket/constant%20app%20information/const_information.dart';
import 'package:cash_rocket/generated/l10n.dart' as lang;
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../Provider/profile_provider.dart';
import '../../Repositories/rewards_repo.dart';
import '../Constant Data/constant.dart';

class ScratchCard extends StatefulWidget {
  const ScratchCard({super.key});

  @override
  State<ScratchCard> createState() => _ScratchCardState();
}

class _ScratchCardState extends State<ScratchCard> {
  void showPopUp(String amount, Data scratchCardModel) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
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
                  '${lang.S.of(context).ifYouScratchThisCard} $amount ${lang.S.of(context).pointsWillBeDucted}',
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
                            // bool status = await RewardRepo().removePoint(amount, 'Paid For Scratch Card');
                            bool status = await RewardRepo().removePoint(amount, lang.S.of(context).paidForScratchCard);
                            if (status && mounted) {
                              //EasyLoading.showSuccess('Successful');
                              EasyLoading.showSuccess(lang.S.of(context).successful);
                              await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => UseScratchCard(
                                            scratchCardModel: scratchCardModel,
                                          )));
                              finish(context);
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
                              style: kTextStyle.copyWith(color: kLightTextColor),
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
        );
      },
    );
  }

  List<String> image = [
    'images/a1.png',
    'images/a2.png',
    'images/a3.png',
    'images/a4.png',
    'images/a5.png',
    'images/a6.png',
    'images/a7.png',
  ];

  bool isBalanceShow = false;

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (_, ref, watch) {
      final profile = ref.watch(personalProfileProvider);
      final cards = ref.watch(scratchCardProvider);
      return profile.when(data: (data) {
        return Scaffold(
          appBar: AppBar(
            titleSpacing: 0,
            toolbarHeight: 90,
            iconTheme: const IconThemeData(color: Colors.white),
            flexibleSpace: Container(
              decoration: BoxDecoration(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30)), gradient: containerGradiant),
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
              lang.S.of(context).scratchCard,
              style: mediumTextStyle.copyWith(fontSize: 18),
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
                          isBalanceShow ? data.data?.user?.wallet?.balance?.toString() ?? "" : lang.S.of(context).balance,
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
          body: cards.when(data: (cardList) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Column(
                  children: [
                    ListView.builder(
                        itemCount: cardList.data?.length ?? 0,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (_, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: GestureDetector(
                              onTap: () => showPopUp(cardList.data![index].price.toString(), cardList.data![index]),
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
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            lang.S.of(context).scratchAndWin,
                                            style: kTextStyle.copyWith(fontWeight: FontWeight.bold, color: kWhite),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          RichText(
                                              text: TextSpan(text: '${lang.S.of(context).price}: ', style: kTextStyle.copyWith(color: kLightTextColor, fontSize: 13), children: [
                                            TextSpan(
                                              text: '${cardList.data?[index].price} ${lang.S.of(context).points}',
                                            )
                                          ])),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            '${lang.S.of(context).itUseYouWillDetect} ${cardList.data?[index].price} ${lang.S.of(context).coins} ',
                                            style: kTextStyle.copyWith(color: kLightTextColor, fontSize: 13),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                        ],
                                      ),
                                      Icon(
                                        Icons.arrow_forward_ios_sharp,
                                        color: kLightTextColor,
                                        size: 20,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        })
                  ],
                ),
              ),
            );
          }, error: (e, stack) {
            return Scaffold(
              body: Center(
                child: Text(e.toString()),
              ),
            );
          }, loading: () {
            return const Scaffold(
                body: Center(
              child: CircularProgressIndicator(),
            ));
          }),
        );
      }, error: (e, stack) {
        return Scaffold(
          body: Center(
            child: Text(e.toString()),
          ),
        );
      }, loading: () {
        return const Scaffold(
            body: Center(
          child: CircularProgressIndicator(),
        ));
      });
    });
  }
}

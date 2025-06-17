import 'package:cash_rocket/generated/l10n.dart' as lang;
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../Constant Data/constant.dart';
import '../../Profile/mt_offer_status_details.dart';

class EarnPoints extends StatefulWidget {
  const EarnPoints({super.key});

  @override
  State<EarnPoints> createState() => _EarnPointsState();
}

class _EarnPointsState extends State<EarnPoints> {
  List<String> imageList = [
    'images/rise.png',
    'images/my.png',
    'images/love.png',
    'images/annotate.png',
    'images/hey.png',
    'images/reach.png',
    'images/atlas.png',
  ];

  // List<String> titleList = [
  //   lang.S.of(context).riseOfKingdomsLostCrusade,
  //   lang.S.of(context).myGymFitnessStudioManager,
  //   lang.S.of(context).loveSickLoveStoriesGames,
  //   lang.S.of(context).annotateImagesForAl,
  //   lang.S.of(context).heyMoreCash,
  //   lang.S.of(context).reachLevel100InTheGame,
  //   lang.S.of(context).atlasVPN,
  //   // 'Rise of Kingdoms: Lost Crusade',
  //   // 'My Gym: Fitness Studio Manager',
  //   // 'Love Sick: Love Stories Games',
  //   // 'Annotate Images for Al',
  //   // 'Hey! More Cash!',
  //   // 'Reach Level 100 in The Game!',
  //   // 'Atlas VPN',
  // ];
  // List<String> subtitleList = [
  //   lang.S.of(context).completeAnAction,
  //   lang.S.of(context).completeAnAction,
  //   lang.S.of(context).completeAnAction,
  //   lang.S.of(context).completeAnAction,
  //   lang.S.of(context).completeAnAction,
  //   lang.S.of(context).completeAnAction,
  //   lang.S.of(context).completeAnAction,
  //   // 'Complete an action',
  //   // 'Complete an action',
  //   // 'Complete an action',
  //   // 'Complete an action',
  //   // 'Complete an action',
  //   // 'Complete an action',
  //   // 'Complete an action',
  // ];

  List<String> points = [
    '+2921',
    '+2921',
    '+2921',
    '+2921',
    '+2921',
    '+2921',
    '+2921',
  ];

  bool isBalanceShow = false;

  @override
  Widget build(BuildContext context) {
    List<String> titleList = [
      lang.S.of(context).riseOfKingdomsLostCrusade,
      lang.S.of(context).myGymFitnessStudioManager,
      lang.S.of(context).loveSickLoveStoriesGames,
      lang.S.of(context).annotateImagesForAl,
      lang.S.of(context).heyMoreCash,
      lang.S.of(context).reachLevel100InTheGame,
      lang.S.of(context).atlasVPN,
      // 'Rise of Kingdoms: Lost Crusade',
      // 'My Gym: Fitness Studio Manager',
      // 'Love Sick: Love Stories Games',
      // 'Annotate Images for Al',
      // 'Hey! More Cash!',
      // 'Reach Level 100 in The Game!',
      // 'Atlas VPN',
    ];
    List<String> subtitleList = [
      lang.S.of(context).completeAnAction,
      lang.S.of(context).completeAnAction,
      lang.S.of(context).completeAnAction,
      lang.S.of(context).completeAnAction,
      lang.S.of(context).completeAnAction,
      lang.S.of(context).completeAnAction,
      lang.S.of(context).completeAnAction,
      // 'Complete an action',
      // 'Complete an action',
      // 'Complete an action',
      // 'Complete an action',
      // 'Complete an action',
      // 'Complete an action',
      // 'Complete an action',
    ];
    return Scaffold(
      backgroundColor: const Color(0xFFFFFDFD),
      appBar: AppBar(
        titleSpacing: 0,
        toolbarHeight: 90,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30.0),
            bottomLeft: Radius.circular(30.0),
          ),
        ),
        backgroundColor: kMainColor,
        elevation: 0.0,
        title: Text(
          lang.S.of(context).earnpoints,
          style: kTextStyle.copyWith(color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
              padding: const EdgeInsets.all(2.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Colors.white.withOpacity(0.3),
                border: Border.all(
                  color: Colors.white,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedOpacity(
                    opacity: !isBalanceShow ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 1000),
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: kMainColor,
                        border: Border.all(color: Colors.white, width: 2.0),
                      ),
                      child: const Icon(
                        FeatherIcons.dollarSign,
                        size: 15.0,
                      ),
                    ),
                  ),
                  const SizedBox(width: 5.0),
                  Text(isBalanceShow ? '\$1000' : lang.S.of(context).balance),
                  const SizedBox(width: 5.0),
                  AnimatedOpacity(
                    opacity: isBalanceShow ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 1000),
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: kMainColor,
                        border: Border.all(color: Colors.white, width: 2.0),
                      ),
                      child: const Icon(
                        FeatherIcons.dollarSign,
                        size: 15.0,
                      ),
                    ),
                  ),
                ],
              ),
            ).onTap(() {
              setState(() {
                isBalanceShow = !isBalanceShow;
              });
            }),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                  itemCount: imageList.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (_, i) {
                    return Card(
                      elevation: 1.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Container(
                        width: 325,
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: const Color(0xFFFFFFFF)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 65.0,
                              width: 65.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                image: DecorationImage(
                                    image: AssetImage(
                                      imageList[i],
                                    ),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    titleList[i],
                                    style: kTextStyle.copyWith(color: kTitleColor),
                                  ),
                                  const SizedBox(height: 4.0),
                                  Row(
                                    children: [
                                      Text(
                                        subtitleList[i],
                                        style: kTextStyle.copyWith(color: kGreyTextColor),
                                      ),
                                      const SizedBox(width: 80.0),
                                      Text(
                                        points[i],
                                        style: kTextStyle.copyWith(color: kMainColor, fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 4.0),
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30.0),
                                          gradient: const LinearGradient(
                                            begin: Alignment.topCenter,
                                            colors: [
                                              Color(0xFFFFABA5),
                                              Color(0xFFFF7C92),
                                            ],
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 2.0, bottom: 2.0),
                                          child: Text(
                                            lang.S.of(context).topOffer,
                                            style: kTextStyle.copyWith(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 4.0),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30.0),
                                          gradient: const LinearGradient(
                                            begin: Alignment.topCenter,
                                            colors: [
                                              Color(0xFFFFA6A5),
                                              Color(0xFF8555EA),
                                            ],
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 2.0, bottom: 2.0),
                                          child: Text(
                                            lang.S.of(context).free,
                                            style: kTextStyle.copyWith(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 4.0),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30.0),
                                          gradient: const LinearGradient(
                                            begin: Alignment.topCenter,
                                            colors: [
                                              Color(0xFFFFBF53),
                                              Color(0xFFFF8244),
                                            ],
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 2.0, bottom: 2.0),
                                          child: Text(
                                            lang.S.of(context).hard,
                                            style: kTextStyle.copyWith(color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ).onTap(() => const MtOfferStatusDetails().launch(context));
                  })
            ],
          ),
        ),
      ),
    );
  }
}

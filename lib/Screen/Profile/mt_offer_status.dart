import 'package:cash_rocket/Screen/Profile/mt_offer_status_details.dart';
import 'package:cash_rocket/constant%20app%20information/const_information.dart';
import 'package:cash_rocket/generated/l10n.dart' as lang;
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../Constant Data/constant.dart';

class OfferStatus extends StatefulWidget {
  const OfferStatus({super.key});

  @override
  State<OfferStatus> createState() => _OfferStatusState();
}

class _OfferStatusState extends State<OfferStatus> {
  List<String> imageList = [
    'images/rise.png',
    'images/gym.png',
    'images/lovesick.png',
  ];

  // List<String> titleList = [
  //   lang.S.of(context).riseOfKingdomsLostCrusade,
  //   lang.S.of(context).myGymFitnessStudioManager,
  //   lang.S.of(context).loveSickLoveStoriesGames,
  //   // 'Rise of Kingdoms: Lost Crusade',
  //   // 'My Gym: Fitness Studio Manager',
  //   // 'Love Sick: Love Stories Games',
  // ];
  // List<String> stageList = [
  //   lang.S.of(context).hard,
  //   lang.S.of(context).free,
  //   lang.S.of(context).medium,
  //   // 'Hard',
  //   // 'Free',
  //   // 'Medium'
  // ];

  // List<String> subtitleList = [
  //   lang.S.of(context).completeAnAction,
  //   lang.S.of(context).completeAnAction,
  //   lang.S.of(context).completeAnAction,
  //  // 'Complete an action', 'Complete an action', 'Complete an action'
  //  ];

  List<String> point = [
    '+2921',
    '+2921',
    '+2921',
  ];

  List<Gradient> gradiantColorList = [
    const LinearGradient(colors: [Color(0xff84FFAA), Color(0xff009373)]),
    const LinearGradient(colors: [Color(0xffF58592), Color(0xff7420E7)]),
    const LinearGradient(colors: [Color(0xffFFCB72), Color(0xffFD5A08)]),
  ];

  List<Widget> screenList = [
    const MtOfferStatusDetails(),
    const MtOfferStatusDetails(),
    const MtOfferStatusDetails(),
  ];

  @override
  Widget build(BuildContext context) {
    List<String> titleList = [
      lang.S.of(context).riseOfKingdomsLostCrusade,
      lang.S.of(context).myGymFitnessStudioManager,
      lang.S.of(context).loveSickLoveStoriesGames,
      // 'Rise of Kingdoms: Lost Crusade',
      // 'My Gym: Fitness Studio Manager',
      // 'Love Sick: Love Stories Games',
    ];
    List<String> stageList = [
      lang.S.of(context).hard,
      lang.S.of(context).free,
      lang.S.of(context).medium,
      // 'Hard',
      // 'Free',
      // 'Medium'
    ];
    List<String> subtitleList = [
      lang.S.of(context).completeAnAction,
      lang.S.of(context).completeAnAction,
      lang.S.of(context).completeAnAction,
      // 'Complete an action', 'Complete an action', 'Complete an action'
    ];
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        toolbarHeight: 90,
        iconTheme: const IconThemeData(color: kWhite),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30.0),
            bottomLeft: Radius.circular(30.0),
          ),
        ),
        elevation: 0.0,
        flexibleSpace: Container(
          decoration: BoxDecoration(borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)), gradient: containerGradiant),
        ),
        title: Text(
          lang.S.of(context).offerStatus,
          style: kTextStyle.copyWith(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              lang.S.of(context).inProgress,
              style: kTextStyle.copyWith(color: kMainColor, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            ListView.builder(
                itemCount: imageList.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, i) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: GestureDetector(
                      onTap: (() => screenList[i].launch(context)),
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), boxShadow: const [BoxShadow(color: kShadowColor), BoxShadow(color: kMainBacgrundColor, blurRadius: 10.0, spreadRadius: 0)]),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              Container(
                                height: 64,
                                width: 64,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                        imageList[i],
                                      ),
                                    )),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    titleList[i],
                                    style: mediumTextStyle,
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        subtitleList[i],
                                        style: kTextStyle.copyWith(color: kLightTextColor),
                                      ),
                                      const SizedBox(
                                        width: 50,
                                      ),
                                      Text(
                                        point[i],
                                        style: kTextStyle.copyWith(color: kMainColor),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 7.0),
                                  Container(
                                    alignment: Alignment.center,
                                    height: 20,
                                    width: 70,
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.0), gradient: gradiantColorList[i], border: Border.all(color: kWhite.withOpacity(0.25))),
                                    child: Text(
                                      stageList[i],
                                      style: kTextStyle.copyWith(color: Colors.white, fontSize: 12),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        // child: ListTile(
                        //   contentPadding: const EdgeInsets.symmetric(horizontal: 10,vertical: 2),
                        //   onTap: (()=>screenList[i].launch(context)),
                        //   leading: Container(
                        //     height: 64,
                        //     width: 64,
                        //     decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.circular(8.0),
                        //         image: DecorationImage(
                        //           fit: BoxFit.cover,
                        //           image: AssetImage(
                        //             imageList[i],
                        //           ),
                        //         )),
                        //   ),
                        //   title: Text(
                        //     titleList[i],
                        //     style: kTextStyle.copyWith(color: kWhite),
                        //   ),
                        //   isThreeLine: true,
                        //   subtitle: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       Row(
                        //         children: [
                        //           Text(
                        //             subtitleList[i],
                        //             style:
                        //                 kTextStyle.copyWith(color: kLightTextColor),
                        //           ),
                        //           const Spacer(),
                        //           Text(
                        //             point[i],
                        //             style: kTextStyle.copyWith(color: kMainColor),
                        //           ),
                        //         ],
                        //       ),
                        //       const SizedBox(height: 4.0),
                        //       Container(
                        //         alignment: Alignment.center,
                        //         height: 20,
                        //         width: 70,
                        //         decoration: BoxDecoration(
                        //           borderRadius: BorderRadius.circular(30.0),
                        //           gradient: gradiantColorList[i],
                        //           border: Border.all(color: kWhite.withOpacity(0.25))
                        //         ),
                        //         child: Text(
                        //           stageList[i],
                        //           style: kTextStyle.copyWith(color: Colors.white,fontSize: 12),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ),
                    ),
                  );
                }),
            const SizedBox(height: 20.0),
            Center(
              child: RichText(
                  text: TextSpan(text: lang.S.of(context).yourFyberUserIDis, style: kTextStyle.copyWith(color: kGreyTextColor), children: [
                TextSpan(
                  text: '2361246',
                  style: kTextStyle.copyWith(color: kWhite, fontWeight: FontWeight.bold),
                )
              ])),
            )
          ],
        ),
      ),
    );
  }
}

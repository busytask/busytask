import 'package:cash_rocket/Screen/AdGem/adgem_offerwall.dart';
import 'package:cash_rocket/Screen/Constant%20Data/constant.dart';
import 'package:cash_rocket/Screen/Kiwi%20Wall/kiwi_offer_wall.dart';
import 'package:cash_rocket/Screen/Offer%20Toro/offertoro_offerwall.dart';
import 'package:cash_rocket/Screen/Og%20Ads/ogads_offerwall.dart';
import 'package:cash_rocket/Screen/Persona.ly/personaly_offerwall.dart';
import 'package:cash_rocket/Screen/Wannads/wannads_offer_wall.dart';
import 'package:cash_rocket/generated/l10n.dart' as lang;
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class Offers extends StatefulWidget {
  const Offers({super.key});

  @override
  State<Offers> createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  List<String> imageList = [
    'images/bg1.png',
    'images/bg2.png',
    'images/bg3.png',
    'images/bg4.png',
    'images/bg2.png',
    'images/bg1.png',
  ];

  List<String> logoList = [
    'images/toro.png',
    'images/persona.png',
    'images/wannads.png',
    'images/kiwi.png',
    'images/adgem.png',
    'images/og.png',
  ];

  // List<String> titleList = [
  //   lang.S.of(context).offerToro,
  //   lang.S.of(context).personaly,
  //   lang.S.of(context).wannads,
  //   lang.S.of(context).kiwiWall,
  //   lang.S.of(context).adGem,
  //   lang.S.of(context).ogAds,
  //   // 'OfferToro',
  //   // 'Persona.ly',
  //   // 'Wannads',
  //   // 'Kiwi Wall',
  //   // 'AdGem',
  //   // 'OGAds',
  // ];
  // List<String> subtitleList = [
  //   lang.S.of(context).completeOffersAndGetPoints,
  //   lang.S.of(context).completeOffersAndGetPoints,
  //   lang.S.of(context).completeOffersAndGetPoints,
  //   lang.S.of(context).completeOffersAndGetPoints,
  //   lang.S.of(context).completeOffersAndGetPoints,
  //   lang.S.of(context).completeOffersAndGetPoints,
  //   // 'Complete offers and get points',
  //   // 'Complete offers and get points',
  //   // 'Complete offers and get points',
  //   // 'Complete offers and get points',
  //   // 'Complete offers and get points',
  //   // 'Complete offers and get points',
  // ];

  bool isBalanceShow = false;

  List<Widget> screenList = [
    const OffertoroOfferwall(),
    const PersonalyOfferWall(),
    const WannadsOfferWall(),
    const KiwiOfferWall(),
    const AdGemOfferWall(),
    const OgAdsOfferWall(),
  ];

  @override
  Widget build(BuildContext context) {
    List<String> titleList = [
      lang.S.of(context).offerToro,
      lang.S.of(context).personaly,
      lang.S.of(context).wannads,
      lang.S.of(context).kiwiWall,
      lang.S.of(context).adGem,
      lang.S.of(context).ogAds,
      // 'OfferToro',
      // 'Persona.ly',
      // 'Wannads',
      // 'Kiwi Wall',
      // 'AdGem',
      // 'OGAds',
    ];
    List<String> subtitleList = [
      lang.S.of(context).completeOffersAndGetPoints,
      lang.S.of(context).completeOffersAndGetPoints,
      lang.S.of(context).completeOffersAndGetPoints,
      lang.S.of(context).completeOffersAndGetPoints,
      lang.S.of(context).completeOffersAndGetPoints,
      lang.S.of(context).completeOffersAndGetPoints,
      // 'Complete offers and get points',
      // 'Complete offers and get points',
      // 'Complete offers and get points',
      // 'Complete offers and get points',
      // 'Complete offers and get points',
      // 'Complete offers and get points',
    ];
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30.0),
            bottomLeft: Radius.circular(30.0),
          ),
        ),
        backgroundColor: Colors.red,
        elevation: 0.0,
        title: Text(
          lang.S.of(context).offers,
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            childAspectRatio: 1.2,
            mainAxisSpacing: 10.0,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: List.generate(
              6,
              (i) {
                return Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Container(
                      height: 150,
                      width: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                            image: AssetImage(
                              imageList[i],
                            ),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.transparent,
                            radius: 20.0,
                            backgroundImage: AssetImage(
                              logoList[i],
                            ),
                          ),
                          const SizedBox(
                            height: 4.0,
                          ),
                          Text(
                            titleList[i],
                            style: kTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18.0),
                          ),
                          const SizedBox(
                            height: 4.0,
                          ),
                          Text(
                            subtitleList[i],
                            style: kTextStyle.copyWith(color: Colors.white),
                          ),
                        ],
                      ),
                    )
                  ],
                ).onTap(
                  () => screenList[i].launch(context),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

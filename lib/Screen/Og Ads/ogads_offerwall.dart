import 'package:cash_rocket/Model/og_ads_model.dart';
import 'package:cash_rocket/Provider/og_ads_provider.dart';
import 'package:cash_rocket/Screen/Og%20Ads/ogads_offer_details.dart';
import 'package:cash_rocket/generated/l10n.dart' as lang;
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';

import '../Constant Data/constant.dart';

class OgAdsOfferWall extends StatefulWidget {
  const OgAdsOfferWall({super.key});

  @override
  State<OgAdsOfferWall> createState() => _OgAdsOfferWallState();
}

class _OgAdsOfferWallState extends State<OgAdsOfferWall> {
  List<String> imageList = [
    'images/rise.png',
    'images/my.png',
    'images/love.png',
    'images/annotate.png',
    'images/hey.png',
    'images/reach.png',
    'images/atlas.png',
  ];

  List<String> titleList = [
    'Rise of Kingdoms: Lost Crusade',
    'My Gym: Fitness Studio Manager',
    'Love Sick: Love Stories Games',
    'Annotate Images for Al',
    'Hey! More Cash!',
    'Reach Level 100 in The Game!',
    'Atlas VPN',
  ];
  List<String> subtitleList = [
    'Complete an action',
    'Complete an action',
    'Complete an action',
    'Complete an action',
    'Complete an action',
    'Complete an action',
    'Complete an action',
  ];

  List<String> points = [
    '+2921',
    '+2921',
    '+2921',
    '+2921',
    '+2921',
    '+2921',
    '+2921',
  ];

  List<String> categotyList = [
    'Top Offer!',
    'Free',
    'Hard',
  ];

  bool isBalanceShow = false;
  @override
  Widget build(BuildContext context) {
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
          lang.S.of(context).ogAds,
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
      body: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          AsyncValue<OgAdsModel> offers = ref.watch(ogAdsProvider);

          return offers.when(data: (offer) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.builder(
                        itemCount: offer.offers?.length,
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
                                          image: NetworkImage(
                                            offer.offers?[i].picture ?? '',
                                          ),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: context.width() / 1.5,
                                          child: Text(
                                            offer.offers?[i].nameShort ?? '',
                                            maxLines: 1,
                                            style: kTextStyle.copyWith(color: kTitleColor),
                                          ),
                                        ),
                                        const SizedBox(height: 4.0),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: context.width() / 2.2,
                                              child: Text(
                                                offer.offers?[i].description ?? '',
                                                maxLines: 1,
                                                style: kTextStyle.copyWith(color: kGreyTextColor),
                                              ),
                                            ),
                                            Text(
                                              '\$ ${offer.offers?[i].epc.toString() ?? ''}',
                                              style: kTextStyle.copyWith(color: kMainColor, fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
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
                                              offer.offers?[i].device?.toString() ?? '',
                                              style: kTextStyle.copyWith(color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ).onTap(() => OgAdsOfferDetails(ogAdsOfferWall: offer.offers![i]).launch(context));
                        })
                  ],
                ),
              ),
            );
          }, error: (e, stack) {
            return Text(
              e.toString(),
              style: kTextStyle.copyWith(color: kTitleColor),
            );
          }, loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          });
        },
      ),
    );
  }
}

import 'package:cash_rocket/Screen/Constant%20Data/main_button.dart';
import 'package:cash_rocket/Screen/Home%20Screen/home.dart';
import 'package:cash_rocket/constant%20app%20information/const_information.dart';
import 'package:cash_rocket/generated/l10n.dart' as lang;
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:nb_utils/nb_utils.dart';
import '../Constant Data/constant.dart';

class MtOfferStatusDetails extends StatefulWidget {
  const MtOfferStatusDetails({super.key});

  @override
  State<MtOfferStatusDetails> createState() => _MtOfferStatusDetailsState();
}

class _MtOfferStatusDetailsState extends State<MtOfferStatusDetails> {
  // List<String> categoryList = [
  //   lang.S.of(context).topOffer,
  //   lang.S.of(context).free,
  //   lang.S.of(context).hard,
  //   // 'Top Offer!',
  //   // 'Free',
  //   // 'Hard',
  // ];
  List<Gradient> colorList = [
    const LinearGradient(colors: [Color(0xff0DA6C2), Color(0xff0E39C6)]),
    const LinearGradient(colors: [
      Color(0xffF58592),
      Color(0xff7420E7),
    ]),
    const LinearGradient(colors: [
      Color(0xff84FFAA),
      Color(0xff009373),
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    List<String> categoryList = [
      lang.S.of(context).topOffer,
      lang.S.of(context).free,
      lang.S.of(context).hard,
      // 'Top Offer!',
      // 'Free',
      // 'Hard',
    ];
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          toolbarHeight: 90,
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
          title: ListTile(
            minLeadingWidth: 0,
            leading: Container(
              height: 44,
              width: 44,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: const DecorationImage(
                    image: AssetImage('images/rok.png'),
                  )),
            ),
            title: Text(
              lang.S.of(context).riseofKingdomsLostCrus,
              style: kTextStyle.copyWith(color: Colors.white),
            ),
            subtitle: Text(
              lang.S.of(context).completeanaction,
              style: kTextStyle.copyWith(color: Colors.white),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: const Icon(Icons.close, color: Colors.white).onTap(
                () => Navigator.pop(context),
              ),
            )
          ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10.0),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.0),
                  image: const DecorationImage(
                    image: AssetImage('images/rokbanner.png'),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              HorizontalList(
                padding: EdgeInsets.zero,
                spacing: 10,
                itemCount: categoryList.length,
                itemBuilder: (_, i) {
                  return Container(
                    alignment: Alignment.center,
                    height: 27,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.0), gradient: colorList[i], border: Border.all(color: kWhite.withOpacity(0.25))),
                    child: Text(
                      categoryList[i],
                      style: kTextStyle.copyWith(color: kWhite),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                lang.S.of(context).instructions,
                style: kTextStyle.copyWith(color: kWhite, fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              const SizedBox(height: 5.0),
              Text(
                lang.S.of(context).playRiseofKingdoms,
                //'1.  Play Rise of Kingdoms',
                style: kTextStyle.copyWith(color: kLightTextColor),
                maxLines: 5,
              ),
              const SizedBox(height: 5.0),
              Text(
                lang.S.of(context).upgradeyourcityotlevel17,
                //'2. Upgrade your city ot level 17',
                style: kTextStyle.copyWith(color: kLightTextColor),
                maxLines: 5,
              ),
              const SizedBox(height: 5.0),
              Text(
                lang.S.of(context).hereComesYourReward,
                //'3.  Here comes your reward!',
                style: kTextStyle.copyWith(color: kLightTextColor),
                maxLines: 5,
              ),
              const SizedBox(height: 5.0),
              Text(
                lang.S.of(context).pleaseCompleteTheTaskWithin22days,
                //'4.  Please complete the task within 22 days',
                style: kTextStyle.copyWith(color: kLightTextColor),
                maxLines: 5,
              ),
              const SizedBox(height: 5.0),
              Text(
                lang.S.of(context).userCanaonly,
                //'5.  User can only obtain reward from ONE Rise of kingdoms offer ',
                style: kTextStyle.copyWith(color: kLightTextColor),
                maxLines: 5,
              ),
              const SizedBox(height: 30.0),
              Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: kGreyTextColor.withOpacity(0.2),
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(4.0),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffFFCE56),
                              ),
                              child: const Icon(
                                FeatherIcons.dollarSign,
                                color: Colors.white,
                                size: 16.0,
                              ),
                            ),
                            const SizedBox(height: 5.0),
                            Text(
                              '2921',
                              style: kTextStyle.copyWith(color: kWhite, fontWeight: FontWeight.bold, fontSize: 18.0),
                            ),
                            const SizedBox(height: 5.0),
                            Text(
                              lang.S.of(context).totalRewards,
                              style: kTextStyle.copyWith(color: kLightTextColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 80.0,
                      width: 1.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(1.0),
                        color: kGreyTextColor,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: Column(
                          children: [
                            const Icon(
                              IconlyLight.calendar,
                              color: Color(0xffFD5A08),
                              size: 24.0,
                            ),
                            const SizedBox(height: 5.0),
                            Text(
                              '22',
                              style: kTextStyle.copyWith(color: kWhite, fontWeight: FontWeight.bold, fontSize: 18.0),
                            ),
                            const SizedBox(height: 5.0),
                            Text(
                              lang.S.of(context).daysToComplete,
                              style: kTextStyle.copyWith(color: kLightTextColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              PrimaryButton(
                  buttonText: lang.S.of(context).earnpoints,
                  onpressed: () {
                    setState(() {
                      const Home().launch(context);
                    });
                  })
            ],
          ),
        ),
      ),
    );
  }
}

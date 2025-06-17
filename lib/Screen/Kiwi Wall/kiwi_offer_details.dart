import 'package:cash_rocket/Model/kiwi_wall_model.dart';
import 'package:cash_rocket/generated/l10n.dart' as lang;
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import '../Constant Data/button_global.dart';
import '../Constant Data/constant.dart';
import '../Home Screen/home.dart';

class KiwiOfferDetails extends StatefulWidget {
  const KiwiOfferDetails({super.key, required this.kiwiOfferWall});
  final Offers kiwiOfferWall;
  @override
  State<KiwiOfferDetails> createState() => _KiwiOfferDetailsState();
}

class _KiwiOfferDetailsState extends State<KiwiOfferDetails> {
  List<String> categoryList = [
    'Top Offer!',
    'Free',
    'Hard',
  ];

  List<String> numberList = [
    '1',
    '2',
    '3',
    '4',
    '5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
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
          title: ListTile(
            minLeadingWidth: 0,
            leading: Container(
              height: 44,
              width: 44,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage(
                      widget.kiwiOfferWall.logo.toString(),
                    ),
                  )),
            ),
            title: Text(
              widget.kiwiOfferWall.name.toString(),
              style: kTextStyle.copyWith(color: Colors.white),
            ),
            subtitle: Text(
              widget.kiwiOfferWall.category.toString(),
              style: kTextStyle.copyWith(color: Colors.white),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: const Icon(Icons.close, color: Colors.white).onTap(() => Navigator.pop(context)),
            )
          ]),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10.0),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.0),
                  image: DecorationImage(
                    image: NetworkImage(
                      widget.kiwiOfferWall.logo.toString(),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 2.0, bottom: 2.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: const Color(0xFFFFABA5),
                ),
                child: Text(
                  widget.kiwiOfferWall.category.toString(),
                ),
              ),
              Text(
                lang.S.of(context).instructions,
                style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
              const SizedBox(height: 5.0),
              Text(
                widget.kiwiOfferWall.instructions.toString(),
                style: kTextStyle.copyWith(color: kGreyTextColor),
                maxLines: 2,
              ),
              const SizedBox(height: 30.0),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: kGreyTextColor.withOpacity(0.2),
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
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
                                color: kMainColor,
                              ),
                              child: const Icon(
                                FeatherIcons.dollarSign,
                                color: Colors.white,
                                size: 16.0,
                              ),
                            ),
                            const SizedBox(height: 5.0),
                            Text(
                              'BDT  ${widget.kiwiOfferWall.amount.toString()}',
                              style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              lang.S.of(context).totalRewards,
                              style: kTextStyle.copyWith(color: kGreyTextColor),
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
                        padding: const EdgeInsets.only(left: 10.0),
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              FeatherIcons.calendar,
                              color: Color(0xFF8555EA),
                              size: 24.0,
                            ),
                            const SizedBox(height: 5.0),
                            Text(
                              widget.kiwiOfferWall.clicked.toString().toString(),
                              style: kTextStyle.copyWith(
                                color: kTitleColor,
                              ),
                              maxLines: 3,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10.0),
              ButtonGlobal(
                  buttontext: '${lang.S.of(context).earnbdt}  ${widget.kiwiOfferWall.amount.toString()}',
                  buttonDecoration: kButtonDecoration,
                  onPressed: () {
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

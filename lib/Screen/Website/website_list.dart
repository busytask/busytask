import 'package:cash_rocket/Model/website_visit_model.dart';
import 'package:cash_rocket/Provider/profile_provider.dart';
import 'package:cash_rocket/Screen/Website/visit_website.dart';
import 'package:cash_rocket/constant%20app%20information/const_information.dart';
import 'package:cash_rocket/generated/l10n.dart' as lang;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Constant Data/constant.dart';
import '../Video List/blank_video_list.dart';

class WebsiteList extends StatefulWidget {
  const WebsiteList({super.key});

  @override
  State<WebsiteList> createState() => _WebsiteListState();
}

class _WebsiteListState extends State<WebsiteList> {
  bool isBalanceShow = false;

  List<String> imageList = [
    'images/z5.png',
    'images/z1.png',
    'images/z3.png',
    'images/z4.png',
    'images/z5.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (_, ref, watch) {
      AsyncValue<WebsiteVisitModel> websiteList = ref.watch(websiteProvider);

      return websiteList.when(data: (website) {
        if (website.data!.isEmpty) {
          return BlankVideoList();
        } else {
          return Scaffold(
            appBar: AppBar(
              titleSpacing: 0,
              toolbarHeight: 90,
              iconTheme: const IconThemeData(color: Colors.white),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30.0),
                  bottomLeft: Radius.circular(30.0),
                ),
              ),
              flexibleSpace: Container(
                decoration: BoxDecoration(gradient: containerGradiant, borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))),
              ),
              elevation: 0.0,
              title: Text(
                lang.S.of(context).visitWebsite,
                style: kTextStyle.copyWith(color: Colors.white),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${lang.S.of(context).totalWebsites}: ${website.data?.length ?? 0}',
                      style: kTextStyle.copyWith(fontWeight: FontWeight.bold, color: kWhite),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      lang.S.of(context).visitWebsiteOnlyOneInADay,
                      style: kTextStyle.copyWith(color: kLightTextColor),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ListView.builder(
                        itemCount: website.data?.length ?? 0,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (_, i) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 15),
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
                                    blurRadius: 8.0,
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
                                          website.data?[i].title ?? "",
                                          style: kTextStyle.copyWith(fontWeight: FontWeight.bold, color: kWhite),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        RichText(
                                            text: TextSpan(text: lang.S.of(context).visitWebsiteAndGet, style: kTextStyle.copyWith(fontSize: 13, color: kLightTextColor), children: [
                                          TextSpan(text: ' ${website.data?[i].rewardPoint ?? ""} ${lang.S.of(context).points}', style: kTextStyle.copyWith(color: kWhite, fontSize: 13)),
                                        ])),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => VisitWebsite(url: website.data![i])));
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            padding: const EdgeInsets.symmetric(horizontal: 10),
                                            height: 30,
                                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(36), gradient: buttonGradiant),
                                            child: Text(
                                              lang.S.of(context).visitWebsite,
                                              style: mediumTextStyle,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        })
                  ],
                ),
              ),
            ),
          );
        }
      }, error: (e, stack) {
        return Center(
          child: Text(e.toString()),
        );
      }, loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      });
    });
  }
}

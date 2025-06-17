import 'package:cash_rocket/constant%20app%20information/const_information.dart';
import 'package:flutter/material.dart';
import 'package:cash_rocket/generated/l10n.dart' as lang;
import '../Constant Data/constant.dart';

class BlankVideoList extends StatefulWidget {
  const BlankVideoList({super.key});

  @override
  State<BlankVideoList> createState() => _BlankVideoListState();
}

class _BlankVideoListState extends State<BlankVideoList> {
  List<String> imageList = [
    'images/z5.png',
    'images/z1.png',
    'images/z3.png',
    'images/z4.png',
    'images/z5.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        iconTheme: const IconThemeData(color: kWhite),
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: containerGradiant, borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))),
        ),
        title: Text(
          lang.S.of(context).customVideos,
          style: kTextStyle.copyWith(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                lang.S.of(context).watchAVideoOnlyOneTimeInADay,
                style: kTextStyle.copyWith(color: kLightTextColor),
              ),
              const SizedBox(
                height: 100,
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'images/refferbanner1.png',
                      width: MediaQuery.of(context).size.width / 1.2,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      lang.S.of(context).pleaseComeBackTomorrowToWatchTheVideo,
                      style: kTextStyle.copyWith(fontSize: 18, color: kLightTextColor),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

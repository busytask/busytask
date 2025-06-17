import 'package:cash_rocket/constant%20app%20information/const_information.dart';
import 'package:cash_rocket/generated/l10n.dart' as lang;
import 'package:flutter/material.dart';

import '../Constant Data/constant.dart';

class MtPrivacyPolicy extends StatefulWidget {
  const MtPrivacyPolicy({super.key});

  @override
  State<MtPrivacyPolicy> createState() => _MtPrivacyPolicyState();
}

class _MtPrivacyPolicyState extends State<MtPrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
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
          lang.S.of(context).privicyPolcy,
          style: kTextStyle.copyWith(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              lang.S.of(context).privicyPolicyICashRocket,
              style: kTextStyle.copyWith(color: kWhite, fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
            const SizedBox(height: 10.0),
            Text(
              lang.S.of(context).dateUpdated,
              style: kTextStyle.copyWith(color: kLightTextColor),
            ),
            const SizedBox(height: 10.0),
            Text(
              lang.S.of(context).loremipsum,
              style: kTextStyle.copyWith(color: kLightTextColor),
            ),
            const SizedBox(height: 10.0),
            Text(
              lang.S.of(context).ullamcorperEros,
              style: kTextStyle.copyWith(color: kLightTextColor),
            ),
            const SizedBox(height: 10.0),
            Text(
              lang.S.of(context).iaculisNibh,
              style: kTextStyle.copyWith(color: kLightTextColor),
            ),
          ],
        ),
      ),
    );
  }
}

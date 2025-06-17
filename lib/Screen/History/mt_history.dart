// ignore_for_file: unused_result
import 'package:cash_rocket/Model/history/user_history_model.dart';
import 'package:cash_rocket/Model/withdraw_history_model.dart';
import 'package:cash_rocket/Provider/profile_provider.dart';
import 'package:cash_rocket/constant%20app%20information/const_information.dart';
import 'package:cash_rocket/generated/l10n.dart' as lang;
import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:nb_utils/nb_utils.dart';

import '../Constant Data/constant.dart';
import '../Home Screen/no_internet_screen.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  List<String> logoList = [
    'images/logo1.png',
    'images/logo2.png',
    'images/logo3.png',
    'images/logo4.png',
    'images/logo5.png',
    'images/logo6.png',
    'images/logo7.png',
    'images/logo1.png',
    'images/logo2.png',
    'images/logo3.png',
    'images/logo4.png',
    'images/logo5.png',
    'images/logo6.png',
    'images/logo7.png',
  ];

  List<String> titleList = [
    'AdColony Video',
    'Withdraw',
    'Fyber Offer',
    'Chartboost Video',
    'Vungle Video',
    'Kiwi Wall Offer',
    'AdMob Video',
    'AdColony Video',
    'Withdraw',
    'Fyber Offer',
    'Chartboost Video',
    'Vungle Video',
    'Kiwi Wall Offer',
    'AdMob Video',
  ];
  List<String> subtitleList = [
    '26 Jun 2022',
    '26 Jun 2022',
    '25 Jun 2022',
    '24 Jun 2022',
    '24 Jun 2022',
    '16 Jun 2022',
    '15 Jun 2022',
    '26 Jun 2022',
    '26 Jun 2022',
    '25 Jun 2022',
    '24 Jun 2022',
    '24 Jun 2022',
    '16 Jun 2022',
    '15 Jun 2022',
  ];
  List<String> pointList = [
    '+5',
    '\$3',
    '+10',
    '+5',
    '+5',
    '+10',
    '+5',
    '+5',
    '\$3',
    '+10',
    '+5',
    '+5',
    '+10',
    '+5',
  ];

  Future<void> checkInternet() async {
    // bool result = await InternetConnectionChecker().hasConnection;
    bool result = await InternetConnection().hasInternetAccess;
    if (!result && mounted) {
      NoInternetScreen(screenName: widget).launch(context);
    }
  }

  String getStatus({required int statusCode}) {
    switch (statusCode) {
      case 0:
        return 'Rejected';
      case 3:
        return 'Approved';
      default:
        return 'Pending';
    }
  }

  @override
  void initState() {
    checkInternet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 90,
          iconTheme: const IconThemeData(color: Colors.white),
          flexibleSpace: Container(
            decoration: BoxDecoration(borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)), gradient: containerGradiant),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30.0),
              bottomLeft: Radius.circular(30.0),
            ),
          ),
          elevation: 0.0,
          title: Text(
            lang.S.of(context).history,
            style: kTextStyle.copyWith(color: Colors.white),
          ),
        ),
        body: Consumer(builder: (_, ref, watch) {
          AsyncValue<WithdrawHistoryModel> withdrawHistory = ref.watch(withdrawHistoryProvider);
          AsyncValue<UserHistoryModel> userHistory = ref.watch(userHistoryProvider);
          return withdrawHistory.when(data: (history) {
            return RefreshIndicator(
              onRefresh: () async {
                ref.refresh(personalProfileProvider);
                ref.refresh(withdrawHistoryProvider);
                ref.refresh(userHistoryProvider);
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    const SizedBox(height: 40.0),
                    Container(
                      width: context.width(),
                      decoration: BoxDecoration(
                        color: kMainColor.withOpacity(0.1),
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(30.0),
                          topLeft: Radius.circular(30.0),
                        ),
                      ),
                      child: TabBar(
                        indicatorSize: TabBarIndicatorSize.tab,
                        labelStyle: kTextStyle.copyWith(color: kMainColor, fontWeight: FontWeight.bold),
                        unselectedLabelColor: kLightTextColor,
                        indicatorColor: kMainColor,
                        labelColor: kMainColor,
                        indicator: const UnderlineTabIndicator(
                          insets: EdgeInsets.zero,
                          borderSide: BorderSide(color: kMainColor, width: 2.0),
                        ),
                        tabs: [
                          Tab(
                            text: lang.S.of(context).quiz,
                          ),
                          Tab(
                            text: lang.S.of(context).reward,
                          ),
                          Tab(
                            text: lang.S.of(context).withdraw,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: context.height() / 1.5,
                      child: TabBarView(
                        children: [
                          userHistory.when(data: (history) {
                            return Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: ListView.builder(
                                itemCount: history.data?.userQuizHistory?.length ?? 0,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (_, i) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 16),
                                    child: Container(
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), boxShadow: const [BoxShadow(color: kShadowColor), BoxShadow(color: kMainBacgrundColor, spreadRadius: 0.0, blurRadius: 10.0)]),
                                      child: (ListTile(
                                        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                                        horizontalTitleGap: 12,
                                        leading: const CircleAvatar(
                                          radius: 20.0,
                                          backgroundImage: AssetImage(
                                            'images/logo3.png',
                                          ),
                                        ),
                                        title: Text(
                                          history.data!.userQuizHistory![i].winStatus == '1' ? lang.S.of(context).winner : lang.S.of(context).looser,
                                          style: kTextStyle.copyWith(color: kWhite),
                                        ),
                                        subtitle: Text(
                                          DateTimeFormat.format(DateTime.parse(history.data!.userQuizHistory![i].createdAt.toString()), format: AmericanDateFormats.standard),
                                          style: kTextStyle.copyWith(color: kGreyTextColor),
                                        ),
                                        trailing: Text(
                                          '${history.data!.userQuizHistory![i].amount} Points',
                                          style: kTextStyle.copyWith(color: kGreyTextColor),
                                          textAlign: TextAlign.end,
                                        ),
                                      )),
                                    ),
                                  );
                                },
                              ),
                            );
                          }, error: (e, stack) {
                            return Center(
                              child: Text(e.toString()),
                            );
                          }, loading: () {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }),
                          userHistory.when(data: (history) {
                            return Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: ListView.builder(
                                itemCount: history.data?.userGainHistory?.length ?? 0,
                                shrinkWrap: true,
                                itemBuilder: (_, i) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 16),
                                    child: Container(
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), boxShadow: const [BoxShadow(color: kShadowColor), BoxShadow(color: kMainBacgrundColor, blurRadius: 10.0, spreadRadius: 0.0)]),
                                      child: (ListTile(
                                        contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                                        horizontalTitleGap: 12,
                                        leading: const CircleAvatar(
                                          radius: 20.0,
                                          backgroundImage: AssetImage(
                                            'images/logo4.png',
                                          ),
                                        ),
                                        title: Text(
                                          history.data?.userGainHistory?[i].description ?? '',
                                          style: kTextStyle.copyWith(color: kWhite),
                                        ),
                                        subtitle: Text(
                                          DateTimeFormat.format(DateTime.parse(history.data!.userGainHistory![i].createdAt.toString()), format: AmericanDateFormats.standard),
                                          style: kTextStyle.copyWith(color: kLightTextColor),
                                        ),
                                        trailing: Text(
                                          history.data!.userGainHistory![i].gainStatus == 'Gain' ? '${history.data!.userGainHistory![i].amount} Points' : '- ${history.data!.userGainHistory![i].amount} Points',
                                          style: kTextStyle.copyWith(color: history.data!.userGainHistory![i].gainStatus == 'Gain' ? kLightTextColor : Colors.red),
                                          textAlign: TextAlign.end,
                                        ),
                                      )),
                                    ),
                                  );
                                },
                              ),
                            );
                          }, error: (e, stack) {
                            return Center(
                              child: Text(e.toString()),
                            );
                          }, loading: () {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ListView.builder(
                              itemCount: history.data?.withdrawInfo?.length ?? 0,
                              shrinkWrap: true,
                              itemBuilder: (_, i) {
                                return Container(
                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), boxShadow: const [BoxShadow(color: kShadowColor), BoxShadow(color: kMainBacgrundColor, offset: Offset(0, 4), blurRadius: 16.0, spreadRadius: 0.0)]),
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      radius: 20.0,
                                      backgroundColor: Colors.white,
                                      backgroundImage: NetworkImage(
                                        history.data?.withdrawInfo?[i].withdrawMethods?.image ?? 'https://cdn-icons-png.flaticon.com/512/174/174861.png',
                                      ),
                                    ),
                                    title: Text(
                                      getStatus(statusCode: history.data!.withdrawInfo![i].approveStatus ?? 1),
                                      style: kTextStyle.copyWith(color: kWhite),
                                    ),
                                    subtitle: Text(
                                      DateTimeFormat.format(DateTime.parse(history.data!.withdrawInfo![i].createdAt.toString()), format: AmericanDateFormats.standard),
                                      style: kTextStyle.copyWith(color: kLightTextColor),
                                    ),
                                    trailing: Text(
                                      '${history.data!.withdrawInfo![i].currencyConvert?.currency?.isoCode} ${history.data!.withdrawInfo![i].amount.toString()}',
                                      style: kTextStyle.copyWith(color: kLightTextColor),
                                      textAlign: TextAlign.end,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }, error: (e, stack) {
            return Text(e.toString());
          }, loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          });
        }),
      ),
    );
  }
}

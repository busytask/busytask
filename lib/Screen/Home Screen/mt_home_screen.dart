// ignore_for_file: use_build_context_synchronously, unused_result
import 'package:cash_rocket/Model/user_profile_model.dart';
import 'package:cash_rocket/Provider/profile_provider.dart';
import 'package:cash_rocket/Repositories/authentication_repo.dart';
import 'package:cash_rocket/Screen/Authentication/New%20Authentication/welcome_screen.dart';
import 'package:cash_rocket/Screen/Constant%20Data/constant.dart';
import 'package:cash_rocket/Screen/Home%20Screen/Features%20Screen/mt_quiz.dart';
import 'package:cash_rocket/Screen/Home%20Screen/Features%20Screen/mt_videos.dart';
import 'package:cash_rocket/Screen/Home%20Screen/home.dart';
import 'package:cash_rocket/Screen/Home%20Screen/no_internet_screen.dart';
import 'package:cash_rocket/Screen/Profile/mt_profile.dart';
import 'package:cash_rocket/Screen/Scratch%20Card/scratch_card.dart';
import 'package:cash_rocket/Screen/Survey/survey.dart';
import 'package:cash_rocket/Screen/Website/website_list.dart';
import 'package:cash_rocket/Videos/Admob/admob.dart';
import 'package:cash_rocket/constant%20app%20information/const_commas.dart';
import 'package:cash_rocket/generated/l10n.dart' as lang;
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:share_plus/share_plus.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

import '../../Model/TutorialVideoModel.dart';
import '../../Model/purchase_model.dart';
import '../../Provider/database_provider.dart';
import '../Constant Data/config.dart';
import '../Offer Toro/offertoro_offerwall.dart';
import 'Features Screen/mt_refer.dart';
import 'Features Screen/mt_wheel.dart';
import 'Features Screen/redeem.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Admob admob = Admob();
  final _controller = YoutubePlayerController.fromVideoId(
    videoId: 'iLnmTe5Q2Qw',
    autoPlay: false,
    params: const YoutubePlayerParams(showFullscreenButton: true),
  );

  void showRewardPopUp(String amount) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
              height: 135,
              decoration: BoxDecoration(
                border: Border.all(color: kWhite.withOpacity(0.3)),
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xff0E3E7B),
                  ),
                  BoxShadow(
                    color: Color(0xff262450),
                    spreadRadius: 0.0,
                    blurRadius: 16.0,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            lang.S.of(context).congratulations,
                            style: kTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14.0),
                          ),
                          const SizedBox(height: 5.0),
                          Text(
                            //'$amount Points received',
                            '$amount ${lang.S.of(context).pointsReceived}',
                            style: kTextStyle.copyWith(color: Colors.white),
                            maxLines: 2,
                          ),
                          const SizedBox(height: 14.0),
                          Container(
                            padding: const EdgeInsets.all(5.0),
                            decoration: BoxDecoration(
                              gradient: buttonGradiant,
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                              child: Text(
                                lang.S.of(context).ok,
                                style: kTextStyle.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ).onTap(() => {
                                finish(context),
                                const Home().launch(context),
                              })
                        ],
                      ),
                    ),
                    Expanded(
                        child: Image.asset(
                      'images/gotReward.png',
                      height: 125,
                    ))
                  ],
                ),
              ),
            ),
          );
        });
  }

  void showRewardsPopUp() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            child: Container(
              height: 153,
              decoration: BoxDecoration(
                border: Border.all(color: kWhite.withOpacity(0.3)),
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xff0E3E7B),
                  ),
                  BoxShadow(
                    color: Color(0xff262450),
                    spreadRadius: 0.0,
                    blurRadius: 16.0,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                lang.S.of(context).dailyReward,
                                style: kTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10.0),
                              Text(
                                lang.S.of(context).alreadyRewardedComeBackLater,
                                //'Already rewarded\ncome back later',
                                style: kTextStyle.copyWith(color: Colors.white, fontSize: 14),
                                maxLines: 2,
                              ),
                              const SizedBox(height: 10.0),
                              Container(
                                padding: const EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                  gradient: buttonGradiant,
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                                  child: Text(
                                    lang.S.of(context).ok,
                                    style: kTextStyle.copyWith(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ).onTap(() => {
                                    finish(context),
                                    const Home().launch(context),
                                  })
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(child: Image.asset('images/congras.png')),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  List<String> bannerList = [
    'images/banner1.png',
    'images/banner2.png',
  ];
  List<String> featureList = [
    'images/offer.png',
    'images/videos.png',
    'images/wheel.png',
    'images/refer.png',
  ];
  List<String> featureList2 = [
    'images/redeem.png',
    'images/quiz.png',
    'images/tutorial.png',
    'images/share.png',
  ];
  bool isBalanceShow = false;

  Future<void> checkInternet() async {
    // bool result = await InternetConnectionChecker().hasConnection;
    bool result = await InternetConnection().hasInternetAccess;
    if (!result && mounted) {
      NoInternetScreen(screenName: widget).launch(context);
    }
  }

  @override
  void initState() {
    checkInternet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (_, ref, watch) {
      AsyncValue<UserProfileModel> profile = ref.watch(personalProfileProvider);
      AsyncValue<TutorialVideoModel> tutorial = ref.watch(tutorialVideoProvider);
      return profile.when(data: (info) {
        if (info.data?.user?.status == 0) {
          DataBase().deleteToken();
          //EasyLoading.showError('You Are Disabled!');
          EasyLoading.showError(lang.S.of(context).youAreDisabled);
          const WelcomeScreen().launch(context, isNewTask: true);
        }
        return Scaffold(
          // appBar: AppBar(
          //   titleSpacing: 0.0,
          //   automaticallyImplyLeading: false,
          //   backgroundColor: kMainColor,
          //   elevation: 0.0,
          //   title: ListTile(
          //     leading: Container(
          //       decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.0), border: Border.all(color: Colors.white)),
          //       child: CircleAvatar(
          //         radius: 18.0,
          //         backgroundImage: NetworkImage(info.data?.user?.image == Config.siteUrl
          //             ? 'https://raw.githubusercontent.com/Ashwinvalento/cartoon-avatar/master/lib/images/female/68.png'
          //             : info.data?.user?.image ?? 'https://raw.githubusercontent.com/Ashwinvalento/cartoon-avatar/master/lib/images/female/68.png'),
          //       ),
          //     ).onTap(
          //       () => const Profile().launch(context),
          //     ),
          //     title: Text(
          //       info.data?.user?.name ?? '',
          //       style: kTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          //     ),
          //   ),
          //   actions: [
          //     Padding(
          //       padding: const EdgeInsets.all(15.0),
          //       child: Container(
          //         height: 35,
          //         padding: const EdgeInsets.all(2.0),
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(30.0),
          //           color: Colors.white.withOpacity(0.3),
          //           border: Border.all(
          //             color: Colors.white,
          //           ),
          //         ),
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             AnimatedOpacity(
          //               opacity: !isBalanceShow ? 1.0 : 0.0,
          //               duration: const Duration(milliseconds: 1000),
          //               child: Container(
          //                 height: 20,
          //                 width: 20,
          //                 decoration: BoxDecoration(
          //                   borderRadius: BorderRadius.circular(30.0),
          //                   gradient: kBalanceGradiant
          //                 ),
          //                 child: const Icon(
          //                   FeatherIcons.dollarSign,
          //                   size: 15.0,
          //                   color: Colors.white,
          //                 ),
          //               ),
          //             ),
          //             const SizedBox(width: 5.0),
          //             Text(isBalanceShow ? '${info.data?.user?.wallet?.balance ?? ''}' : lang.S.of(context).balance,style: kTextStyle.copyWith(color: Colors.white),),
          //             const SizedBox(width: 5.0),
          //             AnimatedOpacity(
          //               opacity: isBalanceShow ? 1.0 : 0.0,
          //               duration: const Duration(milliseconds: 1000),
          //               child: Container(
          //                 height: 20,
          //                 width: 20,
          //                 decoration: BoxDecoration(
          //                   borderRadius: BorderRadius.circular(30.0),
          //                   gradient: kBalanceGradiant,
          //                   // border: Border.all(color: Colors.white, width: 2.0),
          //                 ),
          //                 child: const Icon(
          //                   FeatherIcons.dollarSign,
          //                   size: 15.0,
          //                   color: Colors.white,
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ).onTap(() {
          //         setState(() {
          //           isBalanceShow = !isBalanceShow;
          //         });
          //       }),
          //     ),
          //   ],
          // ),
          body: RefreshIndicator(
            onRefresh: () async {
              ref.refresh(personalProfileProvider);
              ref.refresh(withdrawHistoryProvider);
              ref.refresh(userHistoryProvider);
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: context.width(),
                    decoration: BoxDecoration(
                      gradient: containerGradiant,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: Container(
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30.0), border: Border.all(color: Colors.white)),
                                child: CircleAvatar(
                                  radius: 18.0,
                                  backgroundImage: NetworkImage(info.data?.user?.image == Config.siteUrl ? 'https://raw.githubusercontent.com/Ashwinvalento/cartoon-avatar/master/lib/images/female/68.png' : info.data?.user?.image ?? 'https://raw.githubusercontent.com/Ashwinvalento/cartoon-avatar/master/lib/images/female/68.png'),
                                ),
                              ).onTap(
                                () => const Profile().launch(context),
                              ),
                              title: Text(
                                info.data?.user?.name ?? '',
                                style: kTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ),
                            trailing: Container(
                              height: 32,
                              width: 130,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                color: Colors.white.withOpacity(0.3),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.4),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  AnimatedOpacity(
                                    opacity: !isBalanceShow ? 1.0 : 0.0,
                                    duration: const Duration(milliseconds: 1000),
                                    child: Container(
                                      height: 30,
                                      width: 30,
                                      decoration: const BoxDecoration(shape: BoxShape.circle, gradient: kBalanceGradiant),
                                      child: const Icon(
                                        FeatherIcons.dollarSign,
                                        size: 15.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 5.0),
                                  Text(
                                    isBalanceShow ? myFormat.format(info.data?.user?.wallet?.balance) : lang.S.of(context).balance,
                                    style: mediumTextStyle,
                                    textAlign: TextAlign.start,
                                  ),
                                  const SizedBox(width: 5.0),
                                  AnimatedOpacity(
                                    opacity: isBalanceShow ? 1.0 : 0.0,
                                    duration: const Duration(milliseconds: 1000),
                                    child: Container(
                                      height: 30,
                                      width: 30,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        gradient: kBalanceGradiant,
                                        // border: Border.all(color: Colors.white, width: 2.0),
                                      ),
                                      child: const Icon(
                                        FeatherIcons.dollarSign,
                                        size: 15.0,
                                        color: Colors.white,
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
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              border: Border.all(
                                color: Colors.white.withOpacity(0.3),
                              ),
                              color: const Color(0xffF0F0F0).withOpacity(0.3),
                            ),
                            child: ListTile(
                              contentPadding: const EdgeInsets.symmetric(horizontal: 4, vertical: 5),
                              visualDensity: const VisualDensity(vertical: -4),
                              leading: Image.asset(
                                'images/speed.png',
                                height: 41,
                                width: 41,
                              ),
                              // leading: const CircleAvatar(
                              //   backgroundColor: Colors.transparent,
                              //   radius: 20,
                              //   backgroundImage: AssetImage('images/speed.png'),
                              // ),
                              title: Center(
                                child: Text(
                                  lang.S.of(context).collectDailyRewardNow,
                                  style: mediumTextStyle.copyWith(fontSize: 15),
                                ),
                              ),
                              trailing: Container(
                                  alignment: Alignment.center,
                                  height: 41,
                                  width: 41,
                                  // padding: const EdgeInsets.all(15.0),
                                  decoration: const BoxDecoration(shape: BoxShape.circle, gradient: kBalanceGradiant),
                                  child: Text(
                                    '20+',
                                    style: kTextStyle.copyWith(color: kWhite, fontWeight: FontWeight.bold),
                                  )),
                            ),
                          ).onTap(
                            () async {
                              try {
                                //EasyLoading.show(status: 'Getting Today\'s Reward');
                                EasyLoading.show(status: lang.S.of(context).gettingTodayReward);
                                bool isValid = await PurchaseModel().isActiveBuyer();
                                if (isValid) {
                                  var status = await AuthRepo().dailyRewards();
                                  if (status) {
                                    showRewardPopUp('100');
                                    //EasyLoading.showSuccess('Reward Added');
                                    EasyLoading.showSuccess(lang.S.of(context).rewardAdded);
                                    admob.showInterstitialAd();
                                    ref.refresh(personalProfileProvider);
                                  } else {
                                    //EasyLoading.showError('Already Rewarded. Try Again Later');
                                    EasyLoading.showError(lang.S.of(context).alreadyRewardedTryAgainLater);
                                    showRewardsPopUp();
                                  }
                                } else {
                                  showLicense(context: context);
                                }
                              } catch (e) {
                                showRewardsPopUp();
                                // EasyLoading.instance
                                //   .backgroundColor = Theme.of(context).colorScheme.primaryContainer;
                                EasyLoading.showError(e.toString().replaceRange(0, 10, ''));
                              }
                            },
                          ),
                          const SizedBox(height: 22.0),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, bottom: 15),
                    child: Text(
                      lang.S.of(context).tendingOffers,
                      //'Tending Offers',
                      style: kTextStyle.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: HorizontalList(
                      padding: EdgeInsets.zero,
                      itemCount: bannerList.length,
                      itemBuilder: (_, i) {
                        return Container(
                          height: 150,
                          width: 305,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                bannerList[i],
                              ),
                            ),
                          ),
                        ).onTap(() {
                          if (i == 0) {
                            const Redeem().launch(context);
                          } else {
                            Share.share('I have earned \$100 in a day. Use my refer code to earn \$10 on signup. My Refer Code is ${info.data?.user?.referCode ?? ''}');
                          }
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          lang.S.of(context).allFeatures,
                          style: kTextStyle.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              const Image(
                                height: 60,
                                width: 60,
                                image: AssetImage(
                                  'images/offer.png',
                                ),
                              ),
                              const SizedBox(height: 4.0),
                              Center(
                                  child: Text(
                                lang.S.of(context).offers,
                                style: mediumTextStyle.copyWith(fontSize: 14),
                              )),
                            ],
                          ).onTap(
                            () => const OffertoroOfferwall().launch(context),
                          ),
                          Column(
                            children: [
                              const Image(
                                height: 60,
                                width: 60,
                                image: AssetImage('images/videos.png'),
                              ),
                              const SizedBox(height: 4.0),
                              Center(
                                  child: Text(
                                lang.S.of(context).videos,
                                style: mediumTextStyle.copyWith(fontSize: 14),
                              )),
                            ],
                          ).onTap(
                            () => const Videos().launch(context),
                          ),
                          Column(
                            children: [
                              const Image(
                                height: 60,
                                width: 60,
                                image: AssetImage('images/wheel.png'),
                              ),
                              const SizedBox(height: 4.0),
                              Center(
                                  child: Text(
                                lang.S.of(context).wheel,
                                style: mediumTextStyle,
                              )),
                            ],
                          ).onTap(
                            () => const Wheel().launch(context),
                          ),
                          Column(
                            children: [
                              const Image(
                                height: 60,
                                width: 60,
                                image: AssetImage('images/refer.png'),
                              ),
                              const SizedBox(height: 4.0),
                              Center(
                                  child: Text(
                                lang.S.of(context).refer,
                                style: mediumTextStyle.copyWith(fontSize: 14),
                              )),
                            ],
                          ).onTap(
                            () => const Refer().launch(context),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                const Image(
                                  height: 60,
                                  width: 60,
                                  image: AssetImage('images/reedem.png'),
                                ),
                                const SizedBox(height: 4.0),
                                Center(
                                    child: Text(
                                  lang.S.of(context).redeem,
                                  style: mediumTextStyle.copyWith(fontSize: 14),
                                )),
                              ],
                            ).onTap(
                              () => const Redeem().launch(context),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                const Image(
                                  height: 60,
                                  width: 60,
                                  image: AssetImage('images/quiz.png'),
                                ),
                                const SizedBox(height: 4.0),
                                Center(
                                    child: Text(
                                  lang.S.of(context).quiz,
                                  style: mediumTextStyle,
                                )),
                              ],
                            ).onTap(
                              () => const MtQuiz().launch(context),
                            ),
                          ),
                          tutorial.when(data: (snapShot) {
                            return Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Dialog(
                                        child: YoutubePlayer(
                                          controller: _controller,
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Column(
                                  children: [
                                    const Image(
                                      height: 60,
                                      width: 60,
                                      image: AssetImage('images/tutorial.png'),
                                    ),
                                    const SizedBox(height: 4.0),
                                    Center(
                                        child: Text(
                                      lang.S.of(context).tutorial,
                                      style: mediumTextStyle,
                                    )),
                                  ],
                                ),
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
                          Expanded(
                            child: Column(
                              children: [
                                const Image(
                                  height: 60,
                                  width: 60,
                                  image: AssetImage('images/share.png'),
                                ),
                                const SizedBox(height: 4.0),
                                Center(
                                  child: Text(
                                    lang.S.of(context).share,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: mediumTextStyle,
                                  ),
                                )
                              ],
                            ).onTap(() => Share.share('I have earned \$100 in a day. Use my refer code to earn \$10 on signup. My Refer Code is ${info.data?.user?.referCode ?? ''}')),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                const Image(
                                  image: AssetImage('images/visit.png'),
                                  height: 60,
                                  width: 60,
                                ),
                                const SizedBox(height: 4.0),
                                Center(
                                    child: Text(
                                  lang.S.of(context).websites,
                                  style: mediumTextStyle,
                                )),
                              ],
                            ).onTap(
                              () => const WebsiteList().launch(context),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                SurveyScreen(
                                  profile: info,
                                ).launch(context);
                              },
                              child: Column(
                                children: [
                                  const Image(
                                    image: AssetImage('images/card.png'),
                                    height: 60,
                                    width: 60,
                                  ),
                                  const SizedBox(height: 4.0),
                                  Center(
                                      child: Text(
                                    lang.S.of(context).survey,
                                    style: mediumTextStyle,
                                  )),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                const Image(
                                  image: AssetImage('images/survey.png'),
                                  height: 60,
                                  width: 60,
                                ),
                                const SizedBox(height: 4.0),
                                Center(
                                    child: Text(
                                  lang.S.of(context).scratchCard,
                                  style: mediumTextStyle.copyWith(fontSize: 13.5),
                                )),
                              ],
                            ).onTap(
                              () => const ScratchCard().launch(context),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                const Image(
                                  image: AssetImage('images/share.png'),
                                ),
                                const SizedBox(height: 4.0),
                                Center(
                                  child: Text(
                                    lang.S.of(context).share,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: kTextStyle.copyWith(color: kTitleColor, fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ).onTap(() => Share.share('I have earned \$100 in a day. Use my refer code to earn \$10 on signup. My Refer Code is ${info.data?.user?.referCode ?? ''}')),
                          ).visible(false),
                          const Expanded(child: Text(''))
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
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
      });
    });
  }
}

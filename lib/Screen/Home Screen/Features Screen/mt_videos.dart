import 'package:applovin_max/applovin_max.dart';
import 'package:cash_rocket/Screen/Constant%20Data/constant.dart';
import 'package:cash_rocket/Screen/Video%20List/video_list.dart';
import 'package:cash_rocket/Videos/Admob/admob.dart';
import 'package:cash_rocket/Videos/AppLovin/applovin.dart';
import 'package:cash_rocket/Videos/StartApp/startapp.dart';
import 'package:cash_rocket/generated/l10n.dart' as lang;
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:startapp_sdk/startapp.dart';
import '../../../Model/user_profile_model.dart';
import '../../../Provider/profile_provider.dart';
import '../../../constant app information/const_commas.dart';
import '../no_internet_screen.dart';

class Videos extends StatefulWidget {
  const Videos({super.key});

  @override
  State<Videos> createState() => _VideosState();
}

enum AdLoadState { notLoaded, loading, loaded }

class _VideosState extends State<Videos> {
  List<String> imageList = [
    'images/bg5.png',
    'images/bg2.png',
    'images/bg3.png',
    'images/bg4.png',
    'images/bg1.png',
  ];

  List<String> logoList = [
    'images/youtube.png',
    'images/app.png',
    'images/sa.png',
    'images/am.png',
    'images/an.png',
  ];

  List<String> titleList = [
    'Custom videos',
    'AppLovin',
    'StartApp',
    'AdMob',
    'Audience Network',
  ];
  List<String> subtitleList = [
    'Watch viewos and get Points',
    'Watch views and get Points',
    'Watch views and get Points',
    'Watch views and get Points',
    'Watch views and get Points',
  ];

  bool isBalanceShow = false;
  var startAppSdk = StartAppSdk();
  Admob admob = Admob();
  // FacebookRewardVideoAd facebookRewardVideoAd = FacebookRewardVideoAd();
  StartApp startApp = StartApp();
  AppLovin appLovin = AppLovin();

  void initialization() async {
    await AppLovinMAX.initialize(sdkKey);
    // FacebookAudienceNetwork.init(
    //   testingId: "a77955ee-3304-4635-be65-81029b0f5201",
    //   iOSAdvertiserTrackingEnabled: true,
    // );
  }

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
    initialization();
    // facebookRewardVideoAd.loadRewardedVideoAd();
    admob.createRewardedAd();

    appLovin.loadAds();
    super.initState();
  }

  bool isFirst = true;
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (_, ref, watch) {
      isFirst ? startApp.loadRewardedVideoAd(ref: ref) : null;
      isFirst = true;
      AsyncValue<UserProfileModel> profile = ref.watch(personalProfileProvider);
      return profile.when(data: (info) {
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
            backgroundColor: kMainColor,
            elevation: 0.0,
            title: Text(
              lang.S.of(context).videos,
              style: kTextStyle.copyWith(color: Colors.white),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isBalanceShow = !isBalanceShow;
                    });
                  },
                  behavior: HitTestBehavior.translucent,
                  child: Container(
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
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: kBalanceGradiant,
                            ),
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
                  ),
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    childAspectRatio: 1.2,
                    mainAxisSpacing: 10.0,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: List.generate(
                      titleList.length,
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
                                    style: kTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.0),
                                  ),
                                  const SizedBox(
                                    height: 4.0,
                                  ),
                                  Text(
                                    subtitleList[i],
                                    style: kTextStyle.copyWith(color: Colors.white, fontSize: 12.0),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ).onTap(() {
                          switch (i) {
                            case 0:
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const VideoList()));
                              break;
                            case 1:
                              appLovin.showAds(ref: ref);
                              break;
                            case 2:
                              startApp.showAds();
                              break;
                            case 3:
                              admob.showRewardedAd(ref: ref);
                              break;
                            case 4:
                              // facebookRewardVideoAd.showRewardedAd();
                              break;
                            default:
                              admob.showRewardedAd(ref: ref);
                          }
                        });
                      },
                    ),
                  ),
                ),
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
      });
    });
  }
}

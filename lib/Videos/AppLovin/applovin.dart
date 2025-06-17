// ignore_for_file: unused_result

import 'dart:io';
import 'dart:math';

import 'package:applovin_max/applovin_max.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../Provider/database_provider.dart';
import '../../Provider/profile_provider.dart';
import '../../Repositories/rewards_repo.dart';

class AppLovin {
  var _rewardedAdRetryAttempt = 0;

  Future<void> loadAds() async {
    final String rewardedAdUnitId = Platform.isAndroid ? await DataBase().retrieveString('applovinRewardedAdAndroid') ?? "6d4421fd379b387e" : await DataBase().retrieveString('applovinRewardedAdIos') ?? "6d4421fd379b387e";

    toast("Initializing SDK...");
    AppLovinMAX.loadRewardedAd(rewardedAdUnitId);
  }

  void initializeRewardedAds({required WidgetRef ref}) {
    AppLovinMAX.setRewardedAdListener(RewardedAdListener(onAdLoadedCallback: (ad) {
      // Rewarded ad is ready to be shown. AppLovinMAX.isRewardedAdReady(_rewarded_ad_unit_id) will now return 'true'
      toast('Rewarded ad loaded from ${ad.networkName}');

      // Reset retry attempt
      _rewardedAdRetryAttempt = 0;
    }, onAdLoadFailedCallback: (adUnitId, error) {
      // Rewarded ad failed to load
      // We recommend retrying with exponentially higher delays up to a maximum delay (in this case 64 seconds)
      _rewardedAdRetryAttempt = _rewardedAdRetryAttempt + 1;

      int retryDelay = pow(2, min(6, _rewardedAdRetryAttempt)).toInt();
      toast('Rewarded ad failed to load with code ${error.code} - retrying in ${retryDelay}s');

      Future.delayed(Duration(milliseconds: retryDelay * 1000), () {
        loadAds();
      });
    }, onAdDisplayedCallback: (ad) {
      toast('Rewarded ad loaded from ${ad.networkName}');
    }, onAdDisplayFailedCallback: (ad, error) {
      toast(error.message.toString());
    }, onAdClickedCallback: (ad) {
      toast('Ad Clicked');
    }, onAdHiddenCallback: (ad) {
      toast('Ad Hidden');
    }, onAdReceivedRewardCallback: (ad, reward) async {
      try {
        EasyLoading.show(status: 'Getting rewards');
        var response = await RewardRepo().addPoint('10', 'Applovin Video Ads');
        if (response) {
          EasyLoading.showSuccess('You Have Earned 10 Coins');
          ref.refresh(personalProfileProvider);
        } else {
          EasyLoading.showError('Error Happened. Try Again');
        }
      } catch (e) {
        EasyLoading.showError(e.toString());
      }
    }));
  }

  void showAds({required WidgetRef ref}) async {
    final String rewardedAdUnitId = Platform.isAndroid ? await DataBase().retrieveString('applovinRewardedAdAndroid') ?? "6d4421fd379b387e" : await DataBase().retrieveString('applovinRewardedAdIos') ?? "6d4421fd379b387e";

    bool isReady = (await AppLovinMAX.isRewardedAdReady(rewardedAdUnitId))!;
    if (isReady) {
      initializeRewardedAds(ref: ref);
      AppLovinMAX.showRewardedAd(rewardedAdUnitId);
      loadAds();
    } else {
      loadAds();
    }
  }
}

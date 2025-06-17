// ignore_for_file: unused_result

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:startapp_sdk/startapp.dart';

import '../../Provider/profile_provider.dart';
import '../../Repositories/rewards_repo.dart';

class StartApp {
  StartAppRewardedVideoAd? rewardedVideoAd;
  int? reward;
  bool isBalanceShow = false;
  var startAppSdk = StartAppSdk();
  void loadRewardedVideoAd({required WidgetRef ref}) {
    startAppSdk.setTestAdsEnabled(false);
    startAppSdk.loadRewardedVideoAd(
      onAdNotDisplayed: () {
        debugPrint('onAdNotDisplayed: rewarded video');
        rewardedVideoAd?.dispose();
        rewardedVideoAd = null;
      },
      onAdHidden: () {
        debugPrint('onAdHidden: rewarded video');
        EasyLoading.showSuccess('You Have Earned 10 Coins');
        ref.refresh(personalProfileProvider);

        rewardedVideoAd?.dispose();
        rewardedVideoAd = null;
      },
      onVideoCompleted: () async {
        try {
          EasyLoading.show(status: 'Getting rewards');
          var response = await RewardRepo().addPoint('10', 'Startapp Video Ads');
          if (response) {
            EasyLoading.showSuccess('You Have Earned 10 Coins');
            ref.refresh(personalProfileProvider);
          } else {
            EasyLoading.showError('Error Happened. Try Again');
          }
        } catch (e) {
          EasyLoading.showError(e.toString());
        }
      },
    ).then((rewardedVideoAd) {
      this.rewardedVideoAd = rewardedVideoAd;
    }).onError((ex, stackTrace) {
      debugPrint("Error loading Rewarded Video ad: ${ex.toString()}");
    }).onError((error, stackTrace) {
      debugPrint("Error loading Rewarded Video ad: $error");
    });
  }

  void showAds() {
    if (rewardedVideoAd != null) {
      rewardedVideoAd!.show().onError((error, stackTrace) {
        toast("Error showing Rewarded Video ad: $error");
        return false;
      });
    }
  }
}

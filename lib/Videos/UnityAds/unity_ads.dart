// ignore_for_file: avoid_print

// import 'package:cash_rocket/Screen/Constant%20Data/ad_helper.dart';
// import 'package:nb_utils/nb_utils.dart';
// import 'package:unity_ads_plugin/unity_ads_plugin.dart';
//
// class UnityAdsSetup {
//   void loadAds() {
//     UnityAds.init(
//       gameId: 'bfd8eb3b-c124-44ba-b077-0592d34cbc27',
//       onComplete: () => toast('Initialization Complete'),
//       onFailed: (error, message) => toast('Initialization Failed: $error $message'),
//       testMode: false,
//     );
//     UnityAds.load(
//       placementId: AdHelper.unityAdUnitId,
//       onComplete: (placementId) => print('Load Complete $placementId'),
//       onFailed: (placementId, error, message) => print('Load Failed $placementId: $error $message'),
//     );
//   }
//
//   void showAds() {
//     UnityAds.showVideoAd(
//       placementId: AdHelper.unityAdUnitId,
//       onStart: (placementId) => print('Video Ad $placementId started'),
//       onClick: (placementId) => print('Video Ad $placementId click'),
//       onSkipped: (placementId) => print('Video Ad $placementId skipped'),
//       onComplete: (placementId) => print('Video Ad $placementId completed'),
//       onFailed: (placementId, error, message) {
//         loadAds();
//       },
//     );
//   }
// }

import 'dart:io';

class AdHelper {
  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-1470789713232521~9094526816";
    } else if (Platform.isIOS) {
      return "ca-app-pub-1470789713232521~8766373697";
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-1470789713232521~9094526816";
    } else if (Platform.isIOS) {
      return "ca-app-pub-1470789713232521~8766373697";
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get unityAdUnitId {
    if (Platform.isAndroid) {
      return "205144443";
    } else if (Platform.isIOS) {
      return "205498706";
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }
}

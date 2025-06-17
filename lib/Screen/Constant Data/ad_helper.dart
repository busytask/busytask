import 'dart:io';

class AdHelper {
  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3940256099942544/5224354917";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/1712485313";
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3940256099942544/8691691433";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/8691691433";
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get unityAdUnitId {
    if (Platform.isAndroid) {
      return "4899303";
    } else if (Platform.isIOS) {
      return "4899302";
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }
}

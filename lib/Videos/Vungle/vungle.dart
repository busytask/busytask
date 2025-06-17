import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:vungle/vungle.dart';

class VungleAd {
  String? appId;
  String? placementId;
  bool sdkInit = false;
  bool adLoaded = false;
  String sdkVersion = "";

  void loadVungle() {
    if (Platform.isAndroid) {
      appId = '62dcea4266c52ee961b451df';
      placementId = 'ROCKET-8900187';
      Vungle.init(appId!);
    } else {
      appId = '62dcea4266c52ee961b451df';
      placementId = 'ROCKET-8900187';
      Vungle.init(appId!);
    }
    Vungle.loadAd(placementId!);
    onPlayAd();
  }

  void onPlayAd() async {
    if (await Vungle.isAdPlayable(placementId!)) {
      Vungle.playAd(placementId!);
    } else {
      if (kDebugMode) {
        print('Ad is not ready');
      }
    }
  }
}

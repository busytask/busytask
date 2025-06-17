import 'dart:convert';

import 'package:cash_rocket/Model/og_ads_model.dart';
import 'package:cash_rocket/Screen/Constant%20Data/config.dart';
import 'package:http/http.dart' as http;

class OgAdsRepo {
  Future<OgAdsModel> getOgAds() async {
    final response = await http.get(Uri.parse('${Config.ogAdsUrl}?ip=${Config.ogAdsIp}&user_agent=${Config.ogAdsUserAgent}&ctype=${Config.ogAdsCtype}'), headers: {'Authorization': 'Bearer ${Config.ogAdsAuthorizationToken}'});
    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return OgAdsModel.fromJson(data);
    } else {
      return OgAdsModel.fromJson(data);
    }
  }
}

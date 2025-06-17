import 'dart:convert';

import 'package:cash_rocket/Model/wannads_model.dart';
import 'package:cash_rocket/Screen/Constant%20Data/config.dart';
import 'package:http/http.dart' as http;

class WannadsRepo {
  Future<List<WannadsModel>> getWannads() async {
    List<WannadsModel> wannads = [];
    final response = await http.get(Uri.parse('${Config.wannadsUrl}?api_key=${Config.wannadsApiKey}&api_secret=${Config.wannadsApiSecret}&device=${Config.wannadsDevice}&category=${Config.wannadsCategory}&country=${Config.wannadsCountry}&ip=${Config.wannadsIp}&sub_id=${Config.wannadsSubId}'), headers: {'Content-Type': 'application/json'});
    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      for (Map i in data) {
        wannads.add(WannadsModel.fromJson(i));
      }
      return wannads;
    } else {
      return wannads;
    }
  }
}

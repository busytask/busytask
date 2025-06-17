import 'dart:convert';

import 'package:cash_rocket/Screen/Constant%20Data/config.dart';
import 'package:http/http.dart' as http;

import '../Model/adgem_model.dart';

class AdGemRepo {
  Future<AdgemModel> getadGem() async {
    final response = await http.get(Uri.parse('${Config.adGemUrl}?playerid=${Config.adGemPlayerId}&appid=${Config.adGemAppId}'));
    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return AdgemModel.fromJson(data);
    } else {
      return AdgemModel.fromJson(data);
    }
  }
}

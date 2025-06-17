import 'dart:convert';

import 'package:cash_rocket/Model/kiwi_wall_model.dart';
import 'package:cash_rocket/Screen/Constant%20Data/config.dart';
import 'package:http/http.dart' as http;

class KiwiWallRepo {
  Future<KiwiWallModel> getkiwiWall() async {
    final response = await http.get(Uri.parse('${Config.kiwiWallUrl}/${Config.kiwiWallApiKey}/?s=${Config.kiwiUserId}&ip_address=${Config.kiwiWallIp}&country=${Config.kiwiWallCountry}'));
    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return KiwiWallModel.fromJson(data);
    } else {
      return KiwiWallModel.fromJson(data);
    }
  }
}

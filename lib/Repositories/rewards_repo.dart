import 'dart:convert';

import 'package:cash_rocket/Model/all_adnetworks.dart';
import 'package:cash_rocket/Model/history/check_quiz_model.dart';
import 'package:http/http.dart' as http;

import '../Provider/database_provider.dart';
import '../Screen/Constant Data/config.dart';

class RewardRepo {
  Future<bool> addPoint(String amount, String description) async {
    String? token = await DataBase().retrieveString('token');
    Uri url = Uri.parse(Config.serverUrl + Config.addCoinUrl);
    var response = await http.post(url, headers: {'Authorization': 'Bearer $token'}, body: <String, dynamic>{'coin': amount, 'description': description});
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('An error occurred. Please try again');
    }
  }

  Future<bool> removePoint(String amount, String description) async {
    String? token = await DataBase().retrieveString('token');
    Uri url = Uri.parse(Config.serverUrl + Config.removeCoinUrl);
    var response = await http.post(url, headers: {'Authorization': 'Bearer $token'}, body: <String, dynamic>{'coin': amount, 'description': description});
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('An error occurred. Please try again');
    }
  }

  Future<CheckQuizModel> checkQuiz(String quizId) async {
    String? token = await DataBase().retrieveString('token');
    Uri url = Uri.parse(Config.serverUrl + Config.checkQuizUrl);
    var response = await http.post(url, headers: {
      'Authorization': 'Bearer $token'
    }, body: <String, dynamic>{
      'quiz_id': quizId,
    });
    if (response.statusCode == 302) {
      return CheckQuizModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('An error occurred. Please try again');
    }
  }

  Future<bool> addQuizPoint(String amount, String quizId, String winStatus, String resultStatus) async {
    String? token = await DataBase().retrieveString('token');
    Uri url = Uri.parse(Config.serverUrl + Config.quizRewardUrl);
    var response = await http.post(url, headers: {
      'Authorization': 'Bearer $token'
    }, body: <String, dynamic>{
      'coin': amount,
      'quiz_id': quizId,
      'win_status': winStatus,
      'result_status': resultStatus,
    });
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('An error occurred. Please try again');
    }
  }

  Future<bool> getAdNetWorks() async {
    bool ret = false;
    String? token = await DataBase().retrieveString('token');
    Uri url = Uri.parse(Config.serverUrl + Config.adNetWorksUrl);
    try {
      var response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        var data = AllAdnetworks.fromJson(jsonDecode(response.body));
        DataBase().saveString(data.data?.adnetwork?[0].admobInterstitialAndroid ?? '', 'admobInterstitialAndroid');
        DataBase().saveString(data.data?.adnetwork?[0].admobInterstitialIos ?? '', 'admobInterstitialIos');
        DataBase().saveString(data.data?.adnetwork?[0].admobRewardedAndroid ?? '', 'admobRewardedAndroid');
        DataBase().saveString(data.data?.adnetwork?[0].admobRewardedAdIos ?? '', 'admobRewardedAdIos');
        DataBase().saveString(data.data?.adnetwork?[0].applovinRewardedAdAndroid ?? '', 'applovinRewardedAdAndroid');
        DataBase().saveString(data.data?.adnetwork?[0].applovinRewardedAdIos ?? '', 'applovinRewardedAdIos');
        DataBase().saveString(data.data?.adnetwork?[0].audienceNetworkInterstitialAndroid ?? '', 'audienceNetworkInterstitialAndroid');
        DataBase().saveString(data.data?.adnetwork?[0].audienceNetworkInterstitialIos ?? '', 'audienceNetworkInterstitialIos');
        DataBase().saveString(data.data?.adnetwork?[0].audienceNetworkRewardedAdAndroid ?? '', 'audienceNetworkRewardedAdAndroid');
        DataBase().saveString(data.data?.adnetwork?[0].audienceNetworkAdIos ?? '', 'audienceNetworkAdIos');
        DataBase().saveString(data.data?.adnetwork?[0].offertoroPublisherId ?? '', 'offertoroPublisherId');
        DataBase().saveString(data.data?.adnetwork?[0].offertoroAppId ?? '', 'offertoroAppId');
        DataBase().saveString(data.data?.adnetwork?[0].offertoroSecretKey ?? '', 'offertoroSecretKey');
        ret = true;
      } else {
        // throw Exception('An error occurred. Please try again');
      }
    } catch (e) {}
    return ret;
  }
}

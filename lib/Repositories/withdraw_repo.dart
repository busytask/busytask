import 'dart:convert';

import 'package:cash_rocket/Model/history/user_history_model.dart' as uh;
import 'package:cash_rocket/Model/withdraw_currency_convert_model.dart' as wccm;
import 'package:cash_rocket/Model/withdraw_history_model.dart' as wh;
import 'package:cash_rocket/Model/withdraw_method_model.dart' as wm;
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../Provider/database_provider.dart';
import '../Screen/Constant Data/config.dart';

class WithdrawRepo {
  Future<wm.WithdrawMethodModel> withdrawMethodInfo() async {
    Uri url = Uri.parse(Config.serverUrl + Config.withdrawMethodUrl);
    String? token = await DataBase().retrieveString('token');
    var response = await http.get(url, headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200) {
      return wm.WithdrawMethodModel.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 404) {
      return wm.WithdrawMethodModel(data: wm.Data(withdrawMethod: []), message: '', success: false);
    } else {
      throw Exception('Authorization Failed');
    }
  }

  Future<wccm.WithdrawCurrencyConvertModel> withdrawCurrencyInfo() async {
    Uri url = Uri.parse(Config.serverUrl + Config.withdrawCurrencyUrl);
    String? token = await DataBase().retrieveString('token');
    var response = await http.get(url, headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200) {
      return wccm.WithdrawCurrencyConvertModel.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 404) {
      return wccm.WithdrawCurrencyConvertModel(success: false, message: '', data: wccm.Data(currencyConvertInfo: []));
    } else {
      throw Exception('Authorization Failed');
    }
  }

  Future<wh.WithdrawHistoryModel> withdrawHistoryInfo() async {
    Uri url = Uri.parse(Config.serverUrl + Config.withdrawHistoryUrl);
    String? token = await DataBase().retrieveString('token');
    var response = await http.get(url, headers: {'Authorization': 'Bearer $token'});
    if (kDebugMode) {
      print(response.body);
    }
    if (response.statusCode == 200) {
      return wh.WithdrawHistoryModel.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 404) {
      return wh.WithdrawHistoryModel(success: true, message: '', data: wh.Data(withdrawInfo: []));
    } else {
      throw Exception('Authorization Failed');
    }
  }

  Future<uh.UserHistoryModel> userHistoryInfo() async {
    Uri url = Uri.parse(Config.serverUrl + Config.userHistoryUrl);
    String? token = await DataBase().retrieveString('token');
    var response = await http.get(url, headers: {'Authorization': 'Bearer $token'});

    if (response.statusCode == 200) {
      return uh.UserHistoryModel.fromJson(jsonDecode(response.body));
    } else if (response.statusCode == 404) {
      return uh.UserHistoryModel(data: uh.Data(userGainHistory: [], userQuizHistory: []), message: '', success: true);
    } else {
      throw Exception('Authorization Failed');
    }
  }

  Future<bool> withdrawRequestInfo(String methodId, String currencyId, String coinAMount, String account) async {
    Uri url = Uri.parse(Config.serverUrl + Config.withdrawRequestUrl);
    String? token = await DataBase().retrieveString('token');
    var response = await http.post(url, headers: {'Authorization': 'Bearer $token'}, body: <String, String>{'method_id': methodId, 'currency_convert_id': currencyId, 'coins': coinAMount, 'account': account});
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('An Error Happened. Please Try Again');
    }
  }
}

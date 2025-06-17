import 'dart:convert';

import 'package:cash_rocket/Model/scratch_card_model.dart';
import 'package:cash_rocket/Model/sign_in_model.dart';
import 'package:cash_rocket/Model/spin_data_model.dart';
import 'package:cash_rocket/Model/user_profile_model.dart';
import 'package:cash_rocket/Model/video_model.dart';
import 'package:cash_rocket/Model/website_visit_model.dart';
import 'package:cash_rocket/Provider/database_provider.dart';
import 'package:cash_rocket/Screen/Authentication/New%20Authentication/setup_profile.dart';
import 'package:cash_rocket/Screen/Constant%20Data/config.dart';
import 'package:cash_rocket/Screen/Constant%20Data/constant.dart';
import 'package:cash_rocket/Screen/Home%20Screen/home.dart';
import 'package:cash_rocket/generated/l10n.dart' as lang;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:nb_utils/nb_utils.dart';

import '../Model/TutorialVideoModel.dart';
import '../Model/firebase_auth_model.dart';
import '../Screen/Authentication/New Authentication/welcome_screen.dart';

class AuthRepo {
  DataBase database = DataBase();

  Future<SignInModel> signInWithEmail(String email, String password) async {
    Uri url = Uri.parse(Config.serverUrl + Config.signInUrl);
    var response = await http.post(url, body: <String, dynamic>{'email': email, 'password': password});
    if (kDebugMode) {
      print(response.statusCode);
    }
    if (response.statusCode == 200) {
      return SignInModel.fromJson(jsonDecode(response.body));
    } else {
      var data = jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }

  Future<FirebaseAuthModel> signInWithPhone(String phone, BuildContext context) async {
    Uri url = Uri.parse(Config.serverUrl + Config.signInUrl);
    var response = await http.post(url, headers: {"Accept": "application/json"}, body: <String, dynamic>{'phone': phone, "device_token": "UYYUCGWFGGDVWUY3"});
    EasyLoading.dismiss();
    if (kDebugMode) {
      print('---------status code---${response.statusCode}------');
    }
    if (response.statusCode == 200) {
      var data = FirebaseAuthModel.fromJson(jsonDecode(response.body));
      database.saveString(data.token ?? "", 'token');
      Navigator.push(context, MaterialPageRoute(builder: (_) => Home()));
      return data;
    } else if (response.statusCode == 201) {
      var data = FirebaseAuthModel.fromJson(jsonDecode(response.body));
      database.saveString(data.token ?? "", 'token');
      Navigator.push(context, MaterialPageRoute(builder: (_) => const SetupProfile()));
      return data;
    } else if (response.statusCode == 401) {
      EasyLoading.showError(jsonDecode(response.body)['message']);
      const WelcomeScreen().launch(context, isNewTask: true);
      return FirebaseAuthModel();
    } else {
      var data = jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }

  // Future<FirebaseAuthModel> signInWithGoogle(String email, BuildContext context) async {
  //   Uri url = Uri.parse(Config.serverUrl + Config.signInUrl);
  //   var response = await http.post(url, body: <String, dynamic>{'email': email});
  //   print(response.body);
  //   EasyLoading.dismiss();
  //   if (response.statusCode == 200) {
  //     var data = FirebaseAuthModel.fromJson(jsonDecode(response.body));
  //     database.saveString(data.token ?? "", 'token');
  //     Navigator.push(context, MaterialPageRoute(builder: (_) => Home()));
  //     return data;
  //   } else if (response.statusCode == 201) {
  //     var data = FirebaseAuthModel.fromJson(jsonDecode(response.body));
  //     database.saveString(data.token ?? "", 'token');
  //     Navigator.push(context, MaterialPageRoute(builder: (_) => SetupProfile()));
  //     return data;
  //   } else if (response.statusCode == 401) {
  //     EasyLoading.showError(jsonDecode(response.body)['message']);
  //     const WelcomeScreen().launch(context, isNewTask: true);
  //     await GoogleSignIn().disconnect();
  //     return FirebaseAuthModel();
  //   } else {
  //     var data = jsonDecode(response.body);
  //     throw Exception(data['message']);
  //   }
  // }

  Future<FirebaseAuthModel> signInWithGoogle(String email, BuildContext context) async {
    Uri url = Uri.parse(Config.serverUrl + Config.signInUrl);
    var response = await http.post(url, headers: {"Accept": "application/json"}, body: <String, dynamic>{'email': email, "device_token": "UYYUCGWFGGDVWUY3"});
    if (kDebugMode) {
      print(response.body);
    }
    EasyLoading.dismiss();
    if (response.statusCode == 200) {
      var data = FirebaseAuthModel.fromJson(jsonDecode(response.body));
      database.saveString(data.token ?? "", 'token');
      Navigator.push(context, MaterialPageRoute(builder: (_) => Home()));
      return data;
    } else if (response.statusCode == 201) {
      var data = FirebaseAuthModel.fromJson(jsonDecode(response.body));
      database.saveString(data.token ?? "", 'token');
      Navigator.push(context, MaterialPageRoute(builder: (_) => SetupProfile()));
      return data;
    } else if (response.statusCode == 401) {
      EasyLoading.showError(jsonDecode(response.body)['message']);
      const WelcomeScreen().launch(context, isNewTask: true);
      await GoogleSignIn().disconnect();
      return FirebaseAuthModel();
    } else {
      var data = jsonDecode(response.body);
      throw Exception(data['message']);
    }
  }

  Future<bool> resetPasswordWithEmail(BuildContext context, String email) async {
    Uri url = Uri.parse(Config.serverUrl + Config.forgotPasswordUrl);
    var response = await http.post(url, body: <String, dynamic>{'email': email});
    if (response.statusCode == 200) {
      return true;
    } else {
      //throw Exception('Email doesn\'t exist');
      throw Exception(lang.S.of(context).emailDoesNotExist);
    }
  }

  Future<bool> verifyOtp(String code) async {
    Uri url = Uri.parse(Config.serverUrl + Config.verifyOtpUrl);
    var response = await http.post(url, body: <String, dynamic>{'code': code});
    print('------------verify status code ${response.statusCode}-----------');
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Wrong OTP');
      //throw Exception(lang.S.of(context).wrongOTP);
    }
  }

  Future<bool> resetPassword(String code, String password) async {
    Uri url = Uri.parse(Config.serverUrl + Config.resetPasswordUrl);
    var response = await http.post(url, body: <String, dynamic>{'code': code, 'password': password, 'password_confirmation': password});
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Password reset failed');
      //throw Exception(lang.S.of(context).passwordResetFailed);
    }
  }

  Future<bool> updatePassword(String password) async {
    String? token = await DataBase().retrieveString('token');
    Uri url = Uri.parse(Config.serverUrl + Config.editPasswordUrl);
    var response = await http.post(url, headers: {'Authorization': 'Bearer $token'}, body: <String, dynamic>{'password': password});
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Password Update Failed');
      //throw Exception(lang.S.of(context).passwordUpdateFailed);
    }
  }

  Future<bool> updateToken() async {
    bool ret = false;
    String? token = await DataBase().retrieveString('token');
    Uri url = Uri.parse(Config.serverUrl + Config.refreshTokenUrl);
    var response = await http.post(url, headers: {'Authorization': 'Bearer $token'});

    try {
      if (response.statusCode == 200) {
        DataBase().saveString(SignInModel.fromJson(jsonDecode(response.body)).data?.token ?? '', 'token');
        ret = true;
      } else {
        throw Exception('Token Update Failed');
        //throw Exception(lang.S.of(context).tokenUpdateFailed);
      }
    } catch (e) {}
    return ret;
  }

  Future<bool> dailyRewards() async {
    String? token = await DataBase().retrieveString('token');
    Uri url = Uri.parse(Config.serverUrl + Config.dailyRewardUrl);

    var response = await http.post(url, headers: {'Authorization': 'Bearer $token'});

    if (response.statusCode == 201) {
      return true;
    } else if (response.statusCode == 406) {
      throw Exception('Already Rewarded. Please Try Again Tomorrow');
      //throw Exception(lang.S.of(context).alreadyRewardedPleaseTryAgainTomorrow);
    } else {
      throw Exception('Daily Reward Update Failed');
      //throw Exception(lang.S.of(context).dailyRewardUpdateFailed);
    }
  }

  Future<UserProfileModel> userProfileInfo() async {
    Uri url = Uri.parse(Config.serverUrl + Config.userProfileUrl);
    String? token = await DataBase().retrieveString('token');
    if (kDebugMode) {
      print(token);
    }
    var response = await http.get(url, headers: {'Authorization': 'Bearer $token'});
    if (kDebugMode) {
      print(response.body);
    }
    if (kDebugMode) {
      print(response.statusCode);
    }
    if (response.statusCode == 200) {
      if (spinData.isEmpty) {
        var spinValue = await getSpinValue();
        if (kDebugMode) {
          print('Speen Fee: ${spinValue.data?.entryFee}');
        }
        spinFee = spinValue.data?.entryFee ?? "0";
        spinData.add(spinValue.data?.position0 ?? "0");
        spinData.add(spinValue.data?.position1 ?? "0");
        spinData.add(spinValue.data?.position2 ?? "0");
        spinData.add(spinValue.data?.position3 ?? "0");
        spinData.add(spinValue.data?.position4 ?? "0");
        spinData.add(spinValue.data?.position5 ?? "0");
        spinData.add(spinValue.data?.position6 ?? "0");
        spinData.add(spinValue.data?.position7 ?? "0");
        spinData.add(spinValue.data?.position8 ?? "0");
        spinData.add(spinValue.data?.position9 ?? "0");
      }
      return UserProfileModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Authorization Failed');
      //throw Exception(lang.S.of(context).authorizationFailed);
    }
  }

  Future<bool> signUpWithEmail(String fullName, String mobile, String email, String refer, String password, dynamic filepath) async {
    Map<String, String> body = {
      'name': fullName,
      'email': email,
      'phone': mobile,
      'password': password,
      'refer': refer,
    };
    Uri url = Uri.parse(Config.serverUrl + Config.signUpUrl);
    http.MultipartRequest request;
    if (filepath != 'No Data') {
      request = http.MultipartRequest('POST', url);
      request.files.add(await http.MultipartFile.fromPath('image', filepath));
      request.fields.addAll(body);
    } else {
      request = http.MultipartRequest('POST', url);
      request.fields.addAll(body);
    }
    return await request.send().then((response) async {
      if (kDebugMode) {
        print(response.statusCode);
      }
      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception('User Already Exist');
        //throw Exception(lang.S.of(context).userAlreadyExist);
      }
    });
  }

  Future<bool> editProfile(String fullName, String mobile, String email, dynamic filepath) async {
    Map<String, String> body = {
      'name': fullName,
      'email': email,
      'phone': mobile,
    };
    String? token = await DataBase().retrieveString('token');
    Map<String, String> header = {'Authorization': 'Bearer $token', 'Accept': 'application/json'};
    Uri url = Uri.parse(Config.serverUrl + Config.editProfileUrl);
    http.MultipartRequest request;
    if (filepath != 'No Data') {
      request = http.MultipartRequest('POST', url);
      request.files.add(await http.MultipartFile.fromPath('image', filepath));
      request.headers.addAll(header);
      request.fields.addAll(body);
    } else {
      request = http.MultipartRequest('POST', url);
      request.headers.addAll(header);
      request.fields.addAll(body);
    }
    return await request.send().then((response) async {
      // print(response.statusCode);
      // print(jsonDecode(await response.stream.bytesToString())['message']);
      // var responsee = await http.Response.fromStream(response);
      //  EasyLoading.showError(jsonDecode(responsee.body )['message']);
      // var res =await response.stream.bytesToString();
      if (response.statusCode == 200) {
        return true;
      } else {
        // var responsee = await http.Response.fromStream(response);
        // EasyLoading.showError(jsonDecode(await response.stream.bytesToString())['message']);
        throw Exception('Error While Editing Profile');
        //throw Exception(lang.S.of(context).errorWhileEditingProfile);
      }
    });
  }

  Future<bool> completeProfile(String firstName, String lastName, String referCode, dynamic filepath) async {
    Map<String, String> emailBody = {'first_name': firstName, 'last_name': lastName, 'refer': referCode};
    String? token = await DataBase().retrieveString('token');
    Map<String, String> header = {'Accept': 'application/json', 'Authorization': 'Bearer $token'};
    Uri url = Uri.parse(Config.serverUrl + Config.completeProfileUrl);
    http.MultipartRequest request;
    request = http.MultipartRequest('POST', url);
    request.headers.addAll(header);
    request.fields.addAll(emailBody);
    if (filepath != 'No Data') {
      request.files.add(await http.MultipartFile.fromPath('image', filepath));
    }
    return await request.send().then((response) async {
      var resnse = await http.Response.fromStream(response);
      if (kDebugMode) {
        print(response.statusCode);
      }
      if (kDebugMode) {
        print(resnse.body);
      }
      if (response.statusCode == 200) {
        return true;
      } else {
        throw Exception('Error While Completing Profile');
        //throw Exception(lang.S.of(context).errorWhileCompletingProfile);
      }
    });
  }

  Future<SpinDataModel> getSpinValue() async {
    Uri url = Uri.parse(Config.serverUrl + Config.spinValueUrl);
    String? token = await DataBase().retrieveString('token');
    var response = await http.get(url, headers: {'Authorization': 'Bearer $token'});
    if (kDebugMode) {
      print(response.body);
    }
    if (response.statusCode == 200) {
      return SpinDataModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error while logging out');
      //throw Exception(lang.S.of(context).errorWhileLoggingOut);
    }
  }

  Future<VideoModel> getVideos() async {
    Uri url = Uri.parse(Config.serverUrl + Config.videoUrl);
    String? token = await DataBase().retrieveString('token');
    var response = await http.get(url, headers: {'Authorization': 'Bearer $token'});
    if (kDebugMode) {
      print(response.body);
    }
    if (response.statusCode == 200) {
      return VideoModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error while logging out');
    }
  }

  Future<WebsiteVisitModel> getWebsite() async {
    Uri url = Uri.parse(Config.serverUrl + Config.websiteUrl);
    String? token = await DataBase().retrieveString('token');
    var response = await http.get(url, headers: {'Authorization': 'Bearer $token'});
    if (kDebugMode) {
      print(response.body);
    }
    if (response.statusCode == 200) {
      return WebsiteVisitModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error while logging out');
    }
  }

  Future<ScratchCardModel> getScratchCard() async {
    Uri url = Uri.parse(Config.serverUrl + Config.scratchCardUrl);
    String? token = await DataBase().retrieveString('token');
    var response = await http.get(url, headers: {'Authorization': 'Bearer $token'});
    if (kDebugMode) {
      print(response.body);
    }
    if (response.statusCode == 200) {
      return ScratchCardModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Error while logging out');
    }
  }

  Future<bool> watchVideo(String id) async {
    String? token = await DataBase().retrieveString('token');
    Uri url = Uri.parse(Config.serverUrl + Config.watchVideoUrl);

    var response = await http.post(url, headers: {'Authorization': 'Bearer $token'}, body: {"video_id": id});

    if (response.statusCode == 200) {
      return true;
    } else if (response.statusCode == 406) {
      throw Exception('Already Rewarded. Please Try Again Tomorrow');
      // throw Exception('Already Rewarded. Please Try Again Tomorrow');
    } else {
      throw Exception('Daily Reward Update Failed');
    }
  }

  Future<bool> visitWebsite(String id) async {
    String? token = await DataBase().retrieveString('token');
    Uri url = Uri.parse(Config.serverUrl + Config.getRewardUrl);

    var response = await http.post(url, headers: {'Authorization': 'Bearer $token'}, body: {"earning_id": id});

    if (response.statusCode == 200) {
      return true;
    } else if (response.statusCode == 406) {
      throw Exception('Already Rewarded. Please Try Again Tomorrow');
    } else {
      throw Exception('Daily Reward Update Failed');
    }
  }

  Future<bool> logOut() async {
    Uri url = Uri.parse(Config.serverUrl + Config.signOutUrl);
    String? token = await DataBase().retrieveString('token');
    var response = await http.get(url, headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Error while logging out');
    }
  }

  Future<bool> deleteAccount() async {
    Uri url = Uri.parse(Config.serverUrl + Config.deleteAccountUrl);
    String? token = await DataBase().retrieveString('token');
    var response = await http.get(url, headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Error while logging out');
    }
  }

  //_____________________tutorial_video__________________________________________________

  Future<TutorialVideoModel> getTutorialVideo() async {
    Uri url = Uri.parse(Config.serverUrl + Config.tutorialVideo);
    String? token = await DataBase().retrieveString('token');
    var response = await http.get(url, headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200) {
      return TutorialVideoModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load video');
    }
  }
}

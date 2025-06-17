import 'dart:async';

import 'package:cash_rocket/Screen/Constant%20Data/button_global.dart';
import 'package:cash_rocket/Screen/Constant%20Data/global_contanier.dart';
import 'package:cash_rocket/constant%20app%20information/const_information.dart';
import 'package:cash_rocket/generated/l10n.dart' as lang;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pinput/pinput.dart';

import '../../../Repositories/authentication_repo.dart';
import '../../Constant Data/constant.dart';

class MobileVerification extends StatefulWidget {
  const MobileVerification({super.key, required this.mobile, required this.id, required this.resendId});
  final String mobile;
  final String id;
  final int resendId;

  @override
  State<MobileVerification> createState() => _MobileVerificationState();
}

class _MobileVerificationState extends State<MobileVerification> {
  late FocusNode pin2FocusNode;
  late FocusNode pin3FocusNode;
  late FocusNode pin4FocusNode;
  late FocusNode pin5FocusNode;
  late FocusNode pin6FocusNode;

  bool isVerified = false;
  TextEditingController pin1Controller = TextEditingController();
  TextEditingController pin2Controller = TextEditingController();
  TextEditingController pin3Controller = TextEditingController();
  TextEditingController pin4Controller = TextEditingController();
  TextEditingController pin5Controller = TextEditingController();
  TextEditingController pin6Controller = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  void nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  int _secondsRemaining = 60;
  Timer? _timer;
  String code = "";

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _timer!.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          lang.S.of(context).verification,
          style: kTextStyle.copyWith(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Center(
        child: GlobalContainer(
          column: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                lang.S.of(context).checkYourMobile,
                style: kTextStyle.copyWith(fontWeight: FontWeight.bold, fontSize: 22, color: kWhite),
              ),
              const SizedBox(
                height: 8,
              ),
              RichText(text: TextSpan(text: lang.S.of(context).weHaveSentFourCodeSendYourMobile, style: kTextStyle.copyWith(color: kLightTextColor), children: [TextSpan(text: widget.mobile, style: kTextStyle.copyWith(color: kWhite, fontWeight: FontWeight.bold))])),
              const SizedBox(height: 30.0),
              Center(
                child: Pinput(
                  length: 6,
                  showCursor: false,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  onCompleted: (code) async {
                    setState(() {
                      code = code;
                    });
                    //EasyLoading.show(status: "Verifying OTP");
                    EasyLoading.show(status: lang.S.of(context).verifyingOTP);
                    try {
                      PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: widget.id, smsCode: code);
                      var user = await FirebaseAuth.instance.signInWithCredential(credential);
                      if (user.user == null) {
                        // EasyLoading.showError("Invalid OTP");
                        EasyLoading.showError(lang.S.of(context).invalidOTP);
                      } else {
                        await AuthRepo().signInWithPhone(widget.mobile, context);
                      }
                    } catch (e) {
                      // EasyLoading.showError("Invalid OTP");
                      EasyLoading.showError(lang.S.of(context).invalidOTP);
                    }
                  },
                  focusedPinTheme: PinTheme(
                    height: 50,
                    width: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: kMainColor),
                    ),
                  ),
                  defaultPinTheme: PinTheme(
                    height: 55,
                    width: 55,
                    textStyle: kTextStyle.copyWith(
                      color: kWhite,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: kGreyTextColor,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Visibility(
                visible: _secondsRemaining > 0,
                child: Center(
                  child: Text(
                    '${lang.S.of(context).pleaseWait} 00:$_secondsRemaining ${lang.S.of(context).seconds}',
                    style: kTextStyle.copyWith(color: kWhite, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              Visibility(
                visible: _secondsRemaining == 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      lang.S.of(context).dontReceiveCode,
                      style: kTextStyle.copyWith(color: kLightTextColor, fontSize: 14),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _secondsRemaining = 60;
                          _startTimer();
                        });
                      },
                      child: Text(
                        lang.S.of(context).resendCode,
                        style: kTextStyle.copyWith(
                          color: kMainColor,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              ButtonGlobal(
                  buttontext: lang.S.of(context).verify,
                  buttonDecoration: kButtonDecoration,
                  onPressed: () async {
                    //EasyLoading.show(status: "Verifying OTP");
                    EasyLoading.show(status: lang.S.of(context).verifyingOTP);
                    try {
                      PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: widget.id, smsCode: code);
                      var user = await FirebaseAuth.instance.signInWithCredential(credential);
                      print('---------user--------$user----------------');
                      if (user.user == null) {
                        //EasyLoading.showError("Invalid OTP");
                        EasyLoading.showError(lang.S.of(context).invalidOTP);
                        print('---user is invalid-------------');
                      } else {
                        await AuthRepo().signInWithPhone(widget.mobile, context);
                      }
                    } catch (e) {
                      // EasyLoading.showError("Invalid OTP");
                      EasyLoading.showError(lang.S.of(context).invalidOTP);
                      if (kDebugMode) {
                        print('---invalid is invalid------------');
                      }
                    }
                  })
              // GestureDetector(
              //   onTap: () async {
              //     EasyLoading.show(status: "Verifying OTP");
              //     try{
              //       PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: widget.id, smsCode: code);
              //       var user = await FirebaseAuth.instance.signInWithCredential(credential);
              //       if(user.user ==null){
              //         EasyLoading.showError("Invalid OTP");
              //       }else{
              //         await AuthRepo().signInWithPhone(widget.mobile, context);
              //       }
              //     }catch(e){
              //       EasyLoading.showError("Invalid OTP");
              //     }
              //   },
              //   child: Container(
              //     height: 45,
              //     alignment: Alignment.center,
              //     width: double.infinity,
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(30),
              //         color: kMainColor),
              //     child: Text(
              //       lang.S.of(context).verify,
              //       style: kTextStyle.copyWith(fontWeight: FontWeight.bold),
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}

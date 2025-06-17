import 'package:cash_rocket/Repositories/authentication_repo.dart';
import 'package:cash_rocket/Screen/Authentication/New%20Authentication/phone_verification.dart';
import 'package:cash_rocket/Screen/Constant%20Data/button_global.dart';
import 'package:cash_rocket/Screen/Constant%20Data/global_contanier.dart';
import 'package:cash_rocket/Theme/theme.dart';
import 'package:cash_rocket/constant%20app%20information/const_information.dart';
import 'package:cash_rocket/generated/l10n.dart' as lang;
import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:nb_utils/nb_utils.dart';

import '../Constant Data/constant.dart';
import '../Home Screen/no_internet_screen.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool isChecked = true;
  TextEditingController phoneController = TextEditingController();

  Future<void> checkInternet() async {
    // bool result = await InternetConnectionChecker().hasConnection;
    bool result = await InternetConnection().hasInternetAccess;
    if (!result && mounted) {
      NoInternetScreen(screenName: widget).launch(context);
    }
  }

  String selectedCode = "+880";

  @override
  void initState() {
    checkInternet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GlobalContainer(
              column: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(logo),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    appsName,
                    style: kTextStyle.copyWith(color: kWhite, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 40.0),
                  AppTextField(
                    textStyle: kTextStyle.copyWith(color: kWhite),
                    showCursor: true,
                    textFieldType: TextFieldType.PHONE,
                    controller: phoneController,
                    decoration: kInputDecoration.copyWith(
                      hintText: "17xx-xxxxxx",
                      hintStyle: kTextStyle.copyWith(color: lightGreyTextColor),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      prefixIcon: CountryCodePicker(
                        textStyle: kTextStyle.copyWith(color: kWhite),
                        onChanged: (country) {
                          setState(() {
                            selectedCode = country.dialCode ?? "+880";
                          });
                        },
                        initialSelection: 'BD',
                        showCountryOnly: false,
                        showFlag: true,
                        showOnlyCountryWhenClosed: false,
                        alignLeft: false,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  ButtonGlobal(
                      buttontext: lang.S.of(context).sendOtp,
                      buttonDecoration: kButtonDecoration,
                      onPressed: () async {
                        //EasyLoading.show(status: "Sending OTP");
                        EasyLoading.show(status: lang.S.of(context).sendingOtp);
                        await FirebaseAuth.instance.verifyPhoneNumber(
                          phoneNumber: selectedCode + phoneController.text,
                          verificationCompleted: (PhoneAuthCredential credential) async {
                            try {
                              var user = await FirebaseAuth.instance.signInWithCredential(credential);
                              if (user.user == null) {
                                //EasyLoading.showError("Invalid OTP");
                                EasyLoading.showError(lang.S.of(context).invalidOTP);
                              } else {
                                await AuthRepo().signInWithPhone(phoneController.text, context);
                              }
                            } catch (e) {
                              //toast("Invalid OTP");
                              toast(lang.S.of(context).invalidOTP);
                            }
                          },
                          verificationFailed: (FirebaseAuthException e) {
                            // EasyLoading.showError(e.message ?? "Error Occurred");
                            EasyLoading.showError(e.message ?? lang.S.of(context).errorOccurred);
                          },
                          codeSent: (String verificationId, int? resendToken) {
                            //EasyLoading.showSuccess("OTP Sent");
                            EasyLoading.showSuccess(lang.S.of(context).oTPSent);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => MobileVerification(
                                          mobile: selectedCode + phoneController.text,
                                          id: verificationId,
                                          resendId: resendToken ?? 0,
                                        )));
                          },
                          codeAutoRetrievalTimeout: (String verificationId) {
                            //EasyLoading.showError("Try Again");
                            EasyLoading.showError(lang.S.of(context).tryAgain);
                          },
                        );
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

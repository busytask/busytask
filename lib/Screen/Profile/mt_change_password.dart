import 'package:cash_rocket/Screen/Authentication/log_in.dart';
import 'package:cash_rocket/Screen/Constant%20Data/main_button.dart';
import 'package:cash_rocket/constant%20app%20information/const_information.dart';
import 'package:cash_rocket/generated/l10n.dart' as lang;
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../Provider/database_provider.dart';
import '../../Repositories/authentication_repo.dart';
import '../Constant Data/constant.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  TextEditingController passwordEditingController = TextEditingController();
  TextEditingController confirmPasswordEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        toolbarHeight: 90,
        iconTheme: const IconThemeData(color: kWhite),
        flexibleSpace: Container(
          decoration: BoxDecoration(borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)), gradient: containerGradiant),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(30.0),
            bottomLeft: Radius.circular(30.0),
          ),
        ),
        backgroundColor: kMainColor,
        elevation: 0.0,
        title: Text(
          lang.S.of(context).changePassword,
          //'Change Password',
          style: kTextStyle.copyWith(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20.0),
              AppTextField(
                showCursor: false,
                textFieldType: TextFieldType.PASSWORD,
                controller: passwordEditingController,
                suffixIconColor: kLightTextColor,
                textStyle: kTextStyle.copyWith(color: kWhite),
                decoration: kInputDecoration.copyWith(
                  //labelText: 'New Password',
                  labelText: lang.S.of(context).newPassword,
                  labelStyle: kTextStyle.copyWith(color: kWhite),
                  //hintText: 'Enter Your New Password',
                  hintText: lang.S.of(context).enterYourNewPassword,
                  hintStyle: kTextStyle.copyWith(color: kLightTextColor),
                ),
              ),
              const SizedBox(height: 15.0),
              AppTextField(
                showCursor: false,
                textFieldType: TextFieldType.PASSWORD,
                suffixIconColor: kLightTextColor,
                controller: confirmPasswordEditingController,
                textStyle: kTextStyle.copyWith(color: kWhite),
                decoration: kInputDecoration.copyWith(
                  //labelText: 'Confirm Password',
                  labelText: lang.S.of(context).confirmPassword,
                  labelStyle: kTextStyle.copyWith(color: kWhite),
                  // hintText: 'Enter Your Password Again',
                  hintText: lang.S.of(context).enterYourPasswordAgain,
                  hintStyle: kTextStyle.copyWith(color: kLightTextColor),
                ),
              ),
              const SizedBox(height: 20.0),
              PrimaryButton(
                // buttonText: 'Update Password',
                buttonText: lang.S.of(context).updatePassword,
                onpressed: () async {
                  if (passwordEditingController.text.isEmpty) {
                    // EasyLoading.showError('Password can\'t be empty');
                    EasyLoading.showError(lang.S.of(context).passwordCanNotBeEmpty);
                  } else if (passwordEditingController.text.length < 6) {
                    //EasyLoading.showError('Password can\'t be less than 6 character');
                    EasyLoading.showError(lang.S.of(context).passwordCanNotBeLessThan6Character);
                  } else if (passwordEditingController.text != confirmPasswordEditingController.text) {
                    //EasyLoading.showError('Password doesn\'t match');
                    EasyLoading.showError(lang.S.of(context).passwordDoesNotMatch);
                  } else {
                    try {
                      //EasyLoading.show(status: 'Updating Password');
                      EasyLoading.show(status: lang.S.of(context).updatingPassword);
                      var response = await AuthRepo().updatePassword(passwordEditingController.text);
                      if (response) {
                        var response = await AuthRepo().logOut();
                        if (response && mounted) {
                          DataBase().saveString('', 'token');
                          const LogIn().launch(context, isNewTask: true);
                          //EasyLoading.showSuccess('Password Update Successful');
                          EasyLoading.showSuccess(lang.S.of(context).passwordUpdateSuccessful);
                        } else {
                          //EasyLoading.showError('Please Try Again');
                          EasyLoading.showError(lang.S.of(context).pleaseTryAgain);
                        }
                      } else {
                        //EasyLoading.showError('Error Happened. Try again');
                        EasyLoading.showError(lang.S.of(context).errorHappenedTryAgain);
                      }
                    } catch (e) {
                      EasyLoading.showError(e.toString());
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

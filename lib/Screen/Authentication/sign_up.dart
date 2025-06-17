import 'dart:io';

import 'package:cash_rocket/Repositories/authentication_repo.dart';
import 'package:cash_rocket/Screen/Constant%20Data/button_global.dart';
import 'package:cash_rocket/generated/l10n.dart' as lang;
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../Provider/database_provider.dart';
import '../../Repositories/rewards_repo.dart';
import '../Constant Data/constant.dart';
import '../Home Screen/home.dart';
import '../Home Screen/no_internet_screen.dart';
import 'log_in.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isChecked = true;

  String profilePicture = 'https://st2.depositphotos.com/2703645/7304/v/600/depositphotos_73040075-stock-illustration-male-avatar-icon.jpg';

  // ignore: prefer_typing_uninitialized_variables
  var dialogContext;
  final ImagePicker _picker = ImagePicker();
  XFile? pickedImage;
  File imageFile = File('No File');
  String imagePath = 'No Data';

  TextEditingController fullNameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController referController = TextEditingController();

  Future<void> checkInternet() async {
    // bool result = await InternetConnectionChecker().hasConnection;
    bool result = await InternetConnection().hasInternetAccess;
    if (!result && mounted) {
      NoInternetScreen(screenName: widget).launch(context);
    }
  }

  @override
  void initState() {
    checkInternet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            Image(
              image: const AssetImage('images/bg.png'),
              width: context.width(),
              height: context.height(),
              fit: BoxFit.cover,
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    width: context.width() / 1.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Dialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    // ignore: sized_box_for_whitespace
                                    child: Container(
                                      height: 200.0,
                                      width: MediaQuery.of(context).size.width - 80,
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            GestureDetector(
                                              onTap: () async {
                                                pickedImage = await _picker.pickImage(source: ImageSource.gallery);
                                                setState(() {
                                                  imageFile = File(pickedImage!.path);
                                                  imagePath = pickedImage!.path;
                                                });
                                                Future.delayed(const Duration(milliseconds: 100), () {
                                                  Navigator.pop(context);
                                                });
                                              },
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  const Icon(
                                                    Icons.photo_library_rounded,
                                                    size: 60.0,
                                                    color: kMainColor,
                                                  ),
                                                  Text(
                                                    lang.S.of(context).gallary,
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 20.0,
                                                      color: kMainColor,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 40.0,
                                            ),
                                            GestureDetector(
                                              onTap: () async {
                                                pickedImage = await _picker.pickImage(source: ImageSource.camera);
                                                setState(() {
                                                  imageFile = File(pickedImage!.path);
                                                  imagePath = pickedImage!.path;
                                                });
                                                Future.delayed(const Duration(milliseconds: 100), () {
                                                  Navigator.pop(context);
                                                });
                                              },
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  const Icon(
                                                    Icons.camera,
                                                    size: 60.0,
                                                    color: kGreyTextColor,
                                                  ),
                                                  Text(
                                                    lang.S.of(context).camera,
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 20.0,
                                                      color: kGreyTextColor,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                });
                          },
                          child: Stack(
                            children: [
                              Container(
                                height: 120,
                                width: 120,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black54, width: 1),
                                  borderRadius: const BorderRadius.all(Radius.circular(120)),
                                  image: imagePath == 'No Data'
                                      ? DecorationImage(
                                          image: NetworkImage(profilePicture),
                                          fit: BoxFit.cover,
                                        )
                                      : DecorationImage(
                                          image: FileImage(imageFile),
                                          fit: BoxFit.cover,
                                        ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white, width: 2),
                                    borderRadius: const BorderRadius.all(Radius.circular(120)),
                                    color: kMainColor,
                                  ),
                                  child: const Icon(
                                    Icons.camera_alt_outlined,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        AppTextField(
                          showCursor: false,
                          textFieldType: TextFieldType.NAME,
                          controller: fullNameController,
                          decoration: kInputDecoration.copyWith(
                            labelText: lang.S.of(context).fullName,
                            labelStyle: kTextStyle.copyWith(color: kTitleColor),
                            hintText: lang.S.of(context).enterFullName,
                            hintStyle: kTextStyle.copyWith(color: kGreyTextColor),
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        AppTextField(
                          showCursor: false,
                          textFieldType: TextFieldType.NUMBER,
                          controller: mobileController,
                          decoration: kInputDecoration.copyWith(
                            labelText: lang.S.of(context).mobile,
                            labelStyle: kTextStyle.copyWith(color: kTitleColor),
                            hintText: lang.S.of(context).enterYourMobile,
                            hintStyle: kTextStyle.copyWith(color: kGreyTextColor),
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        AppTextField(
                          showCursor: false,
                          textFieldType: TextFieldType.EMAIL,
                          controller: emailController,
                          decoration: kInputDecoration.copyWith(
                            labelText: lang.S.of(context).email,
                            labelStyle: kTextStyle.copyWith(color: kTitleColor),
                            hintText: lang.S.of(context).enterYourAddress,
                            hintStyle: kTextStyle.copyWith(color: kGreyTextColor),
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        AppTextField(
                          textStyle: kTextStyle.copyWith(color: kTitleColor),
                          cursorColor: kTitleColor,
                          textFieldType: TextFieldType.PASSWORD,
                          controller: passwordController,
                          decoration: kInputDecoration.copyWith(
                            labelText: lang.S.of(context).password,
                            hintText: '********',
                            labelStyle: kTextStyle.copyWith(color: kTitleColor),
                            hintStyle: kTextStyle.copyWith(color: kGreyTextColor),
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        AppTextField(
                          showCursor: false,
                          textFieldType: TextFieldType.NAME,
                          controller: referController,
                          decoration: kInputDecoration.copyWith(
                            labelText: lang.S.of(context).invitationCode,
                            labelStyle: kTextStyle.copyWith(color: kTitleColor),
                            hintText: lang.S.of(context).enterinvantationCode,
                            hintStyle: kTextStyle.copyWith(color: kGreyTextColor),
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        ButtonGlobal(
                            buttontext: lang.S.of(context).signUp,
                            buttonDecoration: kButtonDecoration,
                            onPressed: () async {
                              if (fullNameController.text.isEmpty) {
                                //EasyLoading.showInfo('Full Name is Required');
                                EasyLoading.showInfo(lang.S.of(context).fullNameIsRequired);
                              } else if (mobileController.text.isEmpty) {
                                // EasyLoading.showInfo('Mobile Number is Required');
                                EasyLoading.showInfo(lang.S.of(context).mobileNumberIsRequired);
                              } else if (emailController.text.isEmpty) {
                                //EasyLoading.showInfo('Email Address is Required');
                                EasyLoading.showInfo(lang.S.of(context).emailAddressIsRequired);
                              } else if (passwordController.text.isEmpty) {
                                //EasyLoading.showInfo('Password is Required');
                                EasyLoading.showInfo(lang.S.of(context).passwordIsRequired);
                              } else if (passwordController.text.length < 6) {
                                //EasyLoading.showInfo('Password length must be at least 6 Character');
                                EasyLoading.showInfo(lang.S.of(context).passwordLengthMustBeAtLeast6Character);
                              } else {
                                try {
                                  // EasyLoading.show(status: 'Signing Up');
                                  EasyLoading.show(status: lang.S.of(context).signingOut);
                                  var res = await AuthRepo().signUpWithEmail(fullNameController.text, mobileController.text, emailController.text, referController.text, passwordController.text, imagePath);
                                  if (res) {
                                    var response = await AuthRepo().signInWithEmail(emailController.text, passwordController.text);
                                    DataBase().saveString(response.data!.userId.toString(), 'userId');
                                    DataBase().saveString(response.data!.token.toString(), 'token');
                                    await RewardRepo().getAdNetWorks();
                                    if (mounted) {
                                      const Home().launch(context);
                                    }
                                    //EasyLoading.showSuccess('Sign Up Successful');
                                    EasyLoading.showSuccess(lang.S.of(context).signUpSuccessful);
                                  }
                                } catch (e) {
                                  // EasyLoading.showError(e.toString().replaceAll('Exception:', ''));
                                  EasyLoading.showError(e.toString().replaceAll('${lang.S.of(context).exception}:', ''));
                                }
                              }
                            }),
                        RichText(
                          text: TextSpan(
                            text: lang.S.of(context).alreadyHaveAnAccount,
                            style: kTextStyle.copyWith(color: kGreyTextColor),
                            children: [
                              TextSpan(
                                text: lang.S.of(context).signIn,
                                style: kTextStyle.copyWith(color: kMainColor),
                              ),
                            ],
                          ),
                        ).onTap(
                          () => const LogIn().launch(context),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

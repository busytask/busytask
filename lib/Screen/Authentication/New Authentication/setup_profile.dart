import 'dart:io';

import 'package:cash_rocket/Repositories/authentication_repo.dart';
import 'package:cash_rocket/Screen/Constant%20Data/button_global.dart';
import 'package:cash_rocket/Screen/Constant%20Data/global_contanier.dart';
import 'package:cash_rocket/constant%20app%20information/const_information.dart';
import 'package:cash_rocket/generated/l10n.dart' as lang;
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../Constant Data/constant.dart';
import '../../Home Screen/home.dart';
import '../../Home Screen/no_internet_screen.dart';

class SetupProfile extends StatefulWidget {
  const SetupProfile({Key? key}) : super(key: key);

  @override
  State<SetupProfile> createState() => _SetupProfileState();
}

class _SetupProfileState extends State<SetupProfile> {
  bool isChecked = true;

  String profilePicture = 'https://st2.depositphotos.com/2703645/7304/v/600/depositphotos_73040075-stock-illustration-male-avatar-icon.jpg';

  // ignore: prefer_typing_uninitialized_variables
  var dialogContext;
  final ImagePicker _picker = ImagePicker();
  XFile? pickedImage;
  File imageFile = File('No File');
  String imagePath = 'No Data';

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

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
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: kWhite),
          title: Text(
            lang.S.of(context).completeProfile,
            //'Complete Profile',
            style: const TextStyle(color: kWhite),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: GlobalContainer(
                    column: Column(
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
                          controller: firstNameController,
                          textFieldType: TextFieldType.NAME,
                          textStyle: kTextStyle.copyWith(color: kWhite),
                          decoration: kInputDecoration.copyWith(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText: lang.S.of(context).firstName,
                            labelStyle: kTextStyle.copyWith(color: kWhite),
                            hintText: lang.S.of(context).enterFirstName,
                            hintStyle: kTextStyle.copyWith(color: kLightTextColor),
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        AppTextField(
                          controller: lastNameController,
                          textFieldType: TextFieldType.NAME,
                          textStyle: kTextStyle.copyWith(color: kWhite),
                          decoration: kInputDecoration.copyWith(
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText: lang.S.of(context).lastName,
                            labelStyle: kTextStyle.copyWith(color: kWhite),
                            hintText: lang.S.of(context).enterLastName,
                            hintStyle: kTextStyle.copyWith(color: kLightTextColor),
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        AppTextField(
                          controller: referController,
                          textFieldType: TextFieldType.NAME,
                          textStyle: kTextStyle.copyWith(color: kWhite),
                          decoration: kInputDecoration.copyWith(
                            labelText: lang.S.of(context).invitationCode,
                            labelStyle: kTextStyle.copyWith(color: kWhite),
                            hintText: lang.S.of(context).enterinvantationCode,
                            hintStyle: kTextStyle.copyWith(color: kLightTextColor),
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        ButtonGlobal(
                            buttontext: lang.S.of(context).continu,
                            buttonDecoration: kButtonDecoration,
                            onPressed: () async {
                              try {
                                //EasyLoading.show(status: "Completing Profile");
                                EasyLoading.show(status: lang.S.of(context).completingProfile);
                                bool status = await AuthRepo().completeProfile(firstNameController.text, lastNameController.text, referController.text, imagePath);
                                if (status) {
                                  //EasyLoading.showSuccess("Profile Completed Successfully");
                                  EasyLoading.showSuccess(lang.S.of(context).profileCompletedSuccessfully);
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
                                } else {
                                  //EasyLoading.showError("Error Occurred. Please Try again");
                                  EasyLoading.showError(lang.S.of(context).errorOccurredPleaseTryAgain);
                                }
                              } catch (e) {
                                EasyLoading.showError(e.toString());
                              }
                            }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:cash_rocket/Repositories/authentication_repo.dart';
import 'package:cash_rocket/Screen/Constant%20Data/global_contanier.dart';
import 'package:cash_rocket/Screen/Constant%20Data/main_button.dart';
import 'package:cash_rocket/Screen/Home%20Screen/home.dart';
import 'package:cash_rocket/constant%20app%20information/const_information.dart';
import 'package:cash_rocket/generated/l10n.dart' as lang;
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../Model/user_profile_model.dart';
import '../../Provider/profile_provider.dart';
import '../Constant Data/constant.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key, required this.user});

  final UserProfileModel user;

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
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

  @override
  void initState() {
    profilePicture = widget.user.data?.user?.image ?? 'https://st2.depositphotos.com/2703645/7304/v/600/depositphotos_73040075-stock-illustration-male-avatar-icon.jpg';
    fullNameController.text = widget.user.data?.user?.name ?? '';
    mobileController.text = widget.user.data?.user?.phone ?? '';
    emailController.text = widget.user.data?.user?.email ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        titleSpacing: 0,
        toolbarHeight: 90,
        flexibleSpace: Container(
          decoration: BoxDecoration(borderRadius: const BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30)), gradient: containerGradiant),
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
          lang.S.of(context).editProfile,
          style: kTextStyle.copyWith(color: Colors.white),
        ),
      ),
      body: Consumer(builder: (_, ref, watch) {
        return Padding(
          padding: const EdgeInsets.only(top: 5),
          child: SingleChildScrollView(
            child: GlobalContainer(
              column: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 30.0),
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
                            border: Border.all(color: kWhite, width: 1),
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
                    textStyle: kTextStyle.copyWith(color: kWhite),
                    controller: fullNameController,
                    decoration: kInputDecoration.copyWith(
                      labelText: lang.S.of(context).fullName,
                      labelStyle: kTextStyle.copyWith(color: kWhite),
                      hintText: lang.S.of(context).enterFullName,
                      hintStyle: kTextStyle.copyWith(color: kLightTextColor),
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  AppTextField(
                    showCursor: false,
                    textFieldType: TextFieldType.NUMBER,
                    controller: mobileController,
                    textStyle: kTextStyle.copyWith(color: kWhite),
                    decoration: kInputDecoration.copyWith(
                      labelText: lang.S.of(context).mobile,
                      labelStyle: kTextStyle.copyWith(color: kWhite),
                      hintText: lang.S.of(context).enterYourMobile,
                      hintStyle: kTextStyle.copyWith(color: kLightTextColor),
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  AppTextField(
                    showCursor: false,
                    textFieldType: TextFieldType.EMAIL,
                    controller: emailController,
                    textStyle: kTextStyle.copyWith(color: kWhite),
                    decoration: kInputDecoration.copyWith(
                      labelText: lang.S.of(context).email,
                      labelStyle: kTextStyle.copyWith(color: kWhite),
                      hintText: lang.S.of(context).enterYourEmail,
                      hintStyle: kTextStyle.copyWith(color: kLightTextColor),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  PrimaryButton(
                      buttonText: lang.S.of(context).saves,
                      onpressed: () async {
                        try {
                          //EasyLoading.show(status: 'Updating Profile');
                          EasyLoading.show(status: lang.S.of(context).updatingProfile);
                          int size = imageFile != File('No FIle') ? 0 : imageFile.lengthSync();
                          double sizeInMb = size / (1024 * 1024);
                          if (sizeInMb < 2.0) {
                            var response = await AuthRepo().editProfile(fullNameController.text, mobileController.text, emailController.text, imagePath);
                            if (response && mounted) {
                              // ignore: unused_result
                              ref.refresh(personalProfileProvider);
                              const Home().launch(context);
                              //EasyLoading.showSuccess('Profile Edited Successfully');
                              EasyLoading.showSuccess(lang.S.of(context).profileEditedSuccessfully);
                            } else {
                              // EasyLoading.showError('Error Happened. Try again');
                              EasyLoading.showError(lang.S.of(context).errorHappenedTryAgain);
                            }
                          } else {
                            //EasyLoading.showError('Image size should be smaller than 2 mb');
                            EasyLoading.showError(lang.S.of(context).imageSizeShouldBeSmallerThan2Mb);
                          }
                        } catch (e) {
                          EasyLoading.showError(e.toString());
                        }
                      }),
                  // const SizedBox(height: 16,),
                  // PrimaryButton(
                  //     buttonText: lang.S.of(context).changePassword,
                  //     onpressed: () {
                  //       const ChangePassword().launch(context);
                  //     }),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

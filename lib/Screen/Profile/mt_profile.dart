import 'package:cash_rocket/Model/user_profile_model.dart';
import 'package:cash_rocket/Provider/profile_provider.dart';
import 'package:cash_rocket/Screen/Authentication/New%20Authentication/welcome_screen.dart';
import 'package:cash_rocket/Screen/Authentication/log_in.dart';
import 'package:cash_rocket/Screen/Profile/mt_edit_profile.dart';
import 'package:cash_rocket/Screen/Profile/mt_offer_status.dart';
import 'package:cash_rocket/Screen/Profile/mt_privacy_policy.dart';
import 'package:cash_rocket/Screen/Profile/mt_terms_condition.dart';
import 'package:cash_rocket/generated/l10n.dart' as lang;
import 'package:cash_rocket/main.dart';
import 'package:community_material_icon/community_material_icon.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:iconly/iconly.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../Provider/database_provider.dart';
import '../../Repositories/authentication_repo.dart';
import '../../language/languase.dart';
import '../Constant Data/config.dart';
import '../Constant Data/constant.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  UserProfileModel user = UserProfileModel();
  List<String> count = [
    '5000',
    '7+',
    '15+',
  ];

  List<String> title = [
    'Blance',
    'Refer',
    'Invited',
  ];

  void signOut() async {
    try {
      //EasyLoading.show(status: 'Signing Out...');
      EasyLoading.show(status: '${lang.S.of(context).signingOut}...');
      var response = await AuthRepo().logOut();
      if (response && mounted) {
        DataBase().saveString('', 'token');
        final bool googleSignIn = await GoogleSignIn().isSignedIn();
        if (googleSignIn) await GoogleSignIn().disconnect();
        await FirebaseAuth.instance.signOut();
        const WelcomeScreen().launch(context, isNewTask: true);
        //EasyLoading.showSuccess('Sign Out Successful');
        EasyLoading.showSuccess(lang.S.of(context).signOutSuccessful);
      } else {
        //EasyLoading.showError('Please Try Again');
        EasyLoading.showError(lang.S.of(context).pleaseTryAgain);
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
    }
  }

  void delete() async {
    try {
      //EasyLoading.show(status: 'Deleting Account...');
      EasyLoading.show(status: '${lang.S.of(context).deletingAccount}...');
      var response = await AuthRepo().deleteAccount();
      if (response && mounted) {
        DataBase().saveString('', 'token');
        final bool googleSignIn = await GoogleSignIn().isSignedIn();
        if (googleSignIn) await GoogleSignIn().disconnect();
        await FirebaseAuth.instance.signOut();
        const WelcomeScreen().launch(context, isNewTask: true);
        //EasyLoading.showSuccess('Deletion Successful');
        EasyLoading.showSuccess(lang.S.of(context).deletionSuccessful);
      } else {
        // EasyLoading.showError('Please Try Again');
        EasyLoading.showError(lang.S.of(context).pleaseTryAgain);
      }
    } catch (e) {
      EasyLoading.showError(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(builder: (_, ref, watch) {
        AsyncValue<UserProfileModel> profile = ref.watch(personalProfileProvider);
        return profile.when(data: (info) {
          if (info.data?.user?.status == 0) {
            DataBase().deleteToken();
            //EasyLoading.showError('You Are Disable!');
            EasyLoading.showError("${lang.S.of(context).youAreDisable}!");
            const LogIn().launch(context, isNewTask: true);
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10.0),
                  width: context.width(),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xff0DA6C2),
                        Color(0xff0D81C3),
                      ],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 40.0),
                      Column(
                        children: [
                          Center(
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 40,
                              backgroundImage: NetworkImage(info.data?.user?.image == Config.siteUrl ? 'https://raw.githubusercontent.com/Ashwinvalento/cartoon-avatar/master/lib/images/female/68.png' : info.data?.user?.image ?? 'https://raw.githubusercontent.com/Ashwinvalento/cartoon-avatar/master/lib/images/female/68.png'),
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          Text(
                            info.data?.user?.name ?? '',
                            style: kTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            info.data?.user?.email ?? '',
                            style: kTextStyle.copyWith(color: Colors.white),
                          ),
                          const SizedBox(height: 5.0),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  width: context.width(),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      colors: [
                        Color(0xff0DA6C2),
                        Color(0xff0E55C5),
                      ],
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withOpacity(0.3), border: Border.all(color: Colors.white)),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Text(
                                      info.data?.user?.wallet?.balance.toString() ?? '',
                                      style: kTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              lang.S.of(context).balance,
                              style: kTextStyle.copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withOpacity(0.3), border: Border.all(color: Colors.white)),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Text(
                                      info.data?.referUserCount.toString() ?? '',
                                      style: kTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              lang.S.of(context).refer,
                              style: kTextStyle.copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white.withOpacity(0.3), border: Border.all(color: Colors.white)),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Text(
                                      info.data?.withdrawRequestCount.toString() ?? '',
                                      style: kTextStyle.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 4.0),
                            Text(
                              lang.S.of(context).withdraw,
                              style: kTextStyle.copyWith(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15.0, bottom: 5),
                  child: Card(
                      elevation: 0.0,
                      color: Theme.of(context).colorScheme.primaryContainer,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0), side: BorderSide(color: kGreyTextColor.withOpacity(0.1), width: 1.0)),
                      child: ListTile(
                        onTap: (() => EditProfile(user: info).launch(context)),
                        horizontalTitleGap: 10,
                        leading: const Icon(
                          IconlyBold.profile,
                          color: kMainColor,
                        ),
                        title: Text(
                          lang.S.of(context).editProfile,
                          style: kTextStyle.copyWith(color: kWhite),
                        ),
                        trailing: const Icon(
                          FeatherIcons.chevronRight,
                          color: kWhite,
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 5),
                  child: Card(
                      elevation: 0.0,
                      color: Theme.of(context).colorScheme.primaryContainer,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0), side: BorderSide(color: kGreyTextColor.withOpacity(0.1), width: 1.0)),
                      child: ListTile(
                        onTap: (() => const OfferStatus().launch(context)),
                        horizontalTitleGap: 10,
                        leading: const Icon(
                          IconlyBold.paper,
                          color: Color(0xffF58592),
                        ),
                        title: Text(
                          lang.S.of(context).offerStatus,
                          style: kTextStyle.copyWith(color: kWhite),
                        ),
                        trailing: const Icon(
                          FeatherIcons.chevronRight,
                          color: kWhite,
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 5),
                  child: Card(
                      elevation: 0.0,
                      color: Theme.of(context).colorScheme.primaryContainer,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                      child: ListTile(
                        onTap: (() => const OfferStatus().launch(context)),
                        horizontalTitleGap: 10,
                        leading: const Icon(
                          IconlyBold.paper,
                          color: Color(0xffF58592),
                        ),
                        title: Text(lang.S.of(context).offerStatus),
                        trailing: const Icon(FeatherIcons.chevronRight),
                      )),
                ).visible(false),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 5),
                  child: Card(
                      elevation: 0.0,
                      color: Theme.of(context).colorScheme.primaryContainer,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0), side: BorderSide(color: kGreyTextColor.withOpacity(0.1), width: 1.0)),
                      child: ListTile(
                        onTap: (() => const MtTermsAndCondition().launch(context)),
                        horizontalTitleGap: 10,
                        leading: const Icon(
                          IconlyBold.shield_done,
                          color: Color(0xffFFCB72),
                        ),
                        title: Text(
                          lang.S.of(context).termsOfService,
                          style: kTextStyle.copyWith(color: kWhite),
                        ),
                        trailing: const Icon(
                          FeatherIcons.chevronRight,
                          color: kWhite,
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 5),
                  child: Card(elevation: 0.0, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0), side: BorderSide(color: kGreyTextColor.withOpacity(0.1), width: 1.0)), child: const ThemeButton()),
                ).visible(false),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 5),
                  child: Card(
                      elevation: 0.0,
                      color: Theme.of(context).colorScheme.primaryContainer,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0), side: BorderSide(color: kGreyTextColor.withOpacity(0.1), width: 1.0)),
                      child: ListTile(
                        onTap: (() => const Language().launch(context)),
                        horizontalTitleGap: 10,
                        leading: const Icon(
                          CommunityMaterialIcons.translate,
                          color: kMainColor,
                        ),
                        title: Text(
                          lang.S.of(context).language,
                          style: kTextStyle.copyWith(color: kWhite),
                        ),
                        trailing: const Icon(
                          FeatherIcons.chevronRight,
                          color: kWhite,
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 5),
                  child: Card(
                      elevation: 0.0,
                      color: Theme.of(context).colorScheme.primaryContainer,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0), side: BorderSide(color: kGreyTextColor.withOpacity(0.1), width: 1.0)),
                      child: ListTile(
                        onTap: (() => const MtPrivacyPolicy().launch(context)),
                        horizontalTitleGap: 10,
                        leading: const Icon(
                          IconlyBold.info_circle,
                          color: Color(0xff84FFAA),
                        ),
                        title: Text(
                          lang.S.of(context).privacyPolicty,
                          style: kTextStyle.copyWith(color: kWhite),
                        ),
                        trailing: const Icon(
                          FeatherIcons.chevronRight,
                          color: kWhite,
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 5),
                  child: Card(
                      elevation: 0.0,
                      color: Theme.of(context).colorScheme.primaryContainer,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0), side: BorderSide(color: kGreyTextColor.withOpacity(0.1), width: 1.0)),
                      child: ListTile(
                        onTap: (() => signOut()),
                        horizontalTitleGap: 10,
                        leading: const Icon(
                          IconlyBold.logout,
                          color: Color(0xffFF835B),
                        ),
                        title: Text(
                          lang.S.of(context).logOut,
                          style: kTextStyle.copyWith(color: kWhite),
                        ),
                        trailing: const Icon(
                          FeatherIcons.chevronRight,
                          color: kWhite,
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 5),
                  child: Card(
                      elevation: 0.0,
                      color: Theme.of(context).colorScheme.primaryContainer,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0), side: BorderSide(color: kGreyTextColor.withOpacity(0.1), width: 1.0)),
                      child: ListTile(
                        onTap: () {
                          setState(() {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          lang.S.of(context).areYouSureYouWantToDeleteThisAccount,
                                          //'Are you sure you want to delete this Account?',
                                          style: kTextStyle.copyWith(fontWeight: FontWeight.bold, fontSize: 18, color: kWhite),
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Row(
                                          children: [
                                            Expanded(
                                                child: GestureDetector(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: kMainColor)),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(10.0),
                                                  child: Text(
                                                    lang.S.of(context).No,
                                                    //'No',
                                                    style: kTextStyle.copyWith(fontWeight: FontWeight.bold, color: kMainColor, fontSize: 12),
                                                  ),
                                                ),
                                              ),
                                            )),
                                            const SizedBox(
                                              width: 15,
                                            ),
                                            Expanded(
                                                child: GestureDetector(
                                              onTap: () => delete(),
                                              child: Container(
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), gradient: buttonGradiant),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(10.0),
                                                  child: Text(
                                                    lang.S.of(context).yesDeleteIt,
                                                    //'Yes, Delete it!',
                                                    style: kTextStyle.copyWith(fontWeight: FontWeight.bold, fontSize: 12),
                                                  ),
                                                ),
                                              ),
                                            )),
                                          ],
                                        )
                                      ],
                                    ),
                                  );
                                });
                          });
                        },
                        horizontalTitleGap: 10,
                        leading: const Icon(
                          IconlyBold.delete,
                          color: Color(0xff6CFF7E),
                        ),
                        title: Text(
                          lang.S.of(context).deleteAccounts,
                          style: kTextStyle.copyWith(color: kWhite),
                        ),
                        trailing: const Icon(
                          FeatherIcons.chevronRight,
                          color: kWhite,
                        ),
                      )),
                ),
              ],
            ),
          );
        }, error: (e, stack) {
          return Center(
            child: Text(e.toString()),
          );
        }, loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
      }),
    );
  }
}

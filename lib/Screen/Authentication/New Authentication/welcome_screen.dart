import 'dart:io' show Platform;

import 'package:cash_rocket/Repositories/authentication_repo.dart';
import 'package:cash_rocket/Screen/Authentication/log_in.dart';
import 'package:cash_rocket/constant%20app%20information/const_information.dart';
import 'package:cash_rocket/generated/l10n.dart' as lang;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../Constant Data/constant.dart';
import '../../Constant Data/global_contanier.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  // Đăng nhập với tài khoản Google khác
  Future<User?> signInWithDifferentGoogleAccount() async {
    try {
      final GoogleSignInAccount? googleSignInAccount = await GoogleSignIn().signIn();
      if (googleSignInAccount == null) {
        EasyLoading.showError("Đăng nhập với Google thất bại hoặc bị hủy.");
        return null; // Người dùng đã hủy đăng nhập
      }

      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential authResult = await FirebaseAuth.instance.signInWithCredential(credential);
      final User? user = authResult.user;

      return user;
    } catch (e) {
      EasyLoading.showError("Lỗi đăng nhập với Google: $e");
      return null;
    }
  }

  // Đăng nhập với Google
  Future<UserCredential> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        EasyLoading.showError("Đăng nhập với Google thất bại hoặc bị hủy.");
        return Future.error("User canceled the login");
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      EasyLoading.showError("Lỗi khi đăng nhập Google: $e");
      return Future.error(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: GlobalContainer(
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
                Text(
                  appsName,
                  style: kTextStyle.copyWith(color: kWhite, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 30.0),
                Text(
                  lang.S.of(context).letsGetStarted,
                  style: kTextStyle.copyWith(color: kWhite, fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10.0),
                Text(
                  lang.S.of(context).lactusMautis,
                  style: kTextStyle.copyWith(color: kWhite.withOpacity(0.7)),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30.0),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const LogIn()));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 48,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: const Color(0xff1877F5)),
                    child: ListTile(
                      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                      leading: Image.asset(
                        'images/phone.png',
                        height: 25,
                        width: 25,
                      ),
                      title: Text(
                        lang.S.of(context).continueWithMobile,
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 13),
                GestureDetector(
                  onTap: () async {
                    // Gọi hàm đăng nhập với tài khoản Google khác
                    User? user = await signInWithDifferentGoogleAccount();
                    if (user != null) {
                      String email = user.email ?? 'default_email@example.com'; // Cải tiến khi email là null
                      await AuthRepo().signInWithGoogle(email, context);
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.transparent,
                      border: Border.all(color: kMainColor),
                    ),
                    child: ListTile(
                      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                      leading: Image.asset(
                        'images/google.png',
                        height: 25,
                        width: 25,
                      ),
                      title: Text(
                        lang.S.of(context).continueWithGoogle,
                        style: const TextStyle(color: kWhite, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),

                ///______Apple_login_____________________________
                const SizedBox(height: 13),
                GestureDetector(
                  onTap: () async {
                    if (Platform.isIOS) {
                      try {
                        AuthorizationCredentialAppleID credential = await SignInWithApple.getAppleIDCredential(
                          scopes: [
                            AppleIDAuthorizationScopes.email,
                            AppleIDAuthorizationScopes.fullName,
                          ],
                        );
                        await AuthRepo().signInWithGoogle(credential.userIdentifier!, context);
                      } catch (e) {
                        EasyLoading.showError("Lỗi đăng nhập với Apple: $e");
                      }
                    } else {
                      EasyLoading.showError(lang.S.of(context).appleLoginWillWorkOnAppleDevises);
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.transparent,
                      border: Border.all(color: kMainColor),
                    ),
                    child: ListTile(
                      visualDensity: const VisualDensity(horizontal: -4, vertical: -4),
                      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                      leading: Image.asset(
                        'images/apple_logo.png',
                        height: 25,
                        width: 25,
                      ),
                      title: Text(
                        lang.S.of(context).continueWithApple,
                        style: const TextStyle(color: kWhite, fontWeight: FontWeight.w500),
                      ),
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

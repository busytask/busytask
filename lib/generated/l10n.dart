// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Scratch card`
  String get scratchCard {
    return Intl.message(
      'Scratch card',
      name: 'scratchCard',
      desc: '',
      args: [],
    );
  }

  /// `You Have Earned`
  String get youHaveEarned {
    return Intl.message(
      'You Have Earned',
      name: 'youHaveEarned',
      desc: '',
      args: [],
    );
  }

  /// `Coins`
  String get coins {
    return Intl.message('Coins', name: 'coins', desc: '', args: []);
  }

  /// `Scratch the above card by swiping on it`
  String get scratchTheAboveCardBySwipingOnnIt {
    return Intl.message(
      'Scratch the above card by swiping on it',
      name: 'scratchTheAboveCardBySwipingOnnIt',
      desc: '',
      args: [],
    );
  }

  /// `If you scratch this card then`
  String get ifYouScratchThisCard {
    return Intl.message(
      'If you scratch this card then',
      name: 'ifYouScratchThisCard',
      desc: '',
      args: [],
    );
  }

  /// `points will be deducted!`
  String get pointsWillBeDucted {
    return Intl.message(
      'points will be deducted!',
      name: 'pointsWillBeDucted',
      desc: '',
      args: [],
    );
  }

  /// `Scratch and win!`
  String get scratchAndWin {
    return Intl.message(
      'Scratch and win!',
      name: 'scratchAndWin',
      desc: '',
      args: [],
    );
  }

  /// `price`
  String get price {
    return Intl.message('price', name: 'price', desc: '', args: []);
  }

  /// `Points`
  String get points {
    return Intl.message('Points', name: 'points', desc: '', args: []);
  }

  /// `it use, you will detect`
  String get itUseYouWillDetect {
    return Intl.message(
      'it use, you will detect',
      name: 'itUseYouWillDetect',
      desc: '',
      args: [],
    );
  }

  /// `Visit Website`
  String get visitWebsite {
    return Intl.message(
      'Visit Website',
      name: 'visitWebsite',
      desc: '',
      args: [],
    );
  }

  /// `Total Website`
  String get totalWebsites {
    return Intl.message(
      'Total Website',
      name: 'totalWebsites',
      desc: '',
      args: [],
    );
  }

  /// `Visit a website only One Time A Day`
  String get visitWebsiteOnlyOneInADay {
    return Intl.message(
      'Visit a website only One Time A Day',
      name: 'visitWebsiteOnlyOneInADay',
      desc: '',
      args: [],
    );
  }

  /// `Visit website & Get`
  String get visitWebsiteAndGet {
    return Intl.message(
      'Visit website & Get',
      name: 'visitWebsiteAndGet',
      desc: '',
      args: [],
    );
  }

  /// `Custom Videos`
  String get customVideos {
    return Intl.message(
      'Custom Videos',
      name: 'customVideos',
      desc: '',
      args: [],
    );
  }

  /// `Total Videos`
  String get totalVideos {
    return Intl.message(
      'Total Videos',
      name: 'totalVideos',
      desc: '',
      args: [],
    );
  }

  /// `Watch a video only One Time A Day`
  String get watchAVideoOnlyOneTimeInADay {
    return Intl.message(
      'Watch a video only One Time A Day',
      name: 'watchAVideoOnlyOneTimeInADay',
      desc: '',
      args: [],
    );
  }

  /// `Play Video`
  String get playVideo {
    return Intl.message('Play Video', name: 'playVideo', desc: '', args: []);
  }

  /// `Watch Video`
  String get watchVideo {
    return Intl.message('Watch Video', name: 'watchVideo', desc: '', args: []);
  }

  /// `Please come back tomorrow\nto watch the video`
  String get pleaseComeBackTomorrowToWatchTheVideo {
    return Intl.message(
      'Please come back tomorrow\nto watch the video',
      name: 'pleaseComeBackTomorrowToWatchTheVideo',
      desc: '',
      args: [],
    );
  }

  /// `Survey`
  String get survey {
    return Intl.message('Survey', name: 'survey', desc: '', args: []);
  }

  /// `Pollfish`
  String get polish {
    return Intl.message('Pollfish', name: 'polish', desc: '', args: []);
  }

  /// `Bitrise`
  String get bitrise {
    return Intl.message('Bitrise', name: 'bitrise', desc: '', args: []);
  }

  /// `Inbrain`
  String get ingrain {
    return Intl.message('Inbrain', name: 'ingrain', desc: '', args: []);
  }

  /// `Continue with Mobile`
  String get continueWithMobile {
    return Intl.message(
      'Continue with Mobile',
      name: 'continueWithMobile',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get firstName {
    return Intl.message('First Name', name: 'firstName', desc: '', args: []);
  }

  /// `Enter First Name`
  String get enterFirstName {
    return Intl.message(
      'Enter First Name',
      name: 'enterFirstName',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get lastName {
    return Intl.message('Last Name', name: 'lastName', desc: '', args: []);
  }

  /// `Enter Last Name`
  String get enterLastName {
    return Intl.message(
      'Enter Last Name',
      name: 'enterLastName',
      desc: '',
      args: [],
    );
  }

  /// `Verification`
  String get verification {
    return Intl.message(
      'Verification',
      name: 'verification',
      desc: '',
      args: [],
    );
  }

  /// `Check Your Mobile`
  String get checkYourMobile {
    return Intl.message(
      'Check Your Mobile',
      name: 'checkYourMobile',
      desc: '',
      args: [],
    );
  }

  /// `We’ve sent the 6 digit code to your\nMobile `
  String get weHaveSentFourCodeSendYourMobile {
    return Intl.message(
      'We’ve sent the 6 digit code to your\nMobile ',
      name: 'weHaveSentFourCodeSendYourMobile',
      desc: '',
      args: [],
    );
  }

  /// `Please wait`
  String get pleaseWait {
    return Intl.message('Please wait', name: 'pleaseWait', desc: '', args: []);
  }

  /// `Seconds`
  String get seconds {
    return Intl.message('Seconds', name: 'seconds', desc: '', args: []);
  }

  /// `Did’t receive code?`
  String get dontReceiveCode {
    return Intl.message(
      'Did’t receive code?',
      name: 'dontReceiveCode',
      desc: '',
      args: [],
    );
  }

  /// `Resend Code`
  String get resendCode {
    return Intl.message('Resend Code', name: 'resendCode', desc: '', args: []);
  }

  /// `Verify`
  String get verify {
    return Intl.message('Verify', name: 'verify', desc: '', args: []);
  }

  /// `Delete Accounts`
  String get deleteAccounts {
    return Intl.message(
      'Delete Accounts',
      name: 'deleteAccounts',
      desc: '',
      args: [],
    );
  }

  /// `Websites`
  String get websites {
    return Intl.message('Websites', name: 'websites', desc: '', args: []);
  }

  /// `Welcome to Cash Rocket`
  String get WelcomeToCashRocket {
    return Intl.message(
      'Welcome to Cash Rocket',
      name: 'WelcomeToCashRocket',
      desc: '',
      args: [],
    );
  }

  /// `Redeem Your Points`
  String get RedeemYourPints {
    return Intl.message(
      'Redeem Your Points',
      name: 'RedeemYourPints',
      desc: '',
      args: [],
    );
  }

  /// `Secure Your Money`
  String get SecureYourMoney {
    return Intl.message(
      'Secure Your Money',
      name: 'SecureYourMoney',
      desc: '',
      args: [],
    );
  }

  /// `Send Otp`
  String get sendOtp {
    return Intl.message('Send Otp', name: 'sendOtp', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Quizzes`
  String get quizzes {
    return Intl.message('Quizzes', name: 'quizzes', desc: '', args: []);
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Cash Rocket`
  String get cashRocket {
    return Intl.message('Cash Rocket', name: 'cashRocket', desc: '', args: []);
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Remember Me`
  String get rememberMe {
    return Intl.message('Remember Me', name: 'rememberMe', desc: '', args: []);
  }

  /// `Enter Your Email Address`
  String get enterYourAddress {
    return Intl.message(
      'Enter Your Email Address',
      name: 'enterYourAddress',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Forgot Password`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Log In`
  String get logIn {
    return Intl.message('Log In', name: 'logIn', desc: '', args: []);
  }

  /// `Haven’t any account?`
  String get havenotAnyAcconts {
    return Intl.message(
      'Haven’t any account?',
      name: 'havenotAnyAcconts',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message('Sign Up', name: 'signUp', desc: '', args: []);
  }

  /// `Full Name`
  String get fullName {
    return Intl.message('Full Name', name: 'fullName', desc: '', args: []);
  }

  /// `Enter Your Full name`
  String get enterFullName {
    return Intl.message(
      'Enter Your Full name',
      name: 'enterFullName',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Email Address`
  String get enterYourEmail {
    return Intl.message(
      'Enter Your Email Address',
      name: 'enterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Mobile`
  String get mobile {
    return Intl.message('Mobile', name: 'mobile', desc: '', args: []);
  }

  /// `Enter Your Mobile`
  String get enterYourMobile {
    return Intl.message(
      'Enter Your Mobile',
      name: 'enterYourMobile',
      desc: '',
      args: [],
    );
  }

  /// `Enter invitation code`
  String get enterinvantationCode {
    return Intl.message(
      'Enter invitation code',
      name: 'enterinvantationCode',
      desc: '',
      args: [],
    );
  }

  /// `Invitation Code`
  String get invitationCode {
    return Intl.message(
      'Invitation Code',
      name: 'invitationCode',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account`
  String get alreadyHaveAnAccount {
    return Intl.message(
      'Already have an account',
      name: 'alreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signIn {
    return Intl.message('Sign In', name: 'signIn', desc: '', args: []);
  }

  /// `Reset Password`
  String get resetPassword {
    return Intl.message(
      'Reset Password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter your registered email address`
  String get enterYourRegistrationEmail {
    return Intl.message(
      'Enter your registered email address',
      name: 'enterYourRegistrationEmail',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continu {
    return Intl.message('Continue', name: 'continu', desc: '', args: []);
  }

  /// `Verify OTP`
  String get otpVerify {
    return Intl.message('Verify OTP', name: 'otpVerify', desc: '', args: []);
  }

  /// `Enter password`
  String get enterPassword {
    return Intl.message(
      'Enter password',
      name: 'enterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Re-Enter password`
  String get reEnterPassword {
    return Intl.message(
      'Re-Enter password',
      name: 'reEnterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to Cash Rocket`
  String get welcometoCashRocket {
    return Intl.message(
      'Welcome to Cash Rocket',
      name: 'welcometoCashRocket',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `Skip for now`
  String get skipForNow {
    return Intl.message('Skip for now', name: 'skipForNow', desc: '', args: []);
  }

  /// `Redeem Your Points`
  String get redemYOurPoint {
    return Intl.message(
      'Redeem Your Points',
      name: 'redemYOurPoint',
      desc: '',
      args: [],
    );
  }

  /// `Secure Your Money`
  String get secureYourMoney {
    return Intl.message(
      'Secure Your Money',
      name: 'secureYourMoney',
      desc: '',
      args: [],
    );
  }

  /// `Balance`
  String get balance {
    return Intl.message('Balance', name: 'balance', desc: '', args: []);
  }

  /// `Refer`
  String get refer {
    return Intl.message('Refer', name: 'refer', desc: '', args: []);
  }

  /// `Withdraw`
  String get withdraw {
    return Intl.message('Withdraw', name: 'withdraw', desc: '', args: []);
  }

  /// `Edit Profile`
  String get editProfile {
    return Intl.message(
      'Edit Profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Term of Service`
  String get termsOfService {
    return Intl.message(
      'Term of Service',
      name: 'termsOfService',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicty {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicty',
      desc: '',
      args: [],
    );
  }

  /// `Log Out`
  String get logOut {
    return Intl.message('Log Out', name: 'logOut', desc: '', args: []);
  }

  /// `Gallery`
  String get gallary {
    return Intl.message('Gallery', name: 'gallary', desc: '', args: []);
  }

  /// `Camera`
  String get camera {
    return Intl.message('Camera', name: 'camera', desc: '', args: []);
  }

  /// `Save`
  String get saves {
    return Intl.message('Save', name: 'saves', desc: '', args: []);
  }

  /// `Change Password`
  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Conditions`
  String get termsAndConditions {
    return Intl.message(
      'Terms & Conditions',
      name: 'termsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `Terms And Conditions of Use`
  String get termandConditionOfUse {
    return Intl.message(
      'Terms And Conditions of Use',
      name: 'termandConditionOfUse',
      desc: '',
      args: [],
    );
  }

  /// `Date Updated” (7 Jun 2021)`
  String get dateUpdated {
    return Intl.message(
      'Date Updated” (7 Jun 2021)',
      name: 'dateUpdated',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privicyPolcy {
    return Intl.message(
      'Privacy Policy',
      name: 'privicyPolcy',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy | Cash Rocket`
  String get privicyPolicyICashRocket {
    return Intl.message(
      'Privacy Policy | Cash Rocket',
      name: 'privicyPolicyICashRocket',
      desc: '',
      args: [],
    );
  }

  /// `Offer Status`
  String get offerStatus {
    return Intl.message(
      'Offer Status',
      name: 'offerStatus',
      desc: '',
      args: [],
    );
  }

  /// `In Progress`
  String get inProgress {
    return Intl.message('In Progress', name: 'inProgress', desc: '', args: []);
  }

  /// `Your Fyber User ID is`
  String get yourFyberUserIDis {
    return Intl.message(
      'Your Fyber User ID is',
      name: 'yourFyberUserIDis',
      desc: '',
      args: [],
    );
  }

  /// `Rise of Kingdoms: Lost Crus...`
  String get riseofKingdomsLostCrus {
    return Intl.message(
      'Rise of Kingdoms: Lost Crus...',
      name: 'riseofKingdomsLostCrus',
      desc: '',
      args: [],
    );
  }

  /// `Complete an action`
  String get completeanaction {
    return Intl.message(
      'Complete an action',
      name: 'completeanaction',
      desc: '',
      args: [],
    );
  }

  /// `Instructions`
  String get instructions {
    return Intl.message(
      'Instructions',
      name: 'instructions',
      desc: '',
      args: [],
    );
  }

  /// `Total Rewards`
  String get totalRewards {
    return Intl.message(
      'Total Rewards',
      name: 'totalRewards',
      desc: '',
      args: [],
    );
  }

  /// `Days to complete`
  String get daysToComplete {
    return Intl.message(
      'Days to complete',
      name: 'daysToComplete',
      desc: '',
      args: [],
    );
  }

  /// `Earn 2921 points`
  String get earnpoints {
    return Intl.message(
      'Earn 2921 points',
      name: 'earnpoints',
      desc: '',
      args: [],
    );
  }

  /// `Congratulations`
  String get congratulations {
    return Intl.message(
      'Congratulations',
      name: 'congratulations',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message('Ok', name: 'ok', desc: '', args: []);
  }

  /// `Daily Reward!`
  String get dailyReward {
    return Intl.message(
      'Daily Reward!',
      name: 'dailyReward',
      desc: '',
      args: [],
    );
  }

  /// `Collect Daily Reward Now!`
  String get collectDailyRewardNow {
    return Intl.message(
      'Collect Daily Reward Now!',
      name: 'collectDailyRewardNow',
      desc: '',
      args: [],
    );
  }

  /// `All Features`
  String get allFeatures {
    return Intl.message(
      'All Features',
      name: 'allFeatures',
      desc: '',
      args: [],
    );
  }

  /// `Offers`
  String get offers {
    return Intl.message('Offers', name: 'offers', desc: '', args: []);
  }

  /// `Videos`
  String get videos {
    return Intl.message('Videos', name: 'videos', desc: '', args: []);
  }

  /// `Wheel`
  String get wheel {
    return Intl.message('Wheel', name: 'wheel', desc: '', args: []);
  }

  /// `Redeem`
  String get redeem {
    return Intl.message('Redeem', name: 'redeem', desc: '', args: []);
  }

  /// `Quiz`
  String get quiz {
    return Intl.message('Quiz', name: 'quiz', desc: '', args: []);
  }

  /// `Tutorial`
  String get tutorial {
    return Intl.message('Tutorial', name: 'tutorial', desc: '', args: []);
  }

  /// `Share`
  String get share {
    return Intl.message('Share', name: 'share', desc: '', args: []);
  }

  /// `No Internet Connection Found`
  String get noInternetCollection {
    return Intl.message(
      'No Internet Connection Found',
      name: 'noInternetCollection',
      desc: '',
      args: [],
    );
  }

  /// `Try Again`
  String get tryAgain {
    return Intl.message('Try Again', name: 'tryAgain', desc: '', args: []);
  }

  /// `Enter Coin Amount`
  String get enterCoinAmount {
    return Intl.message(
      'Enter Coin Amount',
      name: 'enterCoinAmount',
      desc: '',
      args: [],
    );
  }

  /// `Withdraw Account`
  String get withdrawAccount {
    return Intl.message(
      'Withdraw Account',
      name: 'withdrawAccount',
      desc: '',
      args: [],
    );
  }

  /// `Offertoro`
  String get offerToro {
    return Intl.message('Offertoro', name: 'offerToro', desc: '', args: []);
  }

  /// `Earn BDT`
  String get earbdt {
    return Intl.message('Earn BDT', name: 'earbdt', desc: '', args: []);
  }

  /// `Points received`
  String get pointRecived {
    return Intl.message(
      'Points received',
      name: 'pointRecived',
      desc: '',
      args: [],
    );
  }

  /// `Spin the Wheel`
  String get spinTheWheel {
    return Intl.message(
      'Spin the Wheel',
      name: 'spinTheWheel',
      desc: '',
      args: [],
    );
  }

  /// `Press the SPIN Wheel`
  String get pressTheSpinWheel {
    return Intl.message(
      'Press the SPIN Wheel',
      name: 'pressTheSpinWheel',
      desc: '',
      args: [],
    );
  }

  /// `Watch Video (Earn 10 Coins)`
  String get watchVideoAndEarn {
    return Intl.message(
      'Watch Video (Earn 10 Coins)',
      name: 'watchVideoAndEarn',
      desc: '',
      args: [],
    );
  }

  /// `Invite Your Friends`
  String get inviteYourFriends {
    return Intl.message(
      'Invite Your Friends',
      name: 'inviteYourFriends',
      desc: '',
      args: [],
    );
  }

  /// `Invite your friends to use Cash Rocket and you will receive 100 points for each one`
  String get inviteYourFriendtoUseCashRocket {
    return Intl.message(
      'Invite your friends to use Cash Rocket and you will receive 100 points for each one',
      name: 'inviteYourFriendtoUseCashRocket',
      desc: '',
      args: [],
    );
  }

  /// `Invite Now`
  String get inviteNow {
    return Intl.message('Invite Now', name: 'inviteNow', desc: '', args: []);
  }

  /// `Are you agree?`
  String get areYouAgree {
    return Intl.message(
      'Are you agree?',
      name: 'areYouAgree',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message('Yes', name: 'yes', desc: '', args: []);
  }

  /// `No`
  String get No {
    return Intl.message('No', name: 'No', desc: '', args: []);
  }

  /// `Winner!`
  String get winner {
    return Intl.message('Winner!', name: 'winner', desc: '', args: []);
  }

  /// `No Quiz Found`
  String get noQuizFound {
    return Intl.message(
      'No Quiz Found',
      name: 'noQuizFound',
      desc: '',
      args: [],
    );
  }

  /// `Amet minim mollit non deserunt ullamc est sit aliqua dolor amet Velit officia\n consequat amet minim`
  String get amentMinim {
    return Intl.message(
      'Amet minim mollit non deserunt ullamc est sit aliqua dolor amet Velit officia\n consequat amet minim',
      name: 'amentMinim',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message('Skip', name: 'skip', desc: '', args: []);
  }

  /// `Sorry`
  String get sorry {
    return Intl.message('Sorry', name: 'sorry', desc: '', args: []);
  }

  /// `You Lose`
  String get youLose {
    return Intl.message('You Lose', name: 'youLose', desc: '', args: []);
  }

  /// `Play again`
  String get playAgain {
    return Intl.message('Play again', name: 'playAgain', desc: '', args: []);
  }

  /// `Share Score`
  String get shareSqure {
    return Intl.message('Share Score', name: 'shareSqure', desc: '', args: []);
  }

  /// `Rate Us`
  String get rateUs {
    return Intl.message('Rate Us', name: 'rateUs', desc: '', args: []);
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `VICTORY`
  String get victory {
    return Intl.message('VICTORY', name: 'victory', desc: '', args: []);
  }

  /// `Earn Points`
  String get earnPoint {
    return Intl.message('Earn Points', name: 'earnPoint', desc: '', args: []);
  }

  /// `Top Offer!`
  String get topOffer {
    return Intl.message('Top Offer!', name: 'topOffer', desc: '', args: []);
  }

  /// `Free`
  String get free {
    return Intl.message('Free', name: 'free', desc: '', args: []);
  }

  /// `Hard`
  String get hard {
    return Intl.message('Hard', name: 'hard', desc: '', args: []);
  }

  /// `History`
  String get history {
    return Intl.message('History', name: 'history', desc: '', args: []);
  }

  /// `Reward`
  String get reward {
    return Intl.message('Reward', name: 'reward', desc: '', args: []);
  }

  /// `Wannads Offerwall`
  String get wannadsOfferwall {
    return Intl.message(
      'Wannads Offerwall',
      name: 'wannadsOfferwall',
      desc: '',
      args: [],
    );
  }

  /// `Earn BDT`
  String get earnbdt {
    return Intl.message('Earn BDT', name: 'earnbdt', desc: '', args: []);
  }

  /// `Personaly`
  String get personaly {
    return Intl.message('Personaly', name: 'personaly', desc: '', args: []);
  }

  /// `earn`
  String get earn {
    return Intl.message('earn', name: 'earn', desc: '', args: []);
  }

  /// `Og Ads`
  String get ogAds {
    return Intl.message('Og Ads', name: 'ogAds', desc: '', args: []);
  }

  /// `Kiwi Wall`
  String get kiwiwall {
    return Intl.message('Kiwi Wall', name: 'kiwiwall', desc: '', args: []);
  }

  /// `Please enter your email address below to recive your`
  String get pleaseEnterYourAddressbelow {
    return Intl.message(
      'Please enter your email address below to recive your',
      name: 'pleaseEnterYourAddressbelow',
      desc: '',
      args: [],
    );
  }

  /// `Please enter the code below to reset your`
  String get pleaseResetYOurCode {
    return Intl.message(
      'Please enter the code below to reset your',
      name: 'pleaseResetYOurCode',
      desc: '',
      args: [],
    );
  }

  /// `1.  Play Rise of Kingdoms`
  String get playRiseofKingdoms {
    return Intl.message(
      '1.  Play Rise of Kingdoms',
      name: 'playRiseofKingdoms',
      desc: '',
      args: [],
    );
  }

  /// `2. Upgrade your city ot level 17`
  String get upgradeyourcityotlevel17 {
    return Intl.message(
      '2. Upgrade your city ot level 17',
      name: 'upgradeyourcityotlevel17',
      desc: '',
      args: [],
    );
  }

  /// `3.  Here comes your reward!`
  String get hereComesYourReward {
    return Intl.message(
      '3.  Here comes your reward!',
      name: 'hereComesYourReward',
      desc: '',
      args: [],
    );
  }

  /// `4.  Please complete the task within 22 days`
  String get pleaseCompleteTheTaskWithin22days {
    return Intl.message(
      '4.  Please complete the task within 22 days',
      name: 'pleaseCompleteTheTaskWithin22days',
      desc: '',
      args: [],
    );
  }

  /// `5.  User can only obtain reward from ONE Rise of kingdoms offer `
  String get userCanaonly {
    return Intl.message(
      '5.  User can only obtain reward from ONE Rise of kingdoms offer ',
      name: 'userCanaonly',
      desc: '',
      args: [],
    );
  }

  /// `Let’s Get Startes`
  String get letsGetStarted {
    return Intl.message(
      'Let’s Get Startes',
      name: 'letsGetStarted',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Facebook`
  String get continueWithFacebok {
    return Intl.message(
      'Continue with Facebook',
      name: 'continueWithFacebok',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Google`
  String get continueWithGoogle {
    return Intl.message(
      'Continue with Google',
      name: 'continueWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Sign up with Email`
  String get signUpwitEmail {
    return Intl.message(
      'Sign up with Email',
      name: 'signUpwitEmail',
      desc: '',
      args: [],
    );
  }

  /// `A`
  String get a {
    return Intl.message('A', name: 'a', desc: '', args: []);
  }

  /// `B`
  String get b {
    return Intl.message('B', name: 'b', desc: '', args: []);
  }

  /// `C`
  String get c {
    return Intl.message('C', name: 'c', desc: '', args: []);
  }

  /// `D`
  String get d {
    return Intl.message('D', name: 'd', desc: '', args: []);
  }

  /// `Ullamcorper eros senectus urna sit elementum ali quet. Nibh mauris tristique elit pellentesque sa pien malesuada eleifend iaculis malesuada. Mau ris, ut id hendrerit habitant gravida urna congue arcu sit. At quisque leo semper urna gravida`
  String get ullamcorperEros {
    return Intl.message(
      'Ullamcorper eros senectus urna sit elementum ali quet. Nibh mauris tristique elit pellentesque sa pien malesuada eleifend iaculis malesuada. Mau ris, ut id hendrerit habitant gravida urna congue arcu sit. At quisque leo semper urna gravida',
      name: 'ullamcorperEros',
      desc: '',
      args: [],
    );
  }

  /// `iaculis nibh aliquam. Morbi tempor facilisi ultricies magna vitae sit. Velit augue sagittis, tempor, amet arcu nullam quam. Sit feugiat amet, pellentesque morbi mattis id blandit arcu morbi. Morbi cursus ac tortor amet. Iaculis nunc bibendum in vitae turpis mattis nisl viverra. Turpis habitant purus, venenatis vitae ut urna, rhoncus nunc. Aliquam turpis pellentesque arcu malesuada ut et lorem. Donec tincidunt tristique ultricies sed faucibus. Morbi et eu mi, nec, suscipit. Duis pellentesque facilisi pharetra enim neque sagittis.`
  String get iaculisNibh {
    return Intl.message(
      'iaculis nibh aliquam. Morbi tempor facilisi ultricies magna vitae sit. Velit augue sagittis, tempor, amet arcu nullam quam. Sit feugiat amet, pellentesque morbi mattis id blandit arcu morbi. Morbi cursus ac tortor amet. Iaculis nunc bibendum in vitae turpis mattis nisl viverra. Turpis habitant purus, venenatis vitae ut urna, rhoncus nunc. Aliquam turpis pellentesque arcu malesuada ut et lorem. Donec tincidunt tristique ultricies sed faucibus. Morbi et eu mi, nec, suscipit. Duis pellentesque facilisi pharetra enim neque sagittis.',
      name: 'iaculisNibh',
      desc: '',
      args: [],
    );
  }

  /// `Luctus mauris pharetra sit elit integer consec tetur etiam quis auctor.`
  String get lactusMautis {
    return Intl.message(
      'Luctus mauris pharetra sit elit integer consec tetur etiam quis auctor.',
      name: 'lactusMautis',
      desc: '',
      args: [],
    );
  }

  /// `Lorem ipsum dolor sit amet, consectetur adip is ci ng elit. Neque nulla sed mauris feugiat eget. Augu e id neque nisl nibh ut facilisis massa,`
  String get loremipsum {
    return Intl.message(
      'Lorem ipsum dolor sit amet, consectetur adip is ci ng elit. Neque nulla sed mauris feugiat eget. Augu e id neque nisl nibh ut facilisis massa,',
      name: 'loremipsum',
      desc: '',
      args: [],
    );
  }

  /// `AdGem`
  String get adGem {
    return Intl.message('AdGem', name: 'adGem', desc: '', args: []);
  }

  /// `Complete an action`
  String get completeAnAction {
    return Intl.message(
      'Complete an action',
      name: 'completeAnAction',
      desc: '',
      args: [],
    );
  }

  /// `Rise of Kingdoms: Lost Crusade`
  String get riseOfKingdomsLostCrusade {
    return Intl.message(
      'Rise of Kingdoms: Lost Crusade',
      name: 'riseOfKingdomsLostCrusade',
      desc: '',
      args: [],
    );
  }

  /// `My Gym: Fitness Studio Manager`
  String get myGymFitnessStudioManager {
    return Intl.message(
      'My Gym: Fitness Studio Manager',
      name: 'myGymFitnessStudioManager',
      desc: '',
      args: [],
    );
  }

  /// `Annotate Images for Al`
  String get annotateImagesForAl {
    return Intl.message(
      'Annotate Images for Al',
      name: 'annotateImagesForAl',
      desc: '',
      args: [],
    );
  }

  /// `Hey! More Cash!`
  String get heyMoreCash {
    return Intl.message(
      'Hey! More Cash!',
      name: 'heyMoreCash',
      desc: '',
      args: [],
    );
  }

  /// `Reach Level 100 in The Game!`
  String get reachLevel100InTheGame {
    return Intl.message(
      'Reach Level 100 in The Game!',
      name: 'reachLevel100InTheGame',
      desc: '',
      args: [],
    );
  }

  /// `Atlas VPN`
  String get atlasVPN {
    return Intl.message('Atlas VPN', name: 'atlasVPN', desc: '', args: []);
  }

  /// `Verifying OTP`
  String get verifyingOTP {
    return Intl.message(
      'Verifying OTP',
      name: 'verifyingOTP',
      desc: '',
      args: [],
    );
  }

  /// `Invalid OTP`
  String get invalidOTP {
    return Intl.message('Invalid OTP', name: 'invalidOTP', desc: '', args: []);
  }

  /// `Complete Profile`
  String get completeProfile {
    return Intl.message(
      'Complete Profile',
      name: 'completeProfile',
      desc: '',
      args: [],
    );
  }

  /// `Completing Profile`
  String get completingProfile {
    return Intl.message(
      'Completing Profile',
      name: 'completingProfile',
      desc: '',
      args: [],
    );
  }

  /// `Profile Completed Successfully`
  String get profileCompletedSuccessfully {
    return Intl.message(
      'Profile Completed Successfully',
      name: 'profileCompletedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Error Occurred. Please Try again`
  String get errorOccurredPleaseTryAgain {
    return Intl.message(
      'Error Occurred. Please Try again',
      name: 'errorOccurredPleaseTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Apple login will work on apple devises`
  String get appleLoginWillWorkOnAppleDevises {
    return Intl.message(
      'Apple login will work on apple devises',
      name: 'appleLoginWillWorkOnAppleDevises',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Apple`
  String get continueWithApple {
    return Intl.message(
      'Continue with Apple',
      name: 'continueWithApple',
      desc: '',
      args: [],
    );
  }

  /// `Sending Otp`
  String get sendingOtp {
    return Intl.message('Sending Otp', name: 'sendingOtp', desc: '', args: []);
  }

  /// `Otp sent. Please check your email`
  String get otpSentPleaseCheckYourEmail {
    return Intl.message(
      'Otp sent. Please check your email',
      name: 'otpSentPleaseCheckYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please Try Again`
  String get pleaseTryAgain {
    return Intl.message(
      'Please Try Again',
      name: 'pleaseTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Error Occurred`
  String get errorOccurred {
    return Intl.message(
      'Error Occurred',
      name: 'errorOccurred',
      desc: '',
      args: [],
    );
  }

  /// `OTP Sent`
  String get oTPSent {
    return Intl.message('OTP Sent', name: 'oTPSent', desc: '', args: []);
  }

  /// `Please Enter Your OTP`
  String get pleaseEnterYourOTP {
    return Intl.message(
      'Please Enter Your OTP',
      name: 'pleaseEnterYourOTP',
      desc: '',
      args: [],
    );
  }

  /// `OTP Verified`
  String get oTPVerified {
    return Intl.message(
      'OTP Verified',
      name: 'oTPVerified',
      desc: '',
      args: [],
    );
  }

  /// `Please check your otp`
  String get pleaseCheckYourOtp {
    return Intl.message(
      'Please check your otp',
      name: 'pleaseCheckYourOtp',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Your OTP`
  String get PleaseEnterYourOTP {
    return Intl.message(
      'Please Enter Your OTP',
      name: 'PleaseEnterYourOTP',
      desc: '',
      args: [],
    );
  }

  /// `Your Password Doesn't match`
  String get yourPasswordDoesNotMatch {
    return Intl.message(
      'Your Password Doesn\'t match',
      name: 'yourPasswordDoesNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Resetting Password`
  String get resettingPassword {
    return Intl.message(
      'Resetting Password',
      name: 'resettingPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password Reset Successfully`
  String get passwordResetSuccessfully {
    return Intl.message(
      'Password Reset Successfully',
      name: 'passwordResetSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Error Happened`
  String get errorHappened {
    return Intl.message(
      'Error Happened',
      name: 'errorHappened',
      desc: '',
      args: [],
    );
  }

  /// `Full Name is Required`
  String get fullNameIsRequired {
    return Intl.message(
      'Full Name is Required',
      name: 'fullNameIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Mobile Number is Required`
  String get mobileNumberIsRequired {
    return Intl.message(
      'Mobile Number is Required',
      name: 'mobileNumberIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Email Address is Required`
  String get emailAddressIsRequired {
    return Intl.message(
      'Email Address is Required',
      name: 'emailAddressIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Password is Required`
  String get passwordIsRequired {
    return Intl.message(
      'Password is Required',
      name: 'passwordIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Password length must be at least 6 Character`
  String get passwordLengthMustBeAtLeast6Character {
    return Intl.message(
      'Password length must be at least 6 Character',
      name: 'passwordLengthMustBeAtLeast6Character',
      desc: '',
      args: [],
    );
  }

  /// `Signing Up`
  String get signingUp {
    return Intl.message('Signing Up', name: 'signingUp', desc: '', args: []);
  }

  /// `Sign Up Successful`
  String get signUpSuccessful {
    return Intl.message(
      'Sign Up Successful',
      name: 'signUpSuccessful',
      desc: '',
      args: [],
    );
  }

  /// `Exception`
  String get exception {
    return Intl.message('Exception', name: 'exception', desc: '', args: []);
  }

  /// `token`
  String get token {
    return Intl.message('token', name: 'token', desc: '', args: []);
  }

  /// `userId`
  String get userId {
    return Intl.message('userId', name: 'userId', desc: '', args: []);
  }

  /// `Looser`
  String get looser {
    return Intl.message('Looser', name: 'looser', desc: '', args: []);
  }

  /// `AdColony Video`
  String get adColonyVideo {
    return Intl.message(
      'AdColony Video',
      name: 'adColonyVideo',
      desc: '',
      args: [],
    );
  }

  /// `Fyber Offer`
  String get fyberOffer {
    return Intl.message('Fyber Offer', name: 'fyberOffer', desc: '', args: []);
  }

  /// `Chartboost Video`
  String get chartboostVideo {
    return Intl.message(
      'Chartboost Video',
      name: 'chartboostVideo',
      desc: '',
      args: [],
    );
  }

  /// `Vungle Video`
  String get vungleVideo {
    return Intl.message(
      'Vungle Video',
      name: 'vungleVideo',
      desc: '',
      args: [],
    );
  }

  /// `Kiwi Wall Offer`
  String get kiwiWallOffer {
    return Intl.message(
      'Kiwi Wall Offer',
      name: 'kiwiWallOffer',
      desc: '',
      args: [],
    );
  }

  /// `AdMob Video`
  String get adMobVideo {
    return Intl.message('AdMob Video', name: 'adMobVideo', desc: '', args: []);
  }

  /// `None`
  String get none {
    return Intl.message('None', name: 'none', desc: '', args: []);
  }

  /// `Don't know`
  String get doNotKnow {
    return Intl.message('Don\'t know', name: 'doNotKnow', desc: '', args: []);
  }

  /// `Loading`
  String get loading {
    return Intl.message('Loading', name: 'loading', desc: '', args: []);
  }

  /// `Successful`
  String get successful {
    return Intl.message('Successful', name: 'successful', desc: '', args: []);
  }

  /// `Something went wrong`
  String get somethingWentWrong {
    return Intl.message(
      'Something went wrong',
      name: 'somethingWentWrong',
      desc: '',
      args: [],
    );
  }

  /// `If you retake then`
  String get ifYouRetakeThen {
    return Intl.message(
      'If you retake then',
      name: 'ifYouRetakeThen',
      desc: '',
      args: [],
    );
  }

  /// `points will be deducted!`
  String get pointsWillBeDeducted {
    return Intl.message(
      'points will be deducted!',
      name: 'pointsWillBeDeducted',
      desc: '',
      args: [],
    );
  }

  /// `Paid For Quiz Retake`
  String get paidForQuizRetake {
    return Intl.message(
      'Paid For Quiz Retake',
      name: 'paidForQuizRetake',
      desc: '',
      args: [],
    );
  }

  /// `Not Enough Coin`
  String get notEnoughCoin {
    return Intl.message(
      'Not Enough Coin',
      name: 'notEnoughCoin',
      desc: '',
      args: [],
    );
  }

  /// `Review Not Available`
  String get reviewNotAvailable {
    return Intl.message(
      'Review Not Available',
      name: 'reviewNotAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Loser`
  String get loser {
    return Intl.message('Loser', name: 'loser', desc: '', args: []);
  }

  /// `Love Sick: Love Stories Games`
  String get loveSickLoveStoriesGames {
    return Intl.message(
      'Love Sick: Love Stories Games',
      name: 'loveSickLoveStoriesGames',
      desc: '',
      args: [],
    );
  }

  /// `Wannads`
  String get wannads {
    return Intl.message('Wannads', name: 'wannads', desc: '', args: []);
  }

  /// `Kiwi Wall`
  String get kiwiWall {
    return Intl.message('Kiwi Wall', name: 'kiwiWall', desc: '', args: []);
  }

  /// `OGAds`
  String get oGAds {
    return Intl.message('OGAds', name: 'oGAds', desc: '', args: []);
  }

  /// `Complete offers and get points`
  String get completeOffersAndGetPoints {
    return Intl.message(
      'Complete offers and get points',
      name: 'completeOffersAndGetPoints',
      desc: '',
      args: [],
    );
  }

  /// `If you play this quiz then`
  String get ifYouPlayThisQuizThen {
    return Intl.message(
      'If you play this quiz then',
      name: 'ifYouPlayThisQuizThen',
      desc: '',
      args: [],
    );
  }

  /// `Paid Quiz Play`
  String get paidQuizPlay {
    return Intl.message(
      'Paid Quiz Play',
      name: 'paidQuizPlay',
      desc: '',
      args: [],
    );
  }

  /// `You have already won this quiz. Try playing other quiz`
  String get youHaveAlreadyWonThisQuizTryPlayingOtherQuiz {
    return Intl.message(
      'You have already won this quiz. Try playing other quiz',
      name: 'youHaveAlreadyWonThisQuizTryPlayingOtherQuiz',
      desc: '',
      args: [],
    );
  }

  /// `You Are Disable!`
  String get youAreDisable {
    return Intl.message(
      'You Are Disable!',
      name: 'youAreDisable',
      desc: '',
      args: [],
    );
  }

  /// `You are retaking the quiz`
  String get youAreRetakingTheQuiz {
    return Intl.message(
      'You are retaking the quiz',
      name: 'youAreRetakingTheQuiz',
      desc: '',
      args: [],
    );
  }

  /// `Already Played`
  String get alreadyPlayed {
    return Intl.message(
      'Already Played',
      name: 'alreadyPlayed',
      desc: '',
      args: [],
    );
  }

  /// `Entry Fee`
  String get entryFee {
    return Intl.message('Entry Fee', name: 'entryFee', desc: '', args: []);
  }

  /// `Reward Point`
  String get rewardPoint {
    return Intl.message(
      'Reward Point',
      name: 'rewardPoint',
      desc: '',
      args: [],
    );
  }

  /// `Invitation Code Copied`
  String get invitationCodeCopied {
    return Intl.message(
      'Invitation Code Copied',
      name: 'invitationCodeCopied',
      desc: '',
      args: [],
    );
  }

  /// `AppLovin`
  String get appLovin {
    return Intl.message('AppLovin', name: 'appLovin', desc: '', args: []);
  }

  /// `StartApp`
  String get startApp {
    return Intl.message('StartApp', name: 'startApp', desc: '', args: []);
  }

  /// `AdMob`
  String get adMob {
    return Intl.message('AdMob', name: 'adMob', desc: '', args: []);
  }

  /// `Audience Network`
  String get audienceNetwork {
    return Intl.message(
      'Audience Network',
      name: 'audienceNetwork',
      desc: '',
      args: [],
    );
  }

  /// `Watch viewos and get Points`
  String get watchViewosAndGetPoints {
    return Intl.message(
      'Watch viewos and get Points',
      name: 'watchViewosAndGetPoints',
      desc: '',
      args: [],
    );
  }

  /// `Charging Entry fee`
  String get chargingEntryFee {
    return Intl.message(
      'Charging Entry fee',
      name: 'chargingEntryFee',
      desc: '',
      args: [],
    );
  }

  /// `Spin Wheel Entry fee`
  String get spinWheelEntryFee {
    return Intl.message(
      'Spin Wheel Entry fee',
      name: 'spinWheelEntryFee',
      desc: '',
      args: [],
    );
  }

  /// `spinTime`
  String get spinTime {
    return Intl.message('spinTime', name: 'spinTime', desc: '', args: []);
  }

  /// `Getting rewards`
  String get gettingRewards {
    return Intl.message(
      'Getting rewards',
      name: 'gettingRewards',
      desc: '',
      args: [],
    );
  }

  /// `Spin Wheel Video Ads`
  String get spinWheelVideoAds {
    return Intl.message(
      'Spin Wheel Video Ads',
      name: 'spinWheelVideoAds',
      desc: '',
      args: [],
    );
  }

  /// `Error Happened. Try Again`
  String get errorHappenedTryAgain {
    return Intl.message(
      'Error Happened. Try Again',
      name: 'errorHappenedTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Not enough Balance`
  String get notEnoughBalance {
    return Intl.message(
      'Not enough Balance',
      name: 'notEnoughBalance',
      desc: '',
      args: [],
    );
  }

  /// `PayPal`
  String get payPal {
    return Intl.message('PayPal', name: 'payPal', desc: '', args: []);
  }

  /// `bkash`
  String get bkash {
    return Intl.message('bkash', name: 'bkash', desc: '', args: []);
  }

  /// `Paytm`
  String get Paytm {
    return Intl.message('Paytm', name: 'Paytm', desc: '', args: []);
  }

  /// `Stripe`
  String get Stripe {
    return Intl.message('Stripe', name: 'Stripe', desc: '', args: []);
  }

  /// `Minimum 1000 Points`
  String get minimum1000Points {
    return Intl.message(
      'Minimum 1000 Points',
      name: 'minimum1000Points',
      desc: '',
      args: [],
    );
  }

  /// `Not Defined`
  String get notDefined {
    return Intl.message('Not Defined', name: 'notDefined', desc: '', args: []);
  }

  /// `Please Select Withdraw Method and Currency`
  String get pleaseSelectWithdrawMethodAndCurrency {
    return Intl.message(
      'Please Select Withdraw Method and Currency',
      name: 'pleaseSelectWithdrawMethodAndCurrency',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter the amount`
  String get pleaseEnterTheAmount {
    return Intl.message(
      'Please Enter the amount',
      name: 'pleaseEnterTheAmount',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter the withdraw account`
  String get pleaseEnterTheWithdrawAccount {
    return Intl.message(
      'Please Enter the withdraw account',
      name: 'pleaseEnterTheWithdrawAccount',
      desc: '',
      args: [],
    );
  }

  /// `Minimum withdraw balance is`
  String get minimumWithdrawBalanceIs {
    return Intl.message(
      'Minimum withdraw balance is',
      name: 'minimumWithdrawBalanceIs',
      desc: '',
      args: [],
    );
  }

  /// `Requesting Withdraw`
  String get requestingWithdraw {
    return Intl.message(
      'Requesting Withdraw',
      name: 'requestingWithdraw',
      desc: '',
      args: [],
    );
  }

  /// `Withdraw requested Successfully`
  String get withdrawRequestedSuccessfully {
    return Intl.message(
      'Withdraw requested Successfully',
      name: 'withdrawRequestedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Points received`
  String get pointsReceived {
    return Intl.message(
      'Points received',
      name: 'pointsReceived',
      desc: '',
      args: [],
    );
  }

  /// `Already rewarded come back later`
  String get alreadyRewardedComeBackLater {
    return Intl.message(
      'Already rewarded come back later',
      name: 'alreadyRewardedComeBackLater',
      desc: '',
      args: [],
    );
  }

  /// `Getting Today's Reward`
  String get gettingTodayReward {
    return Intl.message(
      'Getting Today\'s Reward',
      name: 'gettingTodayReward',
      desc: '',
      args: [],
    );
  }

  /// `Reward Added`
  String get rewardAdded {
    return Intl.message(
      'Reward Added',
      name: 'rewardAdded',
      desc: '',
      args: [],
    );
  }

  /// `Already Rewarded. Try Again Later`
  String get alreadyRewardedTryAgainLater {
    return Intl.message(
      'Already Rewarded. Try Again Later',
      name: 'alreadyRewardedTryAgainLater',
      desc: '',
      args: [],
    );
  }

  /// `Tending Offers`
  String get tendingOffers {
    return Intl.message(
      'Tending Offers',
      name: 'tendingOffers',
      desc: '',
      args: [],
    );
  }

  /// `You Are Disabled!`
  String get youAreDisabled {
    return Intl.message(
      'You Are Disabled!',
      name: 'youAreDisabled',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your New Password`
  String get enterYourNewPassword {
    return Intl.message(
      'Enter Your New Password',
      name: 'enterYourNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your Password Again`
  String get enterYourPasswordAgain {
    return Intl.message(
      'Enter Your Password Again',
      name: 'enterYourPasswordAgain',
      desc: '',
      args: [],
    );
  }

  /// `Update Password`
  String get updatePassword {
    return Intl.message(
      'Update Password',
      name: 'updatePassword',
      desc: '',
      args: [],
    );
  }

  /// `Password can't be empty`
  String get passwordCanNotBeEmpty {
    return Intl.message(
      'Password can\'t be empty',
      name: 'passwordCanNotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Password can't be less than 6 character`
  String get passwordCanNotBeLessThan6Character {
    return Intl.message(
      'Password can\'t be less than 6 character',
      name: 'passwordCanNotBeLessThan6Character',
      desc: '',
      args: [],
    );
  }

  /// `Password doesn't match`
  String get passwordDoesNotMatch {
    return Intl.message(
      'Password doesn\'t match',
      name: 'passwordDoesNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Updating Password`
  String get updatingPassword {
    return Intl.message(
      'Updating Password',
      name: 'updatingPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password Update Successful`
  String get passwordUpdateSuccessful {
    return Intl.message(
      'Password Update Successful',
      name: 'passwordUpdateSuccessful',
      desc: '',
      args: [],
    );
  }

  /// `Updating Profile`
  String get updatingProfile {
    return Intl.message(
      'Updating Profile',
      name: 'updatingProfile',
      desc: '',
      args: [],
    );
  }

  /// `Profile Edited Successfully`
  String get profileEditedSuccessfully {
    return Intl.message(
      'Profile Edited Successfully',
      name: 'profileEditedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Image size should be smaller than 2 mb`
  String get imageSizeShouldBeSmallerThan2Mb {
    return Intl.message(
      'Image size should be smaller than 2 mb',
      name: 'imageSizeShouldBeSmallerThan2Mb',
      desc: '',
      args: [],
    );
  }

  /// `Medium`
  String get medium {
    return Intl.message('Medium', name: 'medium', desc: '', args: []);
  }

  /// `Deleting Account`
  String get deletingAccount {
    return Intl.message(
      'Deleting Account',
      name: 'deletingAccount',
      desc: '',
      args: [],
    );
  }

  /// `Deletion Successful`
  String get deletionSuccessful {
    return Intl.message(
      'Deletion Successful',
      name: 'deletionSuccessful',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete this Account?`
  String get areYouSureYouWantToDeleteThisAccount {
    return Intl.message(
      'Are you sure you want to delete this Account?',
      name: 'areYouSureYouWantToDeleteThisAccount',
      desc: '',
      args: [],
    );
  }

  /// `Yes, Delete it!`
  String get yesDeleteIt {
    return Intl.message(
      'Yes, Delete it!',
      name: 'yesDeleteIt',
      desc: '',
      args: [],
    );
  }

  /// `Signing Out`
  String get signingOut {
    return Intl.message('Signing Out', name: 'signingOut', desc: '', args: []);
  }

  /// `Sign Out Successful`
  String get signOutSuccessful {
    return Intl.message(
      'Sign Out Successful',
      name: 'signOutSuccessful',
      desc: '',
      args: [],
    );
  }

  /// `Paid For Scratch Card`
  String get paidForScratchCard {
    return Intl.message(
      'Paid For Scratch Card',
      name: 'paidForScratchCard',
      desc: '',
      args: [],
    );
  }

  /// `Getting reward`
  String get gettingReward {
    return Intl.message(
      'Getting reward',
      name: 'gettingReward',
      desc: '',
      args: [],
    );
  }

  /// `Rewarded Successfully`
  String get rewardedSuccessfully {
    return Intl.message(
      'Rewarded Successfully',
      name: 'rewardedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Amet minim mollit non deserunt ullamc est sit aliqua dolor amet Velit officia nconsequat amet minim`
  String get AmetMinimMollitNon {
    return Intl.message(
      'Amet minim mollit non deserunt ullamc est sit aliqua dolor amet Velit officia nconsequat amet minim',
      name: 'AmetMinimMollitNon',
      desc: '',
      args: [],
    );
  }

  /// `Bitlabs Survey`
  String get bitlabsSurvey {
    return Intl.message(
      'Bitlabs Survey',
      name: 'bitlabsSurvey',
      desc: '',
      args: [],
    );
  }

  /// `Please check your purchase code`
  String get pleaseCheckYourPurchaseCode {
    return Intl.message(
      'Please check your purchase code',
      name: 'pleaseCheckYourPurchaseCode',
      desc: '',
      args: [],
    );
  }

  /// `Survey Completed. Will be rewarded soon`
  String get surveyCompletedWillBeRewardedSoon {
    return Intl.message(
      'Survey Completed. Will be rewarded soon',
      name: 'surveyCompletedWillBeRewardedSoon',
      desc: '',
      args: [],
    );
  }

  /// `Pollfish Survey`
  String get pollfishSurvey {
    return Intl.message(
      'Pollfish Survey',
      name: 'pollfishSurvey',
      desc: '',
      args: [],
    );
  }

  /// `Survey Panel Closed`
  String get surveyPanelClosed {
    return Intl.message(
      'Survey Panel Closed',
      name: 'surveyPanelClosed',
      desc: '',
      args: [],
    );
  }

  /// `Survey Not Available`
  String get surveyNotAvailable {
    return Intl.message(
      'Survey Not Available',
      name: 'surveyNotAvailable',
      desc: '',
      args: [],
    );
  }

  /// `You Rejected this survey`
  String get youRejectedThisSurvey {
    return Intl.message(
      'You Rejected this survey',
      name: 'youRejectedThisSurvey',
      desc: '',
      args: [],
    );
  }

  /// `You are not eligible for this survey`
  String get youAreNotEligibleForThisSurvey {
    return Intl.message(
      'You are not eligible for this survey',
      name: 'youAreNotEligibleForThisSurvey',
      desc: '',
      args: [],
    );
  }

  /// `Survey Panel Open`
  String get surveyPanelOpen {
    return Intl.message(
      'Survey Panel Open',
      name: 'surveyPanelOpen',
      desc: '',
      args: [],
    );
  }

  /// `User Rejected Survey`
  String get userRejectedSurvey {
    return Intl.message(
      'User Rejected Survey',
      name: 'userRejectedSurvey',
      desc: '',
      args: [],
    );
  }

  /// `User Not Eligible`
  String get userNotEligible {
    return Intl.message(
      'User Not Eligible',
      name: 'userNotEligible',
      desc: '',
      args: [],
    );
  }

  /// `Inbrain`
  String get inbrain {
    return Intl.message('Inbrain', name: 'inbrain', desc: '', args: []);
  }

  /// `Pollfish`
  String get pollfish {
    return Intl.message('Pollfish', name: 'pollfish', desc: '', args: []);
  }

  /// `WebView is loading (progress`
  String get webViewIsLoadingProgress {
    return Intl.message(
      'WebView is loading (progress',
      name: 'webViewIsLoadingProgress',
      desc: '',
      args: [],
    );
  }

  /// `Page started loading`
  String get pageStartedLoading {
    return Intl.message(
      'Page started loading',
      name: 'pageStartedLoading',
      desc: '',
      args: [],
    );
  }

  /// `Page finished loading`
  String get pageFinishedLoading {
    return Intl.message(
      'Page finished loading',
      name: 'pageFinishedLoading',
      desc: '',
      args: [],
    );
  }

  /// `Page resource error`
  String get pageResourceError {
    return Intl.message(
      'Page resource error',
      name: 'pageResourceError',
      desc: '',
      args: [],
    );
  }

  /// `code`
  String get code {
    return Intl.message('code', name: 'code', desc: '', args: []);
  }

  /// `description`
  String get description {
    return Intl.message('description', name: 'description', desc: '', args: []);
  }

  /// `errorType`
  String get errorType {
    return Intl.message('errorType', name: 'errorType', desc: '', args: []);
  }

  /// `isForMainFrame`
  String get isForMainFrame {
    return Intl.message(
      'isForMainFrame',
      name: 'isForMainFrame',
      desc: '',
      args: [],
    );
  }

  /// `blocking navigation to`
  String get blockingNavigationTo {
    return Intl.message(
      'blocking navigation to',
      name: 'blockingNavigationTo',
      desc: '',
      args: [],
    );
  }

  /// `allowing navigation to`
  String get allowingNavigationTo {
    return Intl.message(
      'allowing navigation to',
      name: 'allowingNavigationTo',
      desc: '',
      args: [],
    );
  }

  /// `url change to`
  String get urlChangeTo {
    return Intl.message(
      'url change to',
      name: 'urlChangeTo',
      desc: '',
      args: [],
    );
  }

  /// `Please wait till loaded`
  String get pleaseWaitTillLoaded {
    return Intl.message(
      'Please wait till loaded',
      name: 'pleaseWaitTillLoaded',
      desc: '',
      args: [],
    );
  }

  /// `Showing ads`
  String get showingAds {
    return Intl.message('Showing ads', name: 'showingAds', desc: '', args: []);
  }

  /// `Dismissed`
  String get dismissed {
    return Intl.message('Dismissed', name: 'dismissed', desc: '', args: []);
  }

  /// `Admob Video Ads`
  String get admobVideoAds {
    return Intl.message(
      'Admob Video Ads',
      name: 'admobVideoAds',
      desc: '',
      args: [],
    );
  }

  /// `You Have Earned 10 Coins`
  String get youHaveEarned10Coins {
    return Intl.message(
      'You Have Earned 10 Coins',
      name: 'youHaveEarned10Coins',
      desc: '',
      args: [],
    );
  }

  /// `Email doesn't exist`
  String get emailDoesNotExist {
    return Intl.message(
      'Email doesn\'t exist',
      name: 'emailDoesNotExist',
      desc: '',
      args: [],
    );
  }

  /// `Wrong OTP`
  String get wrongOTP {
    return Intl.message('Wrong OTP', name: 'wrongOTP', desc: '', args: []);
  }

  /// `Password reset failed`
  String get passwordResetFailed {
    return Intl.message(
      'Password reset failed',
      name: 'passwordResetFailed',
      desc: '',
      args: [],
    );
  }

  /// `Password Update Failed`
  String get passwordUpdateFailed {
    return Intl.message(
      'Password Update Failed',
      name: 'passwordUpdateFailed',
      desc: '',
      args: [],
    );
  }

  /// `Already Rewarded. Please Try Again Tomorrow`
  String get alreadyRewardedPleaseTryAgainTomorrow {
    return Intl.message(
      'Already Rewarded. Please Try Again Tomorrow',
      name: 'alreadyRewardedPleaseTryAgainTomorrow',
      desc: '',
      args: [],
    );
  }

  /// `Daily Reward Update Failed`
  String get dailyRewardUpdateFailed {
    return Intl.message(
      'Daily Reward Update Failed',
      name: 'dailyRewardUpdateFailed',
      desc: '',
      args: [],
    );
  }

  /// `Authorization Failed`
  String get authorizationFailed {
    return Intl.message(
      'Authorization Failed',
      name: 'authorizationFailed',
      desc: '',
      args: [],
    );
  }

  /// `User Already Exist`
  String get userAlreadyExist {
    return Intl.message(
      'User Already Exist',
      name: 'userAlreadyExist',
      desc: '',
      args: [],
    );
  }

  /// `Error While Editing Profile`
  String get errorWhileEditingProfile {
    return Intl.message(
      'Error While Editing Profile',
      name: 'errorWhileEditingProfile',
      desc: '',
      args: [],
    );
  }

  /// `Error While Completing Profile`
  String get errorWhileCompletingProfile {
    return Intl.message(
      'Error While Completing Profile',
      name: 'errorWhileCompletingProfile',
      desc: '',
      args: [],
    );
  }

  /// `Error while logging out`
  String get errorWhileLoggingOut {
    return Intl.message(
      'Error while logging out',
      name: 'errorWhileLoggingOut',
      desc: '',
      args: [],
    );
  }

  /// `Error while logging out`
  String get failedToLoadVideo {
    return Intl.message(
      'Error while logging out',
      name: 'failedToLoadVideo',
      desc: '',
      args: [],
    );
  }

  /// `Your purchase code is not valid. Please buy our product from envato to get a new purchase code`
  String get yourPurchaseCodeIsNotValid {
    return Intl.message(
      'Your purchase code is not valid. Please buy our product from envato to get a new purchase code',
      name: 'yourPurchaseCodeIsNotValid',
      desc: '',
      args: [],
    );
  }

  /// `Token Update Failed`
  String get tokenUpdateFailed {
    return Intl.message(
      'Token Update Failed',
      name: 'tokenUpdateFailed',
      desc: '',
      args: [],
    );
  }

  /// `No Offer Found`
  String get noOfferFound {
    return Intl.message(
      'No Offer Found',
      name: 'noOfferFound',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred. Please try again`
  String get anErrorOccurredPleaseTryAgain {
    return Intl.message(
      'An error occurred. Please try again',
      name: 'anErrorOccurredPleaseTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `An Error Happened. Please Try Again`
  String get anErrorHappenedPleaseTryAgain {
    return Intl.message(
      'An Error Happened. Please Try Again',
      name: 'anErrorHappenedPleaseTryAgain',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'af'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'az'),
      Locale.fromSubtags(languageCode: 'bn'),
      Locale.fromSubtags(languageCode: 'bs'),
      Locale.fromSubtags(languageCode: 'cs'),
      Locale.fromSubtags(languageCode: 'da'),
      Locale.fromSubtags(languageCode: 'de'),
      Locale.fromSubtags(languageCode: 'el'),
      Locale.fromSubtags(languageCode: 'es'),
      Locale.fromSubtags(languageCode: 'fa'),
      Locale.fromSubtags(languageCode: 'fi'),
      Locale.fromSubtags(languageCode: 'fr'),
      Locale.fromSubtags(languageCode: 'ha'),
      Locale.fromSubtags(languageCode: 'he'),
      Locale.fromSubtags(languageCode: 'hi'),
      Locale.fromSubtags(languageCode: 'hr'),
      Locale.fromSubtags(languageCode: 'hu'),
      Locale.fromSubtags(languageCode: 'id'),
      Locale.fromSubtags(languageCode: 'it'),
      Locale.fromSubtags(languageCode: 'ja'),
      Locale.fromSubtags(languageCode: 'kk'),
      Locale.fromSubtags(languageCode: 'km'),
      Locale.fromSubtags(languageCode: 'kn'),
      Locale.fromSubtags(languageCode: 'ko'),
      Locale.fromSubtags(languageCode: 'ku'),
      Locale.fromSubtags(languageCode: 'lo'),
      Locale.fromSubtags(languageCode: 'mr'),
      Locale.fromSubtags(languageCode: 'ms'),
      Locale.fromSubtags(languageCode: 'my'),
      Locale.fromSubtags(languageCode: 'ne'),
      Locale.fromSubtags(languageCode: 'nl'),
      Locale.fromSubtags(languageCode: 'pl'),
      Locale.fromSubtags(languageCode: 'pt'),
      Locale.fromSubtags(languageCode: 'ro'),
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'si'),
      Locale.fromSubtags(languageCode: 'sk'),
      Locale.fromSubtags(languageCode: 'sq'),
      Locale.fromSubtags(languageCode: 'sr'),
      Locale.fromSubtags(languageCode: 'sv'),
      Locale.fromSubtags(languageCode: 'sw'),
      Locale.fromSubtags(languageCode: 'ta'),
      Locale.fromSubtags(languageCode: 'th'),
      Locale.fromSubtags(languageCode: 'ti'),
      Locale.fromSubtags(languageCode: 'tr'),
      Locale.fromSubtags(languageCode: 'uk'),
      Locale.fromSubtags(languageCode: 'ur'),
      Locale.fromSubtags(languageCode: 'vi'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

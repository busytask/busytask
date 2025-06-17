import 'package:cash_rocket/constant%20app%20information/const_information.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// const kMainColor = Color(0xFF3F8CFF);
const kMainColor = Color(0xff0DA6C2);
const kGreyTextColor = Color(0xFF818181);
const containerColor = Color(0xff262450);
const kBorderColorTextField = Color(0xFFE8E7E5);
const kMainBacgrundColor = Color(0xff262450);
const kShadowColor = Color(0xff0E3E7B);
const kDarkWhite = Color(0xFFF1F7F7);
const kTitleColor = Color(0xFF030303);
const kWhite = Color(0xffFFFFFF);
Color textFiledBorderColor = const Color(0xffFFFFFF).withOpacity(0.30);
Color fillColor = const Color(0xffFFFFFF).withOpacity(0.05);
const kDarkSecondaryColor = Color(0xFF212741);
const kBalanceGradiant = LinearGradient(colors: [Color(0xffFFCE56), Color(0xffEF9606)]);

List<String> spinData = [];
String spinFee = "0";
int maxFailedLoadAttempts = 3;

///___________Purchase_code_______________________________
String purchaseCode = '3e873705-9a73-4a00-81f9-1f2fbef74e66';

// Pollfish basic configuration options
const String androidApiKey = '363e1f40-882b-4934-aaff-20d9fa489b41';
const String iOSApiKey = 'IOS_API_KEY';
const bool releaseMode = false;

//Bitlab Integration
const String appToken = '0d08c9e5-d910-4b5a-b323-60ad35784f4b';

//inbrain integration
const String inbrainUrl = 'https://www.surveyb.in/configuration?params=d09LZVE4eXduR3RNZzRNbDRQbTJ2TWNESVVkbXdtcmRsTDNhTkw2N29OY29GZmJab2NoT1h1T2ZDU1Q4akxldUJCSVpCY3pPeXpiQUtjSitnenNrZW9sU20zSGxuTlFNR0dvSFdlRGVGa1AzWHYrZnBERTVCTWRSSzVRY3VsSnE5bGV0Y1pUSnlGMjdZdGUyVEJBZk9SZ3lTc1pPWll3cUdPQlBKV3FJL0JWcDJkYktKQUdEWHhNRGNYNlFwNWVuV0ZWSlNFQzFnZW9LeEdlRXdibFk5MmVOelRacVB5Y2tQNnBQUEtyU3NYQT0app_uid=';

final kTextStyle = GoogleFonts.manrope(
  color: Colors.white,
);

final mediumTextStyle = GoogleFonts.manrope(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 14);

final boldTextStyle = GoogleFonts.manrope(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24);

const bottomButtonColor = Color(0xff7B78AA);

LinearGradient buttonGradiant = const LinearGradient(colors: [
  Color(0xff0DA6C2),
  Color(0xff0E39C6),
]);
LinearGradient containerGradiant = const LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
  Color(0xff0DA6C2),
  Color(0xff0E39C6),
]);
const kButtonDecoration = BoxDecoration(
  gradient: LinearGradient(colors: [
    Color(0xff0DA6C2),
    Color(0xff0E39C6),
  ]),
  borderRadius: BorderRadius.all(
    Radius.circular(8.0),
  ),
);

InputDecoration kInputDecoration = InputDecoration(
  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
  hintStyle: TextStyle(color: kLightTextColor),
  labelStyle: kTextStyle.copyWith(color: kWhite),
  filled: true,
  fillColor: kWhite.withOpacity(0.05),
  enabledBorder: OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
    borderSide: BorderSide(color: kWhite.withOpacity(0.3), width: 1),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
    borderSide: BorderSide(color: kWhite.withOpacity(0.3), width: 1),
  ),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(10.0),
    borderSide: const BorderSide(color: kBorderColorTextField),
  );
}

final otpInputDecoration = InputDecoration(
  contentPadding: const EdgeInsets.symmetric(vertical: 5.0),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

List<String> businessCategory = ['Fashion Store', 'Electronics Store', 'Computer Store', 'Vegetable Store', 'Sweet Store', 'Meat Store'];
List<String> language = ['English', 'Bengali', 'Hindi', 'Urdu', 'French', 'Spanish'];

List<String> productCategory = ['Fashion', 'Electronics', 'Computer', 'Gadgets', 'Watches', 'Cloths'];

List<String> userRole = [
  'Super Admin',
  'Admin',
  'User',
];

List<String> paymentType = [
  'Cheque',
  'Deposit',
  'Cash',
  'Transfer',
  'Sales',
];
List<String> posStats = [
  'Daily',
  'Monthly',
  'Yearly',
];
List<String> saleStats = [
  'Weekly',
  'Monthly',
  'Yearly',
];

const String sdkKey = "_f0BQOs31IIZKuF5T6sPNbXpNKTHaXU4abr7m1xHIqtyZJExud5E2ypR6yHvT_tye3k_EOJQ_30vHw4mg109DS";

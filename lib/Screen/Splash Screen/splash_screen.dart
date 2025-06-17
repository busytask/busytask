// ignore_for_file: use_build_context_synchronously

import 'package:cash_rocket/Provider/database_provider.dart';
import 'package:cash_rocket/Screen/Home%20Screen/home.dart';
import 'package:cash_rocket/Screen/Home%20Screen/no_internet_screen.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../../Model/purchase_model.dart';
import '../../Repositories/authentication_repo.dart';
import '../../Repositories/rewards_repo.dart';
import '../../constant app information/const_information.dart';
import '../../language/language_provider.dart';
import 'on_board.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
    setLanguage();
  }

  void setLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    String selectedLanguage = prefs.getString('savedLanguage') ?? 'English';
    selectedLanguage == 'English'
        ? context.read<LanguageChangeProvider>().changeLocale("en")
        : selectedLanguage == "Swahili"
            ? context.read<LanguageChangeProvider>().changeLocale("sw")
            : selectedLanguage == 'Arabic'
                ? context.read<LanguageChangeProvider>().changeLocale("ar")
                : selectedLanguage == 'Spanish'
                    ? context.read<LanguageChangeProvider>().changeLocale("es")
                    : selectedLanguage == 'Hindi'
                        ? context.read<LanguageChangeProvider>().changeLocale("hi")
                        : selectedLanguage == 'France'
                            ? context.read<LanguageChangeProvider>().changeLocale("fr")
                            : selectedLanguage == "Bengali"
                                ? context.read<LanguageChangeProvider>().changeLocale("bn")
                                : selectedLanguage == "Turkish"
                                    ? context.read<LanguageChangeProvider>().changeLocale("tr")
                                    : selectedLanguage == "Chinese"
                                        ? context.read<LanguageChangeProvider>().changeLocale("zh")
                                        : selectedLanguage == "Japanese"
                                            ? context.read<LanguageChangeProvider>().changeLocale("ja")
                                            : selectedLanguage == "Romanian"
                                                ? context.read<LanguageChangeProvider>().changeLocale("ro")
                                                : selectedLanguage == "Germany"
                                                    ? context.read<LanguageChangeProvider>().changeLocale("de")
                                                    : selectedLanguage == "Vietnamese"
                                                        ? context.read<LanguageChangeProvider>().changeLocale("vi")
                                                        : selectedLanguage == "Italian"
                                                            ? context.read<LanguageChangeProvider>().changeLocale("it")
                                                            : selectedLanguage == "Thai"
                                                                ? context.read<LanguageChangeProvider>().changeLocale("th")
                                                                : selectedLanguage == "Portuguese"
                                                                    ? context.read<LanguageChangeProvider>().changeLocale("pt")
                                                                    : selectedLanguage == "Hebrew"
                                                                        ? context.read<LanguageChangeProvider>().changeLocale("he")
                                                                        : selectedLanguage == "Polish"
                                                                            ? context.read<LanguageChangeProvider>().changeLocale("pl")
                                                                            : selectedLanguage == "Hungarian"
                                                                                ? context.read<LanguageChangeProvider>().changeLocale("hu")
                                                                                : selectedLanguage == "Finland"
                                                                                    ? context.read<LanguageChangeProvider>().changeLocale("fi")
                                                                                    : selectedLanguage == "Korean"
                                                                                        ? context.read<LanguageChangeProvider>().changeLocale("ko")
                                                                                        : selectedLanguage == "Malay"
                                                                                            ? context.read<LanguageChangeProvider>().changeLocale("ms")
                                                                                            : selectedLanguage == "Indonesian"
                                                                                                ? context.read<LanguageChangeProvider>().changeLocale("id")
                                                                                                : selectedLanguage == "Ukrainian"
                                                                                                    ? context.read<LanguageChangeProvider>().changeLocale("uk")
                                                                                                    : selectedLanguage == "Bosnian"
                                                                                                        ? context.read<LanguageChangeProvider>().changeLocale("bs")
                                                                                                        : selectedLanguage == "Greek"
                                                                                                            ? context.read<LanguageChangeProvider>().changeLocale("el")
                                                                                                            : selectedLanguage == "Dutch"
                                                                                                                ? context.read<LanguageChangeProvider>().changeLocale("nl")
                                                                                                                : selectedLanguage == "Urdu"
                                                                                                                    ? context.read<LanguageChangeProvider>().changeLocale("ur")
                                                                                                                    : selectedLanguage == "Sinhala"
                                                                                                                        ? context.read<LanguageChangeProvider>().changeLocale("si")
                                                                                                                        : selectedLanguage == "Persian"
                                                                                                                            ? context.read<LanguageChangeProvider>().changeLocale("fa")
                                                                                                                            : selectedLanguage == "Serbian"
                                                                                                                                ? context.read<LanguageChangeProvider>().changeLocale("sr")
                                                                                                                                : selectedLanguage == "Khmer"
                                                                                                                                    ? context.read<LanguageChangeProvider>().changeLocale("km")
                                                                                                                                    : selectedLanguage == "Lao"
                                                                                                                                        ? context.read<LanguageChangeProvider>().changeLocale("lo")
                                                                                                                                        : selectedLanguage == "Russian"
                                                                                                                                            ? context.read<LanguageChangeProvider>().changeLocale("ru")
                                                                                                                                            : selectedLanguage == "Kannada"
                                                                                                                                                ? context.read<LanguageChangeProvider>().changeLocale("kn")
                                                                                                                                                : selectedLanguage == "Marathi"
                                                                                                                                                    ? context.read<LanguageChangeProvider>().changeLocale("mr")
                                                                                                                                                    : selectedLanguage == "Tamil"
                                                                                                                                                        ? context.read<LanguageChangeProvider>().changeLocale("ta")
                                                                                                                                                        : selectedLanguage == "Afrikaans"
                                                                                                                                                            ? context.read<LanguageChangeProvider>().changeLocale("af")
                                                                                                                                                            : selectedLanguage == "Czech"
                                                                                                                                                                ? context.read<LanguageChangeProvider>().changeLocale("cs")
                                                                                                                                                                : selectedLanguage == "Swedish"
                                                                                                                                                                    ? context.read<LanguageChangeProvider>().changeLocale("sv")
                                                                                                                                                                    : selectedLanguage == "Slovak"
                                                                                                                                                                        ? context.read<LanguageChangeProvider>().changeLocale("sk")
                                                                                                                                                                        : selectedLanguage == "Swahili"
                                                                                                                                                                            ? context.read<LanguageChangeProvider>().changeLocale("sw")
                                                                                                                                                                            : selectedLanguage == "Burmese"
                                                                                                                                                                                ? context.read<LanguageChangeProvider>().changeLocale("my")
                                                                                                                                                                                : selectedLanguage == "Albanian"
                                                                                                                                                                                    ? context.read<LanguageChangeProvider>().changeLocale("sq")
                                                                                                                                                                                    : selectedLanguage == "Danish"
                                                                                                                                                                                        ? context.read<LanguageChangeProvider>().changeLocale("da")
                                                                                                                                                                                        : selectedLanguage == "Azerbaijani"
                                                                                                                                                                                            ? context.read<LanguageChangeProvider>().changeLocale("az")
                                                                                                                                                                                            : selectedLanguage == "Kazakh"
                                                                                                                                                                                                ? context.read<LanguageChangeProvider>().changeLocale("kk")
                                                                                                                                                                                                : selectedLanguage == "Croatian"
                                                                                                                                                                                                    ? context.read<LanguageChangeProvider>().changeLocale("hr")
                                                                                                                                                                                                    : selectedLanguage == "Nepali"
                                                                                                                                                                                                        ? context.read<LanguageChangeProvider>().changeLocale("ne")
                                                                                                                                                                                                        : context.read<LanguageChangeProvider>().changeLocale("en");
    // selectedLanguage == 'Arabic' ? isArabic = true : isArabic = false;
  }

  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 2));
    defaultBlurRadius = 10.0;
    defaultSpreadRadius = 0.5;
    String token = await DataBase().retrieveString('token') ?? '';
    // bool result = await InternetConnectionChecker().hasConnection;
    bool result = await InternetConnection().hasInternetAccess;

    if (result) {
      bool isValid = await PurchaseModel().isActiveBuyer();
      if (isValid) {
        if (token != '') {
          bool ads = await RewardRepo().getAdNetWorks();
          bool status = await AuthRepo().updateToken();
          if (status || ads) {
            const Home().launch(context, isNewTask: true);
          } else {
            const OnBoard().launch(context, isNewTask: true);
          }
        } else {
          const OnBoard().launch(context, isNewTask: true);
        }
      } else {
        showLicense(context: context);
      }
    } else {
      const NoInternetScreen(
        screenName: SplashScreen(),
      ).launch(context);
    }
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          Center(
              child: Image.asset(
            splashLogo,
            height: 204,
            width: 204,
          )),
          Spacer(),
        ],
      ),
    );
  }
}

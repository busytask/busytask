import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart' as pro;
import 'package:shared_preferences/shared_preferences.dart';
import 'Screen/Constant Data/constant.dart';
import 'Screen/Splash Screen/splash_screen.dart';
import 'Theme/theme.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart';
import 'language/language_provider.dart';
import 'dart:io' show Platform;

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.cubeGrid
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.white
    ..backgroundColor = kMainColor
    ..indicatorColor = Colors.white
    ..textColor = Colors.white
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false;
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isAndroid) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } else {
    await Firebase.initializeApp();
  }
  MobileAds.instance.initialize();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String savedTheme = prefs.getString('theme') ?? 'system';
  // Set the default theme based on the savedTheme
  if (savedTheme == 'light') {
    _themeManager.toggleTheme(false);
  } else if (savedTheme == 'dark') {
    _themeManager.toggleTheme(true);
  } else {
    _themeManager.toggleTheme(false);
  }

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
  configLoading();
}

ThemeManager _themeManager = ThemeManager();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    _themeManager.removeListener(themeListener);
    super.dispose();
  }

  @override
  void initState() {
    _themeManager.addListener(themeListener);
    super.initState();
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return pro.ChangeNotifierProvider<LanguageChangeProvider>(
      create: (context) => LanguageChangeProvider(),
      child: Builder(
        builder: (context) => MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: pro.Provider.of<LanguageChangeProvider>(context, listen: true).currentLocale,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          title: 'Cash Rocket',
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: _themeManager.themeMode,
          home: const SplashScreen(),
          builder: EasyLoading.init(),
        ),
      ),
    );
  }
}

class ThemeButton extends StatefulWidget {
  const ThemeButton({super.key});

  @override
  State<ThemeButton> createState() => _ThemeButtonState();
}

class _ThemeButtonState extends State<ThemeButton> {
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return ListTile(
      visualDensity: const VisualDensity(horizontal: -4),
      leading: Icon(
        IconlyLight.graph,
        color: isDark ? darkGreyTextColor : lightGreyTextColor,
      ),
      title: Text(
        isDark ? 'Dark Theme' : 'Light Theme',
        style: kTextStyle.copyWith(color: isDark ? darkTitleColor : lightTitleColor),
      ),
      trailing: Transform.scale(
        scale: 0.7,
        child: Switch(
          // activeTrackColor: kPrimaryColor,
          activeColor: Colors.white,
          inactiveTrackColor: kBorderColorTextField,
          activeTrackColor: kMainColor,
          value: _themeManager.themeMode == ThemeMode.dark,
          onChanged: (newValue) async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            newValue ? await prefs.setString('theme', 'dark') : await prefs.setString('theme', 'light');
            setState(() {
              _themeManager.toggleTheme(newValue);
            });
          },
        ),
      ),
    );
  }
}

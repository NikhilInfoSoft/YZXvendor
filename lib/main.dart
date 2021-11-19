
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:xyx_vendor/common/app_colors.dart';
import 'package:xyx_vendor/screens/authantication/splash_screen/splash_screen.dart';

import 'Localizations/localization.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          appBarTheme: AppBarTheme(
            color: AppColors.primary,
          ),
          buttonTheme: ButtonThemeData(
            buttonColor: AppColors.btnColor,
            textTheme: ButtonTextTheme.normal,
          ),
          fontFamily: "Inter",
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              primary: AppColors.btnColor, // background
              onPrimary: AppColors.white, // foreground
            ),
          ),),
      localizationsDelegates: [
        const AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      localeResolutionCallback:
          (Locale? locale, Iterable<Locale> supportedLocales) {
        for (Locale supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale!.languageCode ||
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      supportedLocales: [
        const Locale('en', ''),
        const Locale('es', ''),
      ],
      home: SplashScreen(),
    );
  }
}

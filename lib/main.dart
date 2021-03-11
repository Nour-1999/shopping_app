import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shopping_app/Screen/ContentApp/FirstScreen.dart';
import 'package:shopping_app/Screen/ContentDrawerItem/AboutAppScreen.dart';
import 'package:shopping_app/Screen/ContentDrawerItem/MyActivitiesScreen.dart';
import 'package:shopping_app/Screen/ContentDrawerItem/MyCartScreen.dart';
import 'package:shopping_app/Screen/ContentDrawerItem/MyPurchasesScreen.dart';
import 'package:shopping_app/Screen/ContentDrawerItem/SettingScreen.dart';
import 'package:shopping_app/Screen/FormScreens/LogInScreen.dart';
import 'package:shopping_app/Screen/FormScreens/SignUpForm.dart';
import 'package:shopping_app/Screen/SettingScreens/ChangeLanguage.dart';
import 'package:shopping_app/Screen/SettingScreens/ChangePassword.dart';
import 'package:shopping_app/Screen/SplashScreens/SplashScreen.dart';
import 'package:shopping_app/generated/l10n.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        theme: ThemeData(
          primarySwatch: Colors.indigo,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {
          SplashScreenClass.id: (context) => SplashScreenClass(),
          LogInForm.id: (context) => LogInForm(),
          SignUpScreen.id: (context) => SignUpScreen(),
          ChangePassword.id: (context) => ChangePassword(),
          MainScreen.id: (context) => MainScreen(),
          SettingScreen.id: (context) => SettingScreen(),
          MyCartScreen.id: (context) => MyCartScreen(),
          MyPurchasesScreen.id: (context) => MyPurchasesScreen(),
          MyActivitiesScreen.id: (context) => MyActivitiesScreen(),
          AboutAppScreen.id: (context) => AboutAppScreen(),
          ChangeLanguage.id:(context)=>ChangeLanguage(),
        },
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          S.delegate
        ],
        supportedLocales: S.delegate.supportedLocales,
        initialRoute: SplashScreenClass.id);
  }
}

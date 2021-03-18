import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:page_transition/page_transition.dart';
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
import 'package:shopping_app/generated/l10n.dart';
import 'package:shopping_app/widgets/Constants.dart';


class SplashScreenClass extends StatefulWidget {
  static const String id = 'SplashScreen';
  @override
  _SplashScreenClassState createState() => new _SplashScreenClassState();
}

class _SplashScreenClassState extends State<SplashScreenClass> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        title: 'Clean Code',
        home: AnimatedSplashScreen(
            duration: 3000,
            splash: Icon(Icons.shopping_cart_outlined,color: Colors.white,size: 100),
            nextScreen: LogInForm(),
            splashTransition: SplashTransition.fadeTransition,
            pageTransitionType: PageTransitionType.scale,
            backgroundColor: ColorApp
        )
    );
  }
}
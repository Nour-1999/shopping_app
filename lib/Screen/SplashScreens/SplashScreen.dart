import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shopping_app/Screen/FormScreens/LogInScreen.dart';
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
import 'package:flutter/material.dart';
import 'package:intro_views_flutter/Models/page_view_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:shopping_app/Screen/FormScreens/LogInScreen.dart';

import 'package:splashscreen/splashscreen.dart';

class SplashScreenClass extends StatefulWidget {
  static const String id = 'SplashScreen';

  @override
  _SplashScreenClassState createState() => new _SplashScreenClassState();
}
class _SplashScreenClassState extends State<SplashScreenClass> {
  @override
  final pages = [
    PageViewModel(
      pageColor: const Color(0xFF03A9F4),
      iconImageAssetPath: 'images/Online-Shopping-PNG.png',
      body: Text(
        'We  work  for  the  comfort ,  enjoy  your  shopping',
      ),
      title: Text(
        'Shopping',
      ),
      titleTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
      bodyTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
      mainImage: Image.asset(
        'images/Online-Shopping-Free-PNG-Image.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
    ),
    PageViewModel(
      pageColor: const Color(0xFF8BC34A),
      iconImageAssetPath: 'images/Delivery-PNG-Picture.png',
      body: Text(
        'Products arrive at your home',
      ),
      title: Text('Delivery'),
      mainImage: Image.asset(
        'images/Delivery-PNG-Pic.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      titleTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
      bodyTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
    ),
    PageViewModel(
      pageColor: const Color(0xFF607D8B),
      iconImageAssetPath: 'images/best-sales (1).png',
      body: Text(
        'Get the good offers',
      ),
      title: Text('Offers'),
      mainImage: Image.asset(
        'images/special-offer-png-4466.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      ),
      titleTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
      bodyTextStyle: TextStyle(fontFamily: 'MyFont', color: Colors.white),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IntroViews Flutter', //title of app
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ), //ThemeData
      home: Builder(
        builder: (context) => IntroViewsFlutter(
          pages,
          showNextButton: true,
          showBackButton: true,
          onTapDoneButton: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LogInForm(),
              ), //MaterialPageRoute
            );
          },
          pageButtonTextStyles: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ), //IntroViewsFlutter
      ), //Builder
    ); //Material App

  }
}

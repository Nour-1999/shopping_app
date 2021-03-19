import 'package:flutter/material.dart';
import 'package:shopping_app/generated/l10n.dart';
import 'file:///C:/Users/ASUS/AndroidStudioProjects/shopping_app/lib/constant/Constants.dart';

class MyCartScreen extends StatefulWidget {
  static const String id = 'MyCartScreen';
  @override
  _MyCartScreenState createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).MyCart,
          style: AppBarStyle,
        ),
        backgroundColor: ColorApp,
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}

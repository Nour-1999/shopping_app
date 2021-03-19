import 'package:flutter/material.dart';
import 'package:shopping_app/constant/Constants.dart';
import 'package:shopping_app/routs/splashRout/SplashScreen.dart';
import 'package:shopping_app/routs/introRout//IntroScreen.dart';
import 'package:shopping_app/generated/l10n.dart';


class ChangeLanguage extends StatefulWidget {
  static const String id = 'ChangeLanguage';
  @override
  _ChangeLanguageState createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {
  bool isSwitched = false;
  String _character = "English";
  Color color;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.of(context).ChangeLanguage,
          style: AppBarStyle,
        ),
        backgroundColor: ColorApp,
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: ListTile(

                leading: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20.0),
                          topLeft: Radius.circular(20.0)),
                    ),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("images/English.jpg"),
                    ),
                  ),
                ),
                title: Text(
                  S.of(context).English,
                  style: StyleTextWithIcon,
                ),

                onTap: () {
                  setState(() {
                    _character = "English";

                  });
                }
              ),
          ),
          Card(
            child: ListTile(
              leading: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.0),
                        topLeft: Radius.circular(20.0)),
                  ),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("images/Syria.png"),
                  ),
                ),
              ),
              title: Text(
                S.of(context).Arabic,
                style: StyleTextWithIcon,
              ),
              onTap: () {
                setState(() {
                  _character = "Arabic";

                });
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.0),
                        topLeft: Radius.circular(20.0)),
                  ),
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("images/german.png"),
                  ),
                ),
              ),
              title: Text(
                S.of(context).German,
                style: StyleTextWithIcon,
              ),
              onTap: () {
                setState(() {
                  _character = "German";

                });
              },
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 200.0, right: 100.0, left: 100.0),
            child: MaterialButton(
              child: Text(
                S.of(context).SubmitScreen,
                style: kTextStyle,
              ),
              height: 42.0,
              color: ColorApp,
              onPressed: () {
                setState(() {
                  if (_character == "English") {
                    S.load(Locale('en', 'US'));
                     Navigator.of(context).pushNamed(IntroScreenClass.id);
                  }
                  if (_character == "Arabic") {
                    S.load(Locale("ar", "AR"));
                  Navigator.of(context).pushNamed(IntroScreenClass.id);
                  }
                  if (_character == "German") {
                    S.load(Locale("gr", "GR"));
                   Navigator.of(context).pushNamed(SplashScreenClass.id);
                  }
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

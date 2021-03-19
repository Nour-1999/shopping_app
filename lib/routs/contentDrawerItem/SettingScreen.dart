import 'package:flutter/material.dart';
import 'package:shopping_app/routs/settingRout/ChangeLanguage.dart';
import 'package:shopping_app/routs/settingRout/ChangePassword.dart';
import 'package:shopping_app/routs/splashRout/SplashScreen.dart';
import 'package:shopping_app/generated/l10n.dart';
import 'file:///C:/Users/ASUS/AndroidStudioProjects/shopping_app/lib/constant/Constants.dart';

class SettingScreen extends StatefulWidget {
  static const String id = 'SettingScreen';
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  String _character="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            S.of(context).Setting,
            style: AppBarStyle,
          ),
          backgroundColor: ColorApp,
        ),
        body: Column(
          children:  <Widget>[

            Card(
              child: ListTile(
                leading: Icon(
                  Icons.lock_outline,
                  color: ColorIcons,
                ),
                title: Text(
                  S.of(context).ChangePasswordLabelText,
                  style: StyleTextWithIcon,
                ),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: ()
                {
                  setState(() {
                    Navigator.of(context).pushNamed(ChangePassword.id);

                  });
                },
              ),
            ),
         Card(
              child: ListTile(
                leading: Icon(
                  Icons.language,
                  color: ColorIcons,
                ),
                title: Text(
                  S.of(context).ChangeLanguage,
                  style: StyleTextWithIcon,
                ),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: ()
                {
                  setState(() {
                 Navigator.of(context).pushNamed(ChangeLanguage.id);

                  });
                },
              ),
            ),
          ],
        ),
    );
  }
}

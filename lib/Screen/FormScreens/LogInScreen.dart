import 'package:flutter/material.dart';
import 'package:shopping_app/Model/DatabaseServce.dart';
import 'package:shopping_app/Model/User.dart';
import 'package:shopping_app/Screen/ContentApp/Drawer.dart';
import 'package:shopping_app/Screen/ContentApp/FirstScreen.dart';
import 'package:shopping_app/Screen/FormScreens/SignUpForm.dart';
import 'package:shopping_app/generated/l10n.dart';
import 'package:shopping_app/widgets/Constants.dart';
import 'package:shopping_app/widgets/ReuseForm.dart';
import 'package:shopping_app/widgets/SubmitButton.dart';

class LogInForm extends StatefulWidget {
  static const String id = 'LogInForm';

  @override
  _LogInFormState createState() => _LogInFormState();
}




class _LogInFormState extends State<LogInForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _password = TextEditingController();
  FocusNode focusNode;
  String userName;
  String password;
  bool _formChanged = false;
  DatabaseService dbService = DatabaseService();
  Future<int> _getUserDetails(String userName) async
  {
    final UserModel user = await dbService.getUser(userName);
    print("user $user");
    if(user!=null)
    {
      if(user.password==password)
        {
        return 0; "login successful";
        }
      else{
        return 1; "username / password wrong";
      }
    }
    return null; "no username found ,please sign up ";
  }


  List data = [];
  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  Future<bool> _onWillPop() {
    if (!_formChanged) return Future<bool>.value(true);
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
              content: Text(
                S.of(context).AlertDialogContent,
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text(S.of(context).Cancel),
                  onPressed: () => Navigator.of(context).pop(false),
                  textColor: Colors.black,
                ),
                FlatButton(
                  child: Text(S.of(context).Abandon),
                  textColor: Colors.red,
                  onPressed: () => Navigator.pop(context, true),
                ),
              ],
            ) ??
            false;
      },
    );
  }

  String validatePassword(String value) {
    /// Password (Hard) Regex
    /// Allowing all character except 'whitespace'
    /// Must contains at least: 1 uppercase letter, 1 lowecase letter, 1 number, & 1 special character (symbol)
    /// Minimum character: 8
    //bool isHardPassword = value.isPasswordHard();

    if (value.isEmpty) {
      return 'Please enter password';
    } else {
//      if (!isHardPassword)
//        return 'Enter a hard password';
      if(value.length<7)
        return "Password should be minimum 7 characters";
      // ignore: unrelated_type_equality_checks
      if(_getUserDetails(userName)==1)

          {
           return"username / password wrong" ;

          }
        return null;
    }
  }

  void _onFormChange() {
    if (_formChanged) return;
    setState(() {
      _formChanged = true;
    });
  }

  Widget _buildUserName() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        initialValue: ' ',
        autofocus: true,
        keyboardType: TextInputType.name,
        validator: (value) {

          if (value.isEmpty) {
            return 'Please enter some text';
          }
          else if(_getUserDetails(value)==null)
            {
               return "no username found ,please sign up ";
            }
          return null;
        },
        style: TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),
        onSaved: (value) {
           userName = value;
        },
        onChanged: (value) {
          print(value);
        },
        decoration: InputDecoration(
            labelText: S.of(context).UserNameLabelText,
            border: OutlineInputBorder(),
            prefixIcon: Icon(
              Icons.person,
              color: ColorIcons,
            ),
            labelStyle: TextStyle(fontSize: 15)),
      ),
    );
  }

  Widget _buildPassword() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        obscureText: true,
        onSaved: (value) {
         password = value;
        },
        onChanged: (value) {
        print(value);
        },
        style: TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),
        decoration: InputDecoration(
            labelText: S.of(context).PasswordLabelText,
            border: OutlineInputBorder(),
            prefixIcon: Icon(
              Icons.lock_outline,
              color: ColorIcons,
          //    Color(0xFF1D1E33),
            ),
            labelStyle: TextStyle(fontSize: 15)),
        validator: (value) {
          return validatePassword(value);
        },
        controller: _password,
      ),
    );
  }

  Widget _buildSubmit() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SubmitButton(
        title: S.of(context).SubmitScreen,
        onPressed: () {
          if (_formKey.currentState.validate()) {
           _formKey.currentState.save();
            // _formKey.currentState.reset();
//           Navigator.of(context).pushNamed(LightDrawerPage.id);
           Navigator.pushAndRemoveUntil(
               context,
               MaterialPageRoute(
                   builder: (context) => LightDrawerPage()),
                   (route) => false);

              SnackBar(
                content: Text(S.of(context).PasswordLabelText),

            );
          };
        },
        colour: ColorApp,
      ),
    );
  }

  Widget _buildForgotPassword() {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Center(
        child: GestureDetector(
          child: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: S.of(context).ForgotYourPassword,
                  style:ActionText,
              ),
            ]),
          ),
          onTap: () {
            //   Navigator.of(context).pushNamed(ChangePassword.id);
          },
        ),
      ),
    );
  }

  Widget _buildSignUp() {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Center(
        child: GestureDetector(
          child: RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: S.of(context).DoNotHaveAnAccount,
                  style:beforeActionText,
              ),
              TextSpan(
                  text: S.of(context).buttonTitleSignUp,
                  style: ActionText,
              )
            ]),
          ),
          onTap: () {
            Navigator.of(context).pushNamed(SignUpScreen.id);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: ReuseForm(
          form: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Form(
                onChanged: _onFormChange,
                onWillPop: _onWillPop,
                key: _formKey,
                child: Column(
                  children: [
                    _buildUserName(),
                    _buildPassword(),
                    _buildSubmit(),
                    _buildForgotPassword(),
                    _buildSignUp(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

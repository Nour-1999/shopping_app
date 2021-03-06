import 'package:flutter/material.dart';
import 'package:shopping_app/Model/DatabaseServce.dart';
import 'package:shopping_app/Model/User.dart';
import 'package:shopping_app/constant/Constants.dart';
import 'package:shopping_app/routs/ContentApp/FirstScreen.dart';
import 'package:shopping_app/routs/formRoutes/SignUpForm.dart';
import 'package:shopping_app/generated/l10n.dart';
import 'package:shopping_app/widgets/ReuseForm.dart';
import 'package:shopping_app/widgets/SubmitButton.dart';

class LogInForm extends StatefulWidget {
  static const String id = 'LogInForm';

  @override
  _LogInFormState createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordTextEditingController = TextEditingController();
  String usernameValidator = "";
  String passwordValidator = "";
  FocusNode focusNode;
  String _username,_password;
  bool _formChanged = false;
  DatabaseService dbService = DatabaseService();

  Future<String> _getUserDetails(String userName,String password) async
  {
    final UserModel user = await dbService.getUser(userName);
    print("user $user");
    if(user!=null)
    {
      if(user.password==password)
        {
          return  "successful";
        }
      else{
        return  "Password";
      }
    }
    return "user";
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
      if(passwordValidator=="Password")
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

  Widget _buildUserName(BuildContext context) {
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
          else if(usernameValidator=="user")
            {
               return "no username found ,please sign up ";
            }
          return null;
        },
        style: TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),
        onSaved: (value) {
          print(value);
        },
        onChanged: (value) {
          print(value);
          _username = value;
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

  Widget _buildPassword(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        obscureText: true,
        onSaved: (value) {
          print(value);
        },
        onChanged: (value) {
        print(value);
        _password = value;
        },

        style: TextStyle(color: Colors.black, fontFamily: 'SFUIDisplay'),
        decoration: InputDecoration(
            labelText: S.of(context).PasswordLabelText,
            border: OutlineInputBorder(),
            prefixIcon: Icon(
              Icons.lock_outline,
              color: ColorIcons,
            ),
            labelStyle: TextStyle(fontSize: 15)),
        validator: (value) {
          return validatePassword(value);
        },
        controller: _passwordTextEditingController,
      ),
    );
  }

  Widget _buildSubmit(BuildContext context) {
     return   Padding(
          padding: const EdgeInsets.all(8.0),
          child: SubmitButton(
            title: S
                .of(context)
                .SubmitScreen,
            onPressed: () async {
              var response = await _getUserDetails(_username,_password);

              setState(() {
                this.usernameValidator = response;
                this.passwordValidator = response;
                print("usernameValidator$usernameValidator");
                print("response$response");
                print("passwordValidator$passwordValidator");

              });
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                // _formKey.currentState.reset();
//           Navigator.of(context).pushNamed(LightDrawerPage.id);
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MainScreen()),
                        (route) => false);
              };
            },
            colour: ColorApp,
          ),
        );
    }


  Widget _buildForgotPassword(BuildContext context) {
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

  Widget _buildSignUp(BuildContext context) {
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
                    _buildUserName(context),
                    _buildPassword(context),
                    _buildSubmit(context),
                    _buildForgotPassword(context),
                    _buildSignUp(context),
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

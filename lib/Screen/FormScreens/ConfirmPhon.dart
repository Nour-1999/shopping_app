import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:shopping_app/Screen/ContentApp/FirstScreen.dart';
import 'package:shopping_app/Screen/FormScreens/LogInScreen.dart';
import 'package:shopping_app/widgets/Constants.dart';
import 'package:shopping_app/widgets/SubmitButton.dart';


class OTPScreen extends StatefulWidget {
  final String phone;
  OTPScreen(this.phone);
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  String _verificationCode;
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  final BoxDecoration pinPutDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(
      color:ColorApp,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 30.0, right: 30.0, top: 30.0, bottom: 10),
              child: PinPut(
                fieldsCount: 6,
                textStyle: kTextStyle,
                eachFieldWidth: 13.0,
                eachFieldHeight: 8.0,
                focusNode: _pinPutFocusNode,
                controller: _pinPutController,
                submittedFieldDecoration: pinPutDecoration,
                selectedFieldDecoration: pinPutDecoration,
                followingFieldDecoration: pinPutDecoration,
                pinAnimationType: PinAnimationType.fade,
//                onSubmit: (pin) async {
//                  try {
//                    await FirebaseAuth.instance
//                        .signInWithCredential(PhoneAuthProvider.credential(
//                        verificationId: _verificationCode, smsCode: pin))
//                        .then((value) async {
//                      if (value.user != null) {
//                        Navigator.pushAndRemoveUntil(
//                            context,
//                            MaterialPageRoute(
//                                builder: (context) => LogInForm()),
//                                (route) => false);
//                      }
//                    });
//                  } catch (e) {
//                    FocusScope.of(context).unfocus();
//                    _scaffoldkey.currentState.showSnackBar(
//                      SnackBar(
//                        content: Text('invalid OTP'),
//                      ),
//                    );
//                  }
//                },
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 220, bottom: 80),
                child: Text(
                  "Resend code",
                  style: ActionText,
                ),
              ),
            ),
            SubmitButton(
              title: "Verify",
              onPressed: () {
                ///Test
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => MainScreen()),
                        (route) => false);

                ///Test
              //  _verifyPhone();
              },
            ),
          ],
        ),
      ),
    );
  }

//  _verifyPhone() async {
//    await FirebaseAuth.instance.verifyPhoneNumber(
//        phoneNumber: '+963${widget.phone}',
//        verificationCompleted: (PhoneAuthCredential credential) async {
//          await FirebaseAuth.instance
//              .signInWithCredential(credential)
//              .then((value) async {
//            if (value.user != null) {
//              Navigator.pushAndRemoveUntil(
//                  context,
//                  MaterialPageRoute(builder: (context) => MainScreen()),
//                      (route) => false);
//            }
//          });
//        },
////        verificationFailed: (FirebaseAuthException e) {
////          print(e.message);
////        },
//        codeSent: (String verficationID, int resendToken) {
//          setState(() {
//            _verificationCode = verficationID;
//          });
//        },
//        codeAutoRetrievalTimeout: (String verificationID) {
//          setState(() {
//            _verificationCode = verificationID;
//          });
//        },
//        timeout: Duration(seconds: 120));
//  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_verifyPhone();
  }
}

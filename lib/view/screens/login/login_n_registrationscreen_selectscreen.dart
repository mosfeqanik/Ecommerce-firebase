import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wowsell/view/common_widgets/animations/fade_animation.dart';

class LoginRegistrationSelectionpage extends StatefulWidget {
  @override
  _LoginRegistrationSelectionpageState createState() =>
      _LoginRegistrationSelectionpageState();
}

class _LoginRegistrationSelectionpageState
    extends State<LoginRegistrationSelectionpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  FadeAnimation(
                    1,
                    Text(
                      "Welcome",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FadeAnimation(
                    1.2,
                    Text(
                      "Automatic identity verification which enables you to verify your identity",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey[700], fontSize: 15),
                    ),
                  )
                ],
              ),
              FadeAnimation(
                1.4,
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/Illustration.png"))),
                ),
              ),
              Column(
                children: <Widget>[
                  FadeAnimation(
                    1.6,
                    MaterialButton(
                      minWidth: double.infinity,
                      color: Color.fromRGBO(4, 248, 207, 1),
                      elevation: 0,
                      height: 60,
                      onPressed: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                      },
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        "Login",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FadeAnimation(
                    1.8,
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border(
                            bottom: BorderSide(color: Colors.black),
                            top: BorderSide(color: Colors.black),
                            left: BorderSide(color: Colors.black),
                            right: BorderSide(color: Colors.black),
                          )),
                      child: MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: () {
                          // Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage()));
                        },
                        color: Color.fromRGBO(251, 243, 100, 1),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

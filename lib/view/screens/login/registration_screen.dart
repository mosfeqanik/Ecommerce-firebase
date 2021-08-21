import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:wowsell/view/common_widgets/animations/fade_animation.dart';
import 'package:wowsell/view/common_widgets/input_Password_Field.dart';
import 'package:wowsell/view/common_widgets/input_Text_Field.dart';
import 'package:wowsell/view/common_widgets/utils/custom_toast.dart';
import 'package:wowsell/view/screens/mainpage/navigation_bar_App_bar_Drawer.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController _emailEditController = TextEditingController();
  TextEditingController _passwordEditController = TextEditingController();

  bool _isBuyer = true;

  signup()async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailEditController.text,
          password: _passwordEditController.text
      );
      var authCredential = userCredential.user;
      print(authCredential.uid);
      if(authCredential.uid.isNotEmpty){
        Navigator.push(context, CupertinoPageRoute(builder: (__)=>NavbarAppbar()));
      }else{
        CustomToast.toast('Something is wrong');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        CustomToast.toast('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        CustomToast.toast('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height - 50,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  FadeAnimation(
                      1,
                      Text(
                        "Sign up",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  FadeAnimation(
                    1.2,
                    Text(
                      "Create an account, It's free",
                      style: TextStyle(fontSize: 15, color: Colors.grey[700]),
                    ),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  FadeAnimation(
                    1.2,
                    InputTextField(label: "Email"),
                  ),
                  FadeAnimation(
                    1.3,
                    InputPasswordField(inputTextEditController:_passwordEditController , label: "Password"),
                  ),
                ],
              ),
              Text(
                _isBuyer?"Buyer":"Seller",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
              Switch(
                  activeTrackColor: Color.fromRGBO(211,211,211,0.9),
                  activeColor: Color.fromRGBO(0, 0, 0, 1),
                  inactiveTrackColor: Color.fromRGBO(4, 248, 207, 1),
                  inactiveThumbColor: Color.fromRGBO(4, 248, 207, .9),
                  value: _isBuyer,
                  onChanged: (val) {
                    setState(() {
                      _isBuyer = val;
                      print(_isBuyer);
                    });
                  }),
              FadeAnimation(
                  1.5,
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border(
                        bottom: BorderSide(color: Colors.black),
                        top: BorderSide(color: Colors.black),
                        left: BorderSide(color: Colors.black),
                        right: BorderSide(color: Colors.black),
                      ),
                    ),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {},
                      color: Color.fromRGBO(4, 248, 207, 1),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 18),
                      ),
                    ),
                  )),
              FadeAnimation(
                  1.6,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Already have an account?"),
                      InkWell(
                        child: Text(
                          " Login",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                        onTap: () {
                          // Navigator.of(context).pushAndRemoveUntil(
                          //     MaterialPageRoute(
                          //         builder: (context) => LoginPage()),
                          //     (route) => false);
                        },
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

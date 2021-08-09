import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  // void initState() {
  //   Timer(Duration(seconds: 5),()=>
  //       Navigator.of(context).pushAndRemoveUntil(
  //       MaterialPageRoute(builder: (context) => LoginScreen()),
  //           (route) => false));
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromRGBO(250, 244, 211, 1.0),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(image: AssetImage("assets/images/wowsell_image.png")),
              SizedBox(
                height: 100,
              ),
              Text(
                "Delivering Happiness",
                style: TextStyle(
                    fontFamily: "Satisfy",
                    fontSize: 20,
                    color: Colors.black),
              ),
              SizedBox(
                height: 20,
              ),
              CircularProgressIndicator(
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

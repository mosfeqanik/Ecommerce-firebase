import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wowsell/view/screens/mainpage/navigation_bar_App_bar_Drawer.dart';

class ThankYouScreen extends StatefulWidget {
  @override
  _ThankYouScreenState createState() => _ThankYouScreenState();
}

class _ThankYouScreenState extends State<ThankYouScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), ()=>Navigator.of(context).pushAndRemoveUntil(
    MaterialPageRoute(builder: (context) => BottomNavController()),
    (route) => false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(image: AssetImage("assets/images/thankyou.jpg")),
              SizedBox(
                height: 30,
              ),
              Text(
                "Thank you For Being with us",
                style: TextStyle(
                    fontFamily: "Satisfy", fontSize: 20, color: Colors.black),
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

import 'package:flutter/material.dart';

class CheckOutPage extends StatefulWidget {

  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: SafeArea(
        child:Center(child: Text("i am checkOut")),
      ),
    );
  }
}

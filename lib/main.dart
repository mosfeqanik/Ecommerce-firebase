import 'package:flutter/material.dart';
import 'package:wowsell/view/screens/splashscreen.dart';

void main() => runApp(WowSellScreen());

class WowSellScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'note',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SplashScreen()
    );
  }
}


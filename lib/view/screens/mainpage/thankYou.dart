import 'dart:async';

import 'package:awesome_notifications/awesome_notifications.dart';
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
    Notify();
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
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Image.asset('assets/images/wowsell_image.png', height:200.0),
              ),
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
class LocalNotify extends StatefulWidget{
  @override
  _LocalNotifyState createState() => _LocalNotifyState();
}
class _LocalNotifyState extends State<LocalNotify>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {


          },
          child: Icon(Icons.call),

        ),
      ),
    );
  }
}
void Notify() async{
  String timezom = await AwesomeNotifications().getLocalTimeZoneIdentifier();
  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 1,
      channelKey: 'key1',
      title: 'WowSell',
      body: 'your Order is Complete.',

    ),
    schedule: NotificationInterval(interval: 3, timeZone: timezom,repeats: false),
  );
}
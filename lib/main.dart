// import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:wowsell/model/E_commerce_Provider_Data.dart';
import 'package:wowsell/view/screens/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // FirebaseMessaging.onBackgroundMessage(_firebasePushHandler);
  // AwesomeNotifications().initialize(
  //     null,[
  //   NotificationChannel(
  //       channelKey: 'key1',
  //       channelName: 'E-commerce',
  //       channelDescription: "Notification example",
  //       defaultColor: Colors.redAccent,
  //       ledColor: Colors.cyan,
  //       playSound: true,
  //       enableLights: true,
  //       enableVibration: true
  //   )
  // ]
  // );
  runApp(WowSellScreen());
}

class WowSellScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<EcommerceProvider>(
      create: (context){
        return EcommerceProvider();
      },
      child: ScreenUtilInit(
        designSize: Size(375, 812),
        builder: () => MaterialApp(
            debugShowCheckedModeBanner: false,
            home: SplashScreen()
        ),
      ),
    );
  }
}
//
// Future<void> _firebasePushHandler(RemoteMessage message) async{
//   print("Message from push notification is ${message.data}");
//   AwesomeNotifications().createNotificationFromJsonData(message.data);
// }

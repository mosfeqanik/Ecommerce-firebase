import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:wowsell/model/E_commerce_Provider_Data.dart';
import 'package:wowsell/view/screens/splashscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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


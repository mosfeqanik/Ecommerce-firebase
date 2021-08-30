import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wowsell/const/appcolor.dart';
import 'package:wowsell/view/common_widgets/share_pref.dart';
import 'package:wowsell/view/screens/login/Profile_View_Update.dart';
import 'package:wowsell/view/screens/login/login_n_registrationscreen_selectscreen.dart';
import 'package:wowsell/view/screens/mainpage/FavourtiePage.dart';
import 'package:wowsell/view/screens/mainpage/cart_page.dart';
import 'package:wowsell/view/screens/mainpage/homepage.dart';
import 'package:wowsell/view/screens/mainpage/notification_page.dart';
import 'package:wowsell/view/screens/mainpage/order_page.dart';
import 'package:wowsell/view/screens/mainpage/search_screen_page.dart';

class BottomNavController extends StatefulWidget {
  @override
  _BottomNavControllerState createState() => _BottomNavControllerState();
}

class _BottomNavControllerState extends State<BottomNavController> {
  var _page = 2;
  bool isLoggedIn;

  final pages = [
    NotificationPage(),
    OrderPage(),
    HomePage(),
    FavouritePage(),
    CartPage(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      bottomNavigationBar: CurvedNavigationBar(
        index: 2,
        color: Colors.white,
        animationCurve: Curves.easeIn,
        animationDuration: Duration(milliseconds: 600),
        buttonBackgroundColor: AppColors.qprimarycolor1,
        backgroundColor: Colors.black,
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        items: [
          Icon(
            FontAwesomeIcons.tag,
          ),
          Icon(
            Icons.bookmark_outlined,
          ),
          Icon(
            Icons.house,
          ),
          Icon(
            Icons.favorite_outlined,
          ),
          Icon(
            Icons.shopping_cart,
          ),
        ],
      ),
      body: pages[_page],
    );
  }
}



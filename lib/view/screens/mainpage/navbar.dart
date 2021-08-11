import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wowsell/view/screens/mainpage/cart_page.dart';
import 'package:wowsell/view/screens/mainpage/homepage.dart';
import 'package:wowsell/view/screens/mainpage/order_page.dart';

void main() => runApp(BottomNavbar());

class BottomNavbar extends StatefulWidget {
  @override
  _BottomNavbarState createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  var _page = 1;

  final pages = [
    OrderPage(),
    HomePage(),
    CartPage(),
  ];
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          bottomNavigationBar: CurvedNavigationBar(
            index: 1,
            color: Colors.white,
            backgroundColor: Colors.blue,
            animationCurve: Curves.easeIn,
            animationDuration: Duration(milliseconds: 600),
            onTap: (index) {
              setState(() {
                _page = index;
              });
            },
            items: [
              Icon(
                Icons.bookmark_added,
                size: 35,
              ),
              Icon(
                Icons.house,
                size: 35,
              ),
              Icon(
                FontAwesomeIcons.gamepad,
                size: 35,
              ),
            ],
          ),
          body: pages[_page],
        ));
  }
}

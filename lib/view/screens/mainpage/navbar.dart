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
          appBar: AppBar(
            title: Text(
              "WoWSell",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            elevation: 4.0,
            actions: [
              IconButton(
                icon: Icon(
                  Icons.person,
                  size: 25,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
            ],
            iconTheme: IconThemeData(color: Colors.black),
          ),
          drawer: Drawer(),
          bottomNavigationBar: CurvedNavigationBar(
            index: 1,
            color: Colors.white,
            animationCurve: Curves.easeIn,
            animationDuration: Duration(milliseconds: 600),
            buttonBackgroundColor: Colors.white,
            backgroundColor: Colors.black,
            onTap: (index) {
              setState(() {
                _page = index;
              });
            },
            items: [
              Icon(
                FontAwesomeIcons.bookmark,
                size: 25,
              ),
              Icon(
                Icons.house,
                size: 25,
              ),
              Icon(
                Icons.shopping_cart_outlined,
                size: 25,
              ),
            ],
          ),
          body: pages[_page],
        ));
  }
}

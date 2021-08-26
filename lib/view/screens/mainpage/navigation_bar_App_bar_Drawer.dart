import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:wowsell/components/cart.dart';
import 'package:wowsell/view/screens/login/login_n_registrationscreen_selectscreen.dart';
import 'package:wowsell/view/screens/mainpage/homepage.dart';
import 'package:wowsell/view/screens/product_details.dart';

class NavbarAppbar extends StatefulWidget {
  @override
  _NavbarAppbarState createState() => _NavbarAppbarState();
}

class _NavbarAppbarState extends State<NavbarAppbar> {
  var _page = 1;

  final pages = [
    ProductDetails(),
    HomePage(),
    Cart(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Icons.search,
              size: 25,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.person,
              size: 25,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LoginRegistrationSelectionpage()),
              );
            },
          ),
        ],
        iconTheme: IconThemeData(color: Colors.black),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: <Color>[
                Color.fromRGBO(4, 248, 207, 1),
                Color.fromRGBO(251, 243, 100, 1),
              ])),
              child: Container(
                child: Column(
                  children: [
                    Material(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      elevation: 10,
                      child: Image.asset(
                        "assets/images/wow_sell_round.png",
                        width: 100,
                        height: 100,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('E-Commerce application')
                  ],
                ),
              ),
            ),
            CustomListTile(
              icon: Icons.person,
              textTitle: "Group Members",
            ),
            CustomListTile(
              icon: Icons.star,
              textTitle: "Md Mosfeq Anik",
            ),
            CustomListTile(
              icon: Icons.star,
              textTitle: "Pritom Chowdhury",
            ),
            CustomListTile(
              icon: Icons.engineering,
              textTitle: "Supervised By",
            ),
            CustomListTile(
              icon: Icons.assistant_photo,
              textTitle: "Ebrahim Joy",
            ),
            Divider(),
            ListTile(
              title: Text('0.0.1'),
            )
          ],
        ),
      ),
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
    );
  }
}

class CustomListTile extends StatelessWidget {
  IconData? icon;
  String? textTitle;

  CustomListTile({this.icon, this.textTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Column(
          children: <Widget>[
            Divider(),
            ListTile(leading: Icon(icon), title: Text(textTitle!)),
          ],
        ),
      ),
    );
  }
}

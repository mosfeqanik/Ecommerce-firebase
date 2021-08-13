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
                  Icons.search,
                  size: 25,
                  color: Colors.black,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  size: 25,
                  color: Colors.black,
                ),
                onPressed: () {},
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
                  texttitle: "Group Members",
                  ontap: () => {},
                ),
                CustomListTile(
                  icon: Icons.star,
                  texttitle: "Md Mosfeq Anik",
                  ontap: () => {},
                ),
                CustomListTile(
                  icon: Icons.star,
                  texttitle: "Pritom Chowdhury",
                  ontap: () => {},
                ),
                CustomListTile(
                  icon: Icons.engineering,
                  texttitle: "Supervised By",
                  ontap: () => {},
                ),
                CustomListTile(
                  icon: Icons.assistant_photo,
                  texttitle: "Ebrahim Joy",
                  ontap: () => {},
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
        ));
  }
}

class CustomListTile extends StatelessWidget {
  IconData icon;
  String texttitle;
  Function ontap;

  CustomListTile({this.icon, this.texttitle, this.ontap});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Column(
          children: <Widget>[
            Divider(),
            ListTile(
                leading: Icon(icon),
                title: Text(texttitle)),
          ],
        ),
      ),
    );
  }
}
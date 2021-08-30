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
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => SearchScreen()),
                  (route) => false);
            },
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
                MaterialPageRoute(builder: (context) => ViewProfilePage()),
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
            CustomListTileForDrawer(
              icon: Icons.person,
              textTitle: "Group Members",
            ),
            CustomListTileForDrawer(
              icon: Icons.star,
              textTitle: "Md Mosfeq Anik",
            ),
            CustomListTileForDrawer(
              icon: Icons.star,
              textTitle: "Pritom Chowdhury",
            ),
            CustomListTileForDrawer(
              icon: Icons.engineering,
              textTitle: "Supervised By",
            ),
            CustomListTileForDrawer(
              icon: Icons.assistant_photo,
              textTitle: "Ebrahim Joy",
            ),
            Divider(),
            ListTile(
              leading: InkWell(
                  onTap: () {
                    Prefs.clearPref();
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => LoginRegistrationSelectionPage()),
                        (route) => false);
                  },
                  child: Text('LOG OUT')),
            )
          ],
        ),
      ),
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

class CustomListTileForDrawer extends StatelessWidget {
  IconData icon;
  String textTitle;

  CustomListTileForDrawer({this.icon, this.textTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Column(
          children: <Widget>[
            Divider(),
            ListTile(leading: Icon(icon), title: Text(textTitle)),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:wowsell/view/common_widgets/CustomTileForDrawer.dart';
import 'package:wowsell/view/common_widgets/share_pref.dart';
import 'package:wowsell/view/screens/login/Profile_View_Update.dart';
import 'package:wowsell/view/screens/login/login_n_registrationscreen_selectscreen.dart';
import 'package:wowsell/view/screens/mainpage/search_screen_page.dart';

class NotificationPage extends StatelessWidget {

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
      backgroundColor: Colors.green,
      body: Center(
        child: Text(
          'Notification Page',
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}

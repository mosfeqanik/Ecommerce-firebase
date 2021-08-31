import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wowsell/view/common_widgets/CustomTileForDrawer.dart';
import 'package:wowsell/view/common_widgets/share_pref.dart';
import 'package:wowsell/view/screens/login/Profile_View_Update.dart';
import 'package:wowsell/view/screens/login/login_n_registrationscreen_selectscreen.dart';
import 'package:wowsell/view/screens/mainpage/search_screen_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class OrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Order",
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
      body: SafeArea(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("users-order-data")
              .doc(FirebaseAuth.instance.currentUser.email)
              .collection("items")
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("Something is wrong"),
              );
            }
            if (snapshot.data.docs.isEmpty) {
              return Center(
                child: Text("You have not ordered anything",style:
                TextStyle(fontSize: 20.h),),
              );
            }
            return ListView.builder(
                itemCount:
                snapshot.data == null ? 0 : snapshot.data.docs.length,
                itemBuilder: (_, index) {
                  DocumentSnapshot _documentSnapshot =
                  snapshot.data.docs[index];
                  return Container(
                    margin:
                    EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          SizedBox(width: 20),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Address: ${_documentSnapshot['customerAddress']}",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 26.h),
                                maxLines: 2,
                              ),
                              Text(
                                  "Name: ${_documentSnapshot['customerName']}",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 26.h),
                                maxLines: 2,
                              ),
                              Text(
                                "Phone: ${_documentSnapshot['customerPhone']}",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 26.h),
                                maxLines: 2,
                              ),
                              SizedBox(height: 10),
                              Text.rich(
                                TextSpan(
                                  text: "\$ ${_documentSnapshot['totalPrice']}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18.sp,
                                      color: Colors.blue),
                                ),
                              )
                            ],
                          ),
                          Spacer(),
                          IconButton(
                              onPressed: () {
                                FirebaseFirestore.instance
                                    .collection("users-order-data")
                                    .doc(
                                    FirebaseAuth.instance.currentUser.email)
                                    .collection("items")
                                    .doc(_documentSnapshot.id)
                                    .delete();
                              },
                              icon: Icon(Icons.remove))
                        ],
                      ),
                    ),
                  );
                });
          },
        ),
      ),
    );
  }
}
